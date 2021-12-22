quantregcx = function(formula, tau = 0.5, data, subset, weights, na.action, 
          method = "br", model = TRUE, contrasts = NULL, ...) 
{
  call <- match.call()
  mf <- match.call(expand.dots = FALSE)
  m <- match(c("formula", "data", "subset", "weights", "na.action"), 
             names(mf), 0)
  mf <- mf[c(1, m)]
  mf$drop.unused.levels <- TRUE
  mf[[1]] <- as.name("model.frame")
  mf <- eval.parent(mf)
  if (method == "model.frame") 
    return(mf)
  mt <- attr(mf, "terms")
  weights <- as.vector(model.weights(mf))
  tau <- sort(unique(tau))
  eps <- .Machine$double.eps^(2/3)
  if (any(tau == 0)) 
    tau[tau == 0] <- eps
  if (any(tau == 1)) 
    tau[tau == 1] <- 1 - eps
  Y <- model.response(mf)
  if (method == "sfn") {
    if (requireNamespace("MatrixModels") && requireNamespace("Matrix")) {
      X <- MatrixModels::model.Matrix(mt, data, sparse = TRUE)
      vnames <- dimnames(X)[[2]]
      X <- as(X, "matrix.csr")
      mf$x <- X
    }
  }
  else {
    X <- model.matrix(mt, mf, contrasts)
    vnames <- dimnames(X)[[2]]
  }
  #print(X)
    Rho <- function(u, tau) u * (tau - (u < 0))
  if (length(tau) > 1) {
    if (any(tau < 0) || any(tau > 1)) 
      stop("invalid tau:  taus should be >= 0 and <= 1")
    coef <- matrix(0, ncol(X), length(tau))
    rho <- rep(0, length(tau))
    if (!(method %in% c("ppro", "qfnb", "pfnb"))) {
      fitted <- resid <- matrix(0, nrow(X), length(tau))
      for (i in 1:length(tau)) {
        z <- {
          if (length(weights)) 
            rq.wfit(X, Y, tau = tau[i], weights, method, 
                    ...)
          else rq.fit(X, Y, tau = tau[i], method, ...)
        }
        coef[, i] <- z$coefficients
        resid[, i] <- z$residuals
        rho[i] <- sum(Rho(z$residuals, tau[i]))
        fitted[, i] <- Y - z$residuals
      }
      taulabs <- paste("tau=", format(round(tau, 3)))
      dimnames(coef) <- list(vnames, taulabs)
      dimnames(resid)[[2]] <- taulabs
      fit <- z
      fit$coefficients <- coef
      fit$residuals <- resid
      fit$fitted.values <- fitted
      if (method == "lasso") 
        class(fit) <- c("lassorqs", "rqs")
      else if (method == "scad") 
        class(fit) <- c("scadrqs", "rqs")
      else class(fit) <- "rqs"
    }
    else if (method == "pfnb") {
      fit <- rq.fit.pfnb(X, Y, tau)
      class(fit) = "rqs"
    }
    else if (method == "qfnb") {
      fit <- rq.fit.qfnb(X, Y, tau)
      class(fit) = ifelse(length(tau) == 1, "rq", "rqs")
    }
    else if (method == "ppro") {
      fit <- rq.fit.ppro(X, Y, tau, ...)
      class(fit) = ifelse(length(tau) == 1, "rq", "rqs")
    }
  }
  else {
    process <- (tau < 0 || tau > 1)
    if (process && method != "br") 
      stop("when tau not in [0,1] method br must be used")
    fit <- {
      if (length(weights)) 
        rq.wfit(X, Y, tau = tau, weights, method, ...)
      else rq.fit(X, Y, tau = tau, method, ...)
    }
    #print(fit)
    if (process) 
      rho <- list(tau = fit$sol[1, ], rho = fit$sol[3, 
      ])
    else {
      if (length(dim(fit$residuals))) 
        dimnames(fit$residuals) <- list(dimnames(X)[[1]], 
                                        NULL)
      rho <- sum(Rho(fit$residuals, tau))
    }
    if (method == "lasso") 
      class(fit) <- c("lassorq", "rq")
    else if (method == "scad") 
      class(fit) <- c("scadrq", "rq")
    else class(fit) <- ifelse(process, "rq.process", "rq")
  }
  fit$na.action <- attr(mf, "na.action")
  fit$formula <- formula
  fit$terms <- mt
  fit$xlevels <- .getXlevels(mt, mf)
  fit$call <- call
  fit$tau <- tau
  fit$weights <- weights
  fit$residuals <- drop(fit$residuals)
  fit$rho <- rho
  fit$method <- method
  fit$fitted.values <- drop(fit$fitted.values)
  fit$X <- X
  fit$Y <- Y
  attr(fit, "na.message") <- attr(m, "na.message")
  if (model) 
    fit$model <- mf
  fit
}

qfnb = function (x, y, tau) 
{
  n <- nrow(x)
  p <- ncol(x)
  m <- length(tau)
  d <- rep(1, n)
  u <- rep(1, n)
  #print(as.double(t(x)))
  #print(as.double(-y))
  print(double(n * 9))
  z <- .Fortran("qfnb", n = as.integer(n), p = as.integer(p), 
                m = as.integer(m), a = as.double(t(x)), y = as.double(-y), 
                t = as.double(tau), r = double(p), d = as.double(d), 
                u = as.double(u), wn = double(n * 9), wp = double(p * 
                                                                    (p + 3)), B = double(p * m), nit = integer(3), info = integer(1))
  if (z$info != 0) 
    warning(paste("Info = ", z$info, "in stepy: singular design: nit = ", 
                  z$nit[1]))
  coefficients <- matrix(-z$B, p, m)
  dimnames(coefficients) <- list(dimnames(x)[[2]], paste("tau = ", 
                                                         tau))
  list(coefficients = coefficients, nit = z$nit, flag = z$info)
}

