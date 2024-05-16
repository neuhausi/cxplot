
<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Function reference • cxplot</title>
  <!-- favicons -->
  <link rel="icon" type="image/png" sizes="16x16" href="/assets/images/favicon-16x16.png">
  <link rel="icon" type="image/png" sizes="32x32" href="/assets/images/favicon-32x32.png">
  <link rel="apple-touch-icon" type="image/png" sizes="180x180" href="/assets/images/apple-touch-icon.png">
  <link rel="apple-touch-icon" type="image/png" sizes="120x120" href="/assets/images/apple-touch-icon-120x120.png">
  <link rel="apple-touch-icon" type="image/png" sizes="76x76" href="/assets/images/apple-touch-icon-76x76.png">
  <link rel="apple-touch-icon" type="image/png" sizes="60x60" href="/assets/images/apple-touch-icon-60x60.png">
  <!-- jquery -->
  <script src="/assets/js/jquery.min.js" crossorigin="anonymous"></script>
  <!-- Bootstrap -->
  <link href="/assets/css/tidyverse.css" rel="stylesheet">
  <script src="/assets/js/bootstrap.min.js" crossorigin="anonymous"></script>
  <!-- Font Awesome icons -->
  <link rel="stylesheet" href="/assets/css/all.min.css" crossorigin="anonymous">
  <link rel="stylesheet" href="/assets/css/v4-shims.min.css" crossorigin="anonymous">
  <!-- clipboard.js -->
  <script src="/assets/js/clipboard.min.js" crossorigin="anonymous"></script>
  <!-- headroom.js -->
  <script src="/assets/js/headroom.min.js" crossorigin="anonymous"></script>
  <script src="/assets/js/jQuery.headroom.min.js" crossorigin="anonymous"></script>
  <link href="/assets/css/tidyverse-2.css" rel="stylesheet">
  <!-- pkgdown -->
  <link href="/assets/css/pkgdown.css" rel="stylesheet">
  <!-- Google -->
  <!-- Global site tag (gtag.js) - Google Analytics -->
  <script async src="https://www.googletagmanager.com/gtag/js?id=G-XWN5F9X8DS"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'G-XWN5F9X8DS');
  </script>
  <!--optional theme-->
  <meta property="og:image" content="/assets/images/logo.png">
  <meta name="twitter:card" content="summary">
</head>

<body data-spy="scroll" data-target="#toc" style="padding-top: 60px;">

  <div class="container template-reference-index">

    <header>
      <div class="navbar navbar-default navbar-fixed-top headroom headroom--top headroom--not-bottom" role="navigation">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
              aria-expanded="false">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <div class="navbar-brand-container">
              <a class="navbar-brand" href="/index.html">cxplot</a>
            </div>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
              <li>
                <a href="https://github.com/neuhausi/cxplot" class="external-link">
                  <span class="fab fa-github fa-lg"></span>
                </a>
              </li>
              <li>
                <a href="backend/blog.php">Blog</a>
              </li>
              <li>
                <a href="backend/login.php">Download</a>
              </li>
              <li>
                <a href="backend/login.php">Login</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </header>

    <div class="row">
      <div class="contents col-md-9">
        <div class="page-header">
          <h1>Reference</h1>
          <p>
            cxplot is a JavaScript wrapper for CanvasXpress, implementing the grammar of graphs found
            in the popular R ggplot2 package. It's worth noting that this library is entirely written
            in JavaScript and doesn't rely on R at all. While the accompanying documentation pages may
            not be frequently updated, the library itself is actively maintained and developed. The
            documentation provides only a limited number of usage examples. For reporting bugs or
            requesting features, please use the GitHub repository: https://github.com/neuhausi/cxplot
          </p>
        </div>

        <table class="ref-index ref-index-icons">
          <colgroup>
            <col class="icon">
            <col class="alias">
            <col class="title">
          </colgroup>
          <tbody>
            <tr>
              <th colspan="3">
                <h2 id="section-javascript-library" class="hasAnchor">
                  <a href="#section-javascript-library" class="anchor"></a>JavaScript Library
                </h2>
                <p class="section-desc"></p>
                <p>Include the CanvasXpress JavaScript library in the <code>&lt;head&gt;&lt;/head&gt;</code>
                  of your web page.
                </p>
                <p>
                  <code>&lt;link rel="stylesheet" href="path-to-canvasXpress.css" type="text/css"/&gt;</code><br>
                  <code>&lt;script type="text/javascript" src="path-to-canvasXpress.min.js"&gt;&lt;/script&gt;</code>
                </p>
                <p>
                  Any code as decribed below should be placed in a <code>&lt;script&gt;&lt;/script&gt;</code> tag.
                </p>
              </th>
            </tr>
          </tbody>
          <tbody>
            <tr>
              <th colspan="3">
                <h2 id="section-plot-basics" class="hasAnchor">
                  <a href="#section-plot-basics" class="anchor"></a>Plot basics
                </h2>
                <p class="section-desc"></p>
                <p>All cxplot plots begin with a call to
                  <code>var cxp = <a href="/assets/html/cxplot.html">cxplot()</a></code>, supplying a DOM target id 
                  to place the visualization, a default data and aesthethic mappings, specified by
                  <code><a href="/assets/html/aes.html">aes()</a></code>. You can also supply an additional
                  parameter with custom events. You then add layers, scales, coords and facets with <code>cxp.</code>
                </p>
              </th>
            </tr>
          </tbody>
          <tbody>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/cxplot.html">cxplot()</a></code>
                </p>
              </td>
              <td>
                <p>Create a new cxplot</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/aes.html">aes()</a></code>
                </p>
              </td>
              <td>
                <p>Construct aesthetic mappings</p>
              </td>
            </tr>
          </tbody>
          <tbody>
            <tr>
              <th colspan="3">
                <h2 id="section-layers" class="hasAnchor">
                  <a href="/assets/html/index.html#section-layers" class="anchor"></a>Layers
                </h2>
                <p class="section-desc"></p>
              </th>
            </tr>
          </tbody>
          <tbody>
            <tr>
              <th colspan="3">
                <h3 id="section-geoms" class="hasAnchor">
                  <a href="/assets/html/index.html#section-geoms" class="anchor"></a>Geoms
                </h3>
                <p class="section-desc"></p>
                <p>A layer combines data, aesthetic mapping, a geom (geometric object), a stat
                  (statistical
                  transformation), and a position adjustment. Typically, you will create layers using
                  a
                  <code>geom_</code> function, overriding the default position and stat if needed.
                </p>
              </th>
            </tr>
          </tbody>
          <tbody>
            <tr>
              <td><a href="/assets/html/geom_abline.html"><img
                    src="/assets/images/geom_abline.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/geom_abline.html">geom_abline()</a></code>
                  <code><a href="/assets/html/geom_abline.html">geom_hline()</a></code>
                  <code><a href="/assets/html/geom_abline.html">geom_vline()</a></code>
                </p>
              </td>
              <td>
                <p>Reference lines: horizontal, vertical, and diagonal</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/geom_bar.html"><img
                    src="/assets/images/geom_bar.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/geom_bar.html">geom_bar()</a></code>
                  <code><a href="/assets/html/geom_bar.html">geom_col()</a></code>
                  <code><a href="/assets/html/geom_bar.html">stat_count()</a></code>
                </p>
              </td>
              <td>
                <p>Bar charts</p>
              </td>
            </tr>            
            <tr>
              <td><a href="/assets/html/geom_bin_2d.html"><img
                    src="/assets/images/geom_bin2d.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/geom_bin_2d.html">geom_bin_2d()</a></code>
                  <code><a href="/assets/html/geom_bin_2d.html">stat_bin_2d()</a></code>
                </p>
              </td>
              <td>
                <p>Heatmap of 2d bin counts</p>
              </td>
            </tr>
            <!--
            <tr>
              <td><a href="/assets/html/geom_blank.html"><img
                    src="/assets/images/geom_blank.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/geom_blank.html">geom_blank()</a></code>
                </p>
              </td>
              <td>
                <p>Draw nothing</p>
              </td>
            </tr>
            -->
            <tr>
              <td><a href="/assets/html/geom_boxplot.html"><img
                    src="/assets/images/geom_boxplot.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/geom_boxplot.html">geom_boxplot()</a></code>
                  <code><a href="/assets/html/geom_boxplot.html">stat_boxplot()</a></code>
                </p>
              </td>
              <td>
                <p>A box and whiskers plot (in the style of Tukey)</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/geom_contour.html"><img
                    src="/assets/images/geom_contour.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/geom_contour.html">geom_contour()</a></code>
                  <code><a href="/assets/html/geom_contour.html">geom_contour_filled()</a></code>
                  <code><a href="/assets/html/geom_contour.html">stat_contour()</a></code>
                  <code><a href="/assets/html/geom_contour.html">stat_contour_filled()</a></code>
                </p>
              </td>
              <td>
                <p>2D contours of a 3D surface</p>
              </td>
            </tr>
            <!--
            <tr>
              <td><a href="/assets/html/geom_count.html"><img
                    src="/assets/images/geom_count.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/geom_count.html">geom_count()</a></code>
                  <code><a href="/assets/html/geom_count.html">stat_sum()</a></code>
                </p>
              </td>
              <td>
                <p>Count overlapping points</p>
              </td>
            </tr>
            -->
            <tr>
              <td><a href="/assets/html/geom_density.html"><img
                    src="/assets/images/geom_density.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/geom_density.html">geom_density()</a></code>
                  <code><a href="/assets/html/geom_density.html">stat_density()</a></code>
                </p>
              </td>
              <td>
                <p>Smoothed density estimates</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p>
                  <code><a href="/assets/html/geom_density_2d.html">geom_density_2d()</a></code>
                  <code><a href="/assets/html/geom_density_2d.html">geom_density_2d_filled()</a></code>
                  <code><a href="/assets/html/geom_density_2d.html">stat_density_2d()</a></code>
                  <code><a href="/assets/html/geom_density_2d.html">stat_density_2d_filled()</a></code>
                </p>
              </td>
              <td>
                <p>Contours of a 2D density estimate</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/geom_dotplot.html"><img
                    src="/assets/images/geom_dotplot.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/geom_dotplot.html">geom_dotplot()</a></code>
                </p>
              </td>
              <td>
                <p>Dot plot</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p>
                  <code><a href="/assets/html/geom_errorbarh.html">geom_errorbarh()</a></code>
                </p>
              </td>
              <td>
                <p>Horizontal error bars</p>
              </td>
            </tr>
            <!--
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/geom_function.html">geom_function()</a></code>
                  <code><a href="/assets/html/geom_function.html">stat_function()</a></code>
                </p>
              </td>
              <td>
                <p>Draw a function as a continuous curve</p>
              </td>
            </tr>
            -->
            <tr>
              <td><a href="/assets/html/geom_hex.html"><img
                    src="/assets/images/geom_hex.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/geom_hex.html">geom_hex()</a></code>
                  <code><a href="/assets/html/geom_hex.html">stat_bin_hex()</a></code>
                </p>
              </td>
              <td>
                <p>Hexagonal heatmap of 2d bin counts</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/geom_histogram.html"><img
                    src="/assets/images/geom_freqpoly.png" width="30" height="30" alt=""></a></td>
              <td>
                <p>
                  <!--<code><a href="/assets/html/geom_histogram.html">geom_freqpoly()</a></code>-->
                  <code><a href="/assets/html/geom_histogram.html">geom_histogram()</a></code>
                  <code><a href="/assets/html/geom_histogram.html">stat_bin()</a></code>
                </p>
              </td>
              <td>
                <p>Histograms and frequency polygons</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/geom_jitter.html"><img
                    src="/assets/images/geom_jitter.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/geom_jitter.html">geom_jitter()</a></code>
                </p>
              </td>
              <td>
                <p>Jittered points</p>
              </td>
            </tr>
            <!--
            <tr>
              <td><a href="/assets/html/geom_linerange.html"><img
                    src="/assets/images/geom_crossbar.png" width="30" height="30" alt=""></a></td>
              <td>
                <p>
                  <code><a href="/assets/html/geom_linerange.html">geom_crossbar()</a></code>
                  <code><a href="/assets/html/geom_linerange.html">geom_errorbar()</a></code>
                  <code><a href="/assets/html/geom_linerange.html">geom_linerange()</a></code>
                  <code><a href="/assets/html/geom_linerange.html">geom_pointrange()</a></code>
                </p>
              </td>
              <td>
                <p>Vertical intervals: lines, crossbars &amp; errorbars</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/geom_map.html"><img
                    src="/assets/images/geom_map.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/geom_map.html">geom_map()</a></code>
                </p>
              </td>
              <td>
                <p>Polygons from a reference map</p>
              </td>
            </tr>
            -->
            <tr>
              <td><a href="/assets/html/geom_path.html"><img
                    src="/assets/images/geom_path.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/geom_path.html">geom_path()</a></code>
                  <code><a href="/assets/html/geom_path.html">geom_line()</a></code>
                  <code><a href="/assets/html/geom_path.html">geom_step()</a></code>
                </p>
              </td>
              <td>
                <p>Connect observations</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/geom_point.html"><img
                    src="/assets/images/geom_point.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/geom_point.html">geom_point()</a></code>
                </p>
              </td>
              <td>
                <p>Points</p>
              </td>
            </tr>
            <!--
            <tr>
              <td><a href="/assets/html/geom_polygon.html"><img
                    src="/assets/images/geom_polygon.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/geom_polygon.html">geom_polygon()</a></code>
                </p>
              </td>
              <td>
                <p>Polygons</p>
              </td>
            </tr>
            -->
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/geom_qq.html">geom_qq_line()</a></code>
                  <code><a href="/assets/html/geom_qq.html">stat_qq_line()</a></code>
                  <code><a href="/assets/html/geom_qq.html">geom_qq()</a></code>
                  <code><a href="/assets/html/geom_qq.html">stat_qq()</a></code>
                </p>
              </td>
              <td>
                <p>A quantile-quantile plot</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/geom_quantile.html"><img
                    src="/assets/images/geom_quantile.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/geom_quantile.html">geom_quantile()</a></code>
                  <code><a href="/assets/html/geom_quantile.html">stat_quantile()</a></code>
                </p>
              </td>
              <td>
                <p>Quantile regression</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/geom_ribbon.html"><img
                    src="/assets/images/geom_ribbon.png" width="30" height="30" alt=""></a></td>
              <td>
                <p>
                  <code><a href="/assets/html/geom_ribbon.html">geom_ribbon()</a></code>
                  <code><a href="/assets/html/geom_ribbon.html">geom_area()</a></code>
                </p>
              </td>
              <td>
                <p>Ribbons and area plots</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/geom_rug.html"><img
                    src="/assets/images/geom_rug.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/geom_rug.html">geom_rug()</a></code>
                </p>
              </td>
              <td>
                <p>Rug plots in the margins</p>
              </td>
            </tr>
            <!--
            <tr>
              <td><a href="/assets/html/geom_segment.html"><img
                    src="/assets/images/geom_segment.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/geom_segment.html">geom_segment()</a></code>
                  <code><a href="/assets/html/geom_segment.html">geom_curve()</a></code>
                </p>
              </td>
              <td>
                <p>Line segments and curves</p>
              </td>
            </tr>
            -->
            <tr>
              <td><a href="/assets/html/geom_smooth.html"><img
                    src="/assets/images/geom_smooth.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/geom_smooth.html">geom_smooth()</a></code>
                  <code><a href="/assets/html/geom_smooth.html">stat_smooth()</a></code>
                </p>
              </td>
              <td>
                <p>Smoothed conditional means</p>
              </td>
            </tr>
            <!--
            <tr>
              <td><a href="/assets/html/geom_spoke.html"><img
                    src="/assets/images/geom_spoke.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/geom_spoke.html">geom_spoke()</a></code>
                </p>
              </td>
              <td>
                <p>Line segments parameterised by location, direction and distance</p>
              </td>
            </tr>
            -->
            <tr>
              <td><a href="/assets/html/geom_text.html"><img
                    src="/assets/images/geom_text.png" width="30" height="30" alt=""></a></td>
              <td>
                <p>
                  <!--<code><a href="/assets/html/geom_text.html">geom_label()</a></code>-->
                  <code><a href="/assets/html/geom_text.html">geom_text()</a></code>
                </p>
              </td>
              <td>
                <p>Text</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/geom_tile.html"><img
                    src="/assets/images/geom_raster.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/geom_tile.html">geom_raster()</a></code>
                  <!--
                  <code><a href="/assets/html/geom_tile.html">geom_rect()</a></code>
                  <code><a href="/assets/html/geom_tile.html">geom_tile()</a></code>
                  -->
                </p>
              </td>
              <td>
                <p>Rectangles</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/geom_violin.html"><img
                    src="/assets/images/geom_violin.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/geom_violin.html">geom_violin()</a></code>
                  <code><a href="/assets/html/geom_violin.html">stat_ydensity()</a></code>
                </p>
              </td>
              <td>
                <p>Violin plot</p>
              </td>
            </tr>
            <!--
            <tr>
              <td><a href="/assets/html/ggsf.html"><img src="/assets/images/geom_sf.png"
                    width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/ggsf.html">coord_sf()</a></code>
                  <code><a href="/assets/html/ggsf.html">geom_sf()</a></code>
                  <code><a href="/assets/html/ggsf.html">geom_sf_label()</a></code>
                  <code><a href="/assets/html/ggsf.html">geom_sf_text()</a></code>
                  <code><a href="/assets/html/ggsf.html">stat_sf()</a></code>
                </p>
              </td>
              <td>
                <p>Visualise sf objects</p>
              </td>
            </tr>
            -->
          </tbody>
        <!--
          <tbody>
            <tr>
              <th colspan="3">
                <h3 id="section-stats" class="hasAnchor">
                  <a href="/assets/html/index.html#section-stats" class="anchor"></a>Stats
                </h3>
                <p class="section-desc"></p>
                <p>A handful of layers are more easily specified with a <code>stat_</code> function,
                  drawing attention
                  to the statistical transformation rather than the visual appearance. The computed
                  variables can be
                  mapped using
                  <code><a href="/assets/html/aes_eval.html">after_stat()</a></code>.
                </p>
              </th>
            </tr>
          </tbody>
          <tbody>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/stat_ecdf.html">stat_ecdf()</a></code>
                </p>
              </td>
              <td>
                <p>Compute empirical cumulative distribution</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/stat_ellipse.html">stat_ellipse()</a></code>
                </p>
              </td>
              <td>
                <p>Compute normal data ellipses</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/geom_function.html">geom_function()</a></code>
                  <code><a href="/assets/html/geom_function.html">stat_function()</a></code>
                </p>
              </td>
              <td>
                <p>Draw a function as a continuous curve</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/stat_identity.html">stat_identity()</a></code>
                </p>
              </td>
              <td>
                <p>Leave data as is</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p>
                  <code><a href="/assets/html/stat_summary_2d.html">stat_summary_2d()</a></code>
                  <code><a href="/assets/html/stat_summary_2d.html">stat_summary_hex()</a></code>
                </p>
              </td>
              <td>
                <p>Bin and summarise in 2d (rectangle &amp; hexagons)</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p>
                  <code><a href="/assets/html/stat_summary.html">stat_summary_bin()</a></code>
                  <code><a href="/assets/html/stat_summary.html">stat_summary()</a></code>
                </p>
              </td>
              <td>
                <p>Summarise y values at unique/binned x</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/stat_unique.html">stat_unique()</a></code>
                </p>
              </td>
              <td>
                <p>Remove duplicates</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p>
                  <code><a href="/assets/html/stat_sf_coordinates.html">stat_sf_coordinates()</a></code>
                </p>
              </td>
              <td>
                <p>Extract coordinates from 'sf' objects</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/aes_eval.html">after_stat()</a></code>
                  <code><a href="/assets/html/aes_eval.html">after_scale()</a></code>
                  <code><a href="/assets/html/aes_eval.html">stage()</a></code>
                </p>
              </td>
              <td>
                <p>Control aesthetic evaluation</p>
              </td>
            </tr>
          </tbody>
          <tbody>
            <tr>
              <th colspan="3">
                <h3 id="section-position-adjustment" class="hasAnchor">
                  <a href="/assets/html/index.html#section-position-adjustment"
                    class="anchor"></a>Position adjustment
                </h3>
                <p class="section-desc"></p>
                <p>All layers have a position adjustment that resolves overlapping geoms. Override the
                  default by using
                  the <code>position</code> argument to the <code>geom_</code> or <code>stat_</code>
                  function.</p>
              </th>
            </tr>
          </tbody>
          <tbody>
            <tr>
              <td><a href="/assets/html/position_dodge.html"><img
                    src="/assets/images/position_dodge.png" width="30" height="30" alt=""></a>
              </td>
              <td>
                <p>
                  <code><a href="/assets/html/position_dodge.html">position_dodge()</a></code>
                  <code><a href="/assets/html/position_dodge.html">position_dodge2()</a></code>
                </p>
              </td>
              <td>
                <p>Dodge overlapping objects side-to-side</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/position_identity.html"><img
                    src="/assets/images/position_identity.png" width="30" height="30" alt=""></a>
              </td>
              <td>
                <p>
                  <code><a href="/assets/html/position_identity.html">position_identity()</a></code>
                </p>
              </td>
              <td>
                <p>Don't adjust position</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/position_jitter.html"><img
                    src="/assets/images/position_jitter.png" width="30" height="30" alt=""></a>
              </td>
              <td>
                <p>
                  <code><a href="/assets/html/position_jitter.html">position_jitter()</a></code>
                </p>
              </td>
              <td>
                <p>Jitter points to avoid overplotting</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p>
                  <code><a href="/assets/html/position_jitterdodge.html">position_jitterdodge()</a></code>
                </p>
              </td>
              <td>
                <p>Simultaneously dodge and jitter</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p>
                  <code><a href="/assets/html/position_nudge.html">position_nudge()</a></code>
                </p>
              </td>
              <td>
                <p>Nudge points a fixed distance</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/position_stack.html"><img
                    src="/assets/images/position_stack.png" width="30" height="30" alt=""></a>
              </td>
              <td>
                <p>
                  <code><a href="/assets/html/position_stack.html">position_stack()</a></code>
                  <code><a href="/assets/html/position_stack.html">position_fill()</a></code>
                </p>
              </td>
              <td>
                <p>Stack overlapping objects on top of each another</p>
              </td>
            </tr>
          </tbody>
          <tbody>
            <tr>
              <th colspan="3">
                <h3 id="section-annotations" class="hasAnchor">
                  <a href="/assets/html/index.html#section-annotations"
                    class="anchor"></a>Annotations
                </h3>
                <p class="section-desc"></p>
                <p>Annotations are a special type of layer that don’t inherit global settings from the
                  plot. They are
                  used to add fixed reference data to plots.</p>
              </th>
            </tr>
          </tbody>
          <tbody>
            <tr>
              <td><a href="/assets/html/geom_abline.html"><img
                    src="/assets/images/geom_abline.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/geom_abline.html">geom_abline()</a></code>
                  <code><a href="/assets/html/geom_abline.html">geom_hline()</a></code>
                  <code><a href="/assets/html/geom_abline.html">geom_vline()</a></code>
                </p>
              </td>
              <td>
                <p>Reference lines: horizontal, vertical, and diagonal</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/annotate.html">annotate()</a></code>
                </p>
              </td>
              <td>
                <p>Create an annotation layer</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p>
                  <code><a href="/assets/html/annotation_custom.html">annotation_custom()</a></code>
                </p>
              </td>
              <td>
                <p>Annotation: Custom grob</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p>
                  <code><a href="/assets/html/annotation_logticks.html">annotation_logticks()</a></code>
                </p>
              </td>
              <td>
                <p>Annotation: log tick marks</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p>
                  <code><a href="/assets/html/annotation_map.html">annotation_map()</a></code>
                </p>
              </td>
              <td>
                <p>Annotation: a map</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p>
                  <code><a href="/assets/html/annotation_raster.html">annotation_raster()</a></code>
                </p>
              </td>
              <td>
                <p>Annotation: high-performance rectangular tiling</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/borders.html">borders()</a></code>
                </p>
              </td>
              <td>
                <p>Create a layer of map borders</p>
              </td>
            </tr>
          </tbody>
          <tbody>
            <tr>
              <th colspan="3">
                <h2 id="section-aesthetics" class="hasAnchor">
                  <a href="/assets/html/index.html#section-aesthetics"
                    class="anchor"></a>Aesthetics
                </h2>
                <p class="section-desc"></p>
                <p>The following help topics give a broad overview of some of the ways you can use each
                  aesthetic.</p>
              </th>
            </tr>
          </tbody>
          <tbody>
            <tr>
              <td></td>
              <td>
                <p>
                  <code><a href="/assets/html/aes_colour_fill_alpha.html">aes_colour_fill_alpha</a></code>
                </p>
              </td>
              <td>
                <p>Colour related aesthetics: colour, fill, and alpha</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p>
                  <code><a href="/assets/html/aes_group_order.html">aes_group_order</a></code>
                </p>
              </td>
              <td>
                <p>Aesthetics: grouping</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p>
                  <code><a href="/assets/html/aes_linetype_size_shape.html">aes_linetype_size_shape</a></code>
                </p>
              </td>
              <td>
                <p>Differentiation related aesthetics: linetype, size, shape</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/aes_position.html">aes_position</a></code>
                </p>
              </td>
              <td>
                <p>Position related aesthetics: x, y, xmin, xmax, ymin, ymax, xend, yend</p>
              </td>
            </tr>
          </tbody>
        -->
          <tbody>
            <tr>
              <th colspan="3">
                <h2 id="section-scales" class="hasAnchor">
                  <a href="/assets/html/index.html#section-scales" class="anchor"></a>Scales
                </h2>
                <p class="section-desc"></p>
                <p>Scales control the details of how data values are translated to visual properties.
                  Override the
                  default scales to tweak details like the axis labels or legend keys, or to use a
                  completely different
                  translation from data to aesthetic.
                  <code><a href="/assets/html/labs.html">labs()</a></code>
                  and
                  <code><a href="/assets/html/lims.html">lims()</a></code>
                  are convenient
                  helpers for the most common adjustments to the labels and limits.
                </p>
              </th>
            </tr>
          </tbody>
          <tbody>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/labs.html">labs()</a></code>
                  <code><a href="/assets/html/labs.html">xlab()</a></code>
                  <code><a href="/assets/html/labs.html">ylab()</a></code>
                  <code><a href="/assets/html/labs.html">ggtitle()</a></code>
                </p>
              </td>
              <td>
                <p>Modify axis, legend, and plot labels</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p>
                  <!--<code><a href="/assets/html/lims.html">lims()</a></code>-->
                  <code><a href="/assets/html/lims.html">xlim()</a></code>
                  <code><a href="/assets/html/lims.html">ylim()</a></code>
                </p>
              </td>
              <td>
                <p>Set scale limits</p>
              </td>
            </tr>
            <!--
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/expand_limits.html">expand_limits()</a></code>
                </p>
              </td>
              <td>
                <p>Expand the plot limits, using data</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/expansion.html">expansion()</a></code>
                  <code><a href="/assets/html/expansion.html">expand_scale()</a></code>
                </p>
              </td>
              <td>
                <p>Generate expansion vector for scales</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/scale_alpha.html"><img
                    src="/assets/images/scale_alpha.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/scale_alpha.html">scale_alpha()</a></code>
                  <code><a href="/assets/html/scale_alpha.html">scale_alpha_continuous()</a></code>
                  <code><a href="/assets/html/scale_alpha.html">scale_alpha_binned()</a></code>
                  <code><a href="/assets/html/scale_alpha.html">scale_alpha_discrete()</a></code>
                  <code><a href="/assets/html/scale_alpha.html">scale_alpha_ordinal()</a></code>
                </p>
              </td>
              <td>
                <p>Alpha transparency scales</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/scale_binned.html">scale_x_binned()</a></code>
                  <code><a href="/assets/html/scale_binned.html">scale_y_binned()</a></code>
                </p>
              </td>
              <td>
                <p>Positional scales for binning continuous data (x &amp; y)</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/scale_brewer.html"><img
                    src="/assets/images/scale_colour_brewer.png" width="30" height="30" alt=""></a>
              </td>
              <td>
                <p>
                  <code><a href="/assets/html/scale_brewer.html">scale_colour_brewer()</a></code>
                  <code><a href="/assets/html/scale_brewer.html">scale_fill_brewer()</a></code>
                  <code><a href="/assets/html/scale_brewer.html">scale_colour_distiller()</a></code>
                  <code><a href="/assets/html/scale_brewer.html">scale_fill_distiller()</a></code>
                  <code><a href="/assets/html/scale_brewer.html">scale_colour_fermenter()</a></code>
                  <code><a href="/assets/html/scale_brewer.html">scale_fill_fermenter()</a></code>
                </p>
              </td>
              <td>
                <p>Sequential, diverging and qualitative colour scales from ColorBrewer</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/scale_colour_continuous.html"><img
                    src="/assets/images/scale_colour_continuous.png" width="30" height="30" alt=""></a></td>
              <td>
                <p>
                  <code><a href="/assets/html/scale_colour_continuous.html">scale_colour_continuous()</a></code>
                  <code><a href="/assets/html/scale_colour_continuous.html">scale_fill_continuous()</a></code>
                  <code><a href="/assets/html/scale_colour_continuous.html">scale_colour_binned()</a></code>
                  <code><a href="/assets/html/scale_colour_continuous.html">scale_fill_binned()</a></code>
                </p>
              </td>
              <td>
                <p>Continuous and binned colour scales</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p>
                  <code><a href="/assets/html/scale_colour_discrete.html">scale_colour_discrete()</a></code>
                  <code><a href="/assets/html/scale_colour_discrete.html">scale_fill_discrete()</a></code>
                </p>
              </td>
              <td>
                <p>Discrete colour scales</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p>
                  <code><a href="/assets/html/scale_continuous.html">scale_x_continuous()</a></code>
                  <code><a href="/assets/html/scale_continuous.html">scale_y_continuous()</a></code>
                  <code><a href="/assets/html/scale_continuous.html">scale_x_log10()</a></code>
                  <code><a href="/assets/html/scale_continuous.html">scale_y_log10()</a></code>
                  <code><a href="/assets/html/scale_continuous.html">scale_x_reverse()</a></code>
                  <code><a href="/assets/html/scale_continuous.html">scale_y_reverse()</a></code>
                  <code><a href="/assets/html/scale_continuous.html">scale_x_sqrt()</a></code>
                  <code><a href="/assets/html/scale_continuous.html">scale_y_sqrt()</a></code>
                </p>
              </td>
              <td>
                <p>Position scales for continuous data (x &amp; y)</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/scale_date.html"><img
                    src="/assets/images/scale_x_date.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/scale_date.html">scale_x_date()</a></code>
                  <code><a href="/assets/html/scale_date.html">scale_y_date()</a></code>
                  <code><a href="/assets/html/scale_date.html">scale_x_datetime()</a></code>
                  <code><a href="/assets/html/scale_date.html">scale_y_datetime()</a></code>
                  <code><a href="/assets/html/scale_date.html">scale_x_time()</a></code>
                  <code><a href="/assets/html/scale_date.html">scale_y_time()</a></code>
                </p>
              </td>
              <td>
                <p>Position scales for date/time data</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p>
                  <code><a href="/assets/html/scale_discrete.html">scale_x_discrete()</a></code>
                  <code><a href="/assets/html/scale_discrete.html">scale_y_discrete()</a></code>
                </p>
              </td>
              <td>
                <p>Position scales for discrete data</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/scale_gradient.html"><img
                    src="/assets/images/scale_colour_gradient.png" width="30" height="30" alt=""></a></td>
              <td>
                <p>
                  <code><a href="/assets/html/scale_gradient.html">scale_colour_gradient()</a></code>
                  <code><a href="/assets/html/scale_gradient.html">scale_fill_gradient()</a></code>
                  <code><a href="/assets/html/scale_gradient.html">scale_colour_gradient2()</a></code>
                  <code><a href="/assets/html/scale_gradient.html">scale_fill_gradient2()</a></code>
                  <code><a href="/assets/html/scale_gradient.html">scale_colour_gradientn()</a></code>
                  <code><a href="/assets/html/scale_gradient.html">scale_fill_gradientn()</a></code>
                </p>
              </td>
              <td>
                <p>Gradient colour scales</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/scale_grey.html"><img
                    src="/assets/images/scale_colour_grey.png" width="30" height="30" alt=""></a>
              </td>
              <td>
                <p>
                  <code><a href="/assets/html/scale_grey.html">scale_colour_grey()</a></code>
                  <code><a href="/assets/html/scale_grey.html">scale_fill_grey()</a></code>
                </p>
              </td>
              <td>
                <p>Sequential grey colour scales</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/scale_hue.html"><img
                    src="/assets/images/scale_colour_hue.png" width="30" height="30" alt=""></a>
              </td>
              <td>
                <p><code><a href="/assets/html/scale_hue.html">scale_colour_hue()</a></code>
                  <code><a href="/assets/html/scale_hue.html">scale_fill_hue()</a></code>
                </p>
              </td>
              <td>
                <p>Evenly spaced colours for discrete data</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p>
                  <code><a href="/assets/html/scale_identity.html">scale_colour_identity()</a></code>
                  <code><a href="/assets/html/scale_identity.html">scale_fill_identity()</a></code>
                  <code><a href="/assets/html/scale_identity.html">scale_shape_identity()</a></code>
                  <code><a href="/assets/html/scale_identity.html">scale_linetype_identity()</a></code>
                  <code><a href="/assets/html/scale_identity.html">scale_alpha_identity()</a></code>
                  <code><a href="/assets/html/scale_identity.html">scale_size_identity()</a></code>
                  <code><a href="/assets/html/scale_identity.html">scale_discrete_identity()</a></code>
                  <code><a href="/assets/html/scale_identity.html">scale_continuous_identity()</a></code>
                </p>
              </td>
              <td>
                <p>Use values without scaling</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/scale_linetype.html"><img
                    src="/assets/images/scale_linetype.png" width="30" height="30" alt=""></a>
              </td>
              <td>
                <p>
                  <code><a href="/assets/html/scale_linetype.html">scale_linetype()</a></code>
                  <code><a href="/assets/html/scale_linetype.html">scale_linetype_binned()</a></code>
                  <code><a href="/assets/html/scale_linetype.html">scale_linetype_continuous()</a></code>
                  <code><a href="/assets/html/scale_linetype.html">scale_linetype_discrete()</a></code>
                </p>
              </td>
              <td>
                <p>Scale for line patterns</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/scale_manual.html"><img
                    src="/assets/images/scale_colour_manual.png" width="30" height="30" alt=""></a>
              </td>
              <td>
                <p>
                  <code><a href="/assets/html/scale_manual.html">scale_colour_manual()</a></code>
                  <code><a href="/assets/html/scale_manual.html">scale_fill_manual()</a></code>
                  <code><a href="/assets/html/scale_manual.html">scale_size_manual()</a></code>
                  <code><a href="/assets/html/scale_manual.html">scale_shape_manual()</a></code>
                  <code><a href="/assets/html/scale_manual.html">scale_linetype_manual()</a></code>
                  <code><a href="/assets/html/scale_manual.html">scale_alpha_manual()</a></code>
                  <code><a href="/assets/html/scale_manual.html">scale_discrete_manual()</a></code>
                </p>
              </td>
              <td>
                <p>Create your own discrete scale</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/scale_shape.html"><img
                    src="/assets/images/scale_shape.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/scale_shape.html">scale_shape()</a></code>
                  <code><a href="/assets/html/scale_shape.html">scale_shape_binned()</a></code>
                </p>
              </td>
              <td>
                <p>Scales for shapes, aka glyphs</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/scale_size.html"><img
                    src="/assets/images/scale_size.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/scale_size.html">scale_size()</a></code>
                  <code><a href="/assets/html/scale_size.html">scale_radius()</a></code>
                  <code><a href="/assets/html/scale_size.html">scale_size_binned()</a></code>
                  <code><a href="/assets/html/scale_size.html">scale_size_area()</a></code>
                  <code><a href="/assets/html/scale_size.html">scale_size_binned_area()</a></code>
                </p>
              </td>
              <td>
                <p>Scales for area or radius</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p>
                  <code><a href="/assets/html/scale_steps.html">scale_colour_steps()</a></code>
                  <code><a href="/assets/html/scale_steps.html">scale_colour_steps2()</a></code>
                  <code><a href="/assets/html/scale_steps.html">scale_colour_stepsn()</a></code>
                  <code><a href="/assets/html/scale_steps.html">scale_fill_steps()</a></code>
                  <code><a href="/assets/html/scale_steps.html">scale_fill_steps2()</a></code>
                  <code><a href="/assets/html/scale_steps.html">scale_fill_stepsn()</a></code>
                </p>
              </td>
              <td>
                <p>Binned gradient colour scales</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/scale_viridis.html"><img
                    src="/assets/images/scale_colour_viridis_d.png" width="30" height="30" alt=""></a></td>
              <td>
                <p>
                  <code><a href="/assets/html/scale_viridis.html">scale_colour_viridis_d()</a></code>
                  <code><a href="/assets/html/scale_viridis.html">scale_fill_viridis_d()</a></code>
                  <code><a href="/assets/html/scale_viridis.html">scale_colour_viridis_c()</a></code>
                  <code><a href="/assets/html/scale_viridis.html">scale_fill_viridis_c()</a></code>
                  <code><a href="/assets/html/scale_viridis.html">scale_colour_viridis_b()</a></code>
                  <code><a href="/assets/html/scale_viridis.html">scale_fill_viridis_b()</a></code>
                </p>
              </td>
              <td>
                <p>Viridis colour scales from viridisLite</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/get_alt_text.html">get_alt_text()</a></code>
                </p>
              </td>
              <td>
                <p>Extract alt text from a plot</p>
              </td>
            </tr>
            -->
          </tbody>
          <!--
          <tbody>
            <tr>
              <th colspan="3">
                <h2 id="section-guides-axes-and-legends" class="hasAnchor">
                  <a href="/assets/html/index.html#section-guides-axes-and-legends"
                    class="anchor"></a>Guides: axes and legends
                </h2>
                <p class="section-desc"></p>
                <p>The guides (the axes and legends) help readers interpret your plots. Guides are
                  mostly controlled via
                  the scale (e.g.&nbsp;with the <code>limits</code>, <code>breaks</code>, and
                  <code>labels</code>
                  arguments), but sometimes you will need additional control over guide appearance.
                  Use
                  <code><a href="/assets/html/guides.html">guides()</a></code>
                  or the
                  <code>guide</code> argument to individual scales along with <code>guide_*()</code>
                  functions.
                </p>
              </th>
            </tr>
          </tbody>
          <tbody>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/draw_key.html">draw_key_point()</a></code>
                  <code><a href="/assets/html/draw_key.html">draw_key_abline()</a></code>
                  <code><a href="/assets/html/draw_key.html">draw_key_rect()</a></code>
                  <code><a href="/assets/html/draw_key.html">draw_key_polygon()</a></code>
                  <code><a href="/assets/html/draw_key.html">draw_key_blank()</a></code>
                  <code><a href="/assets/html/draw_key.html">draw_key_boxplot()</a></code>
                  <code><a href="/assets/html/draw_key.html">draw_key_crossbar()</a></code>
                  <code><a href="/assets/html/draw_key.html">draw_key_path()</a></code>
                  <code><a href="/assets/html/draw_key.html">draw_key_vpath()</a></code>
                  <code><a href="/assets/html/draw_key.html">draw_key_dotplot()</a></code>
                  <code><a href="/assets/html/draw_key.html">draw_key_pointrange()</a></code>
                  <code><a href="/assets/html/draw_key.html">draw_key_smooth()</a></code>
                  <code><a href="/assets/html/draw_key.html">draw_key_text()</a></code>
                  <code><a href="/assets/html/draw_key.html">draw_key_label()</a></code>
                  <code><a href="/assets/html/draw_key.html">draw_key_vline()</a></code>
                  <code><a href="/assets/html/draw_key.html">draw_key_timeseries()</a></code>
                </p>
              </td>
              <td>
                <p>Key glyphs for legends</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p>
                  <code><a href="/assets/html/guide_colourbar.html">guide_colourbar()</a></code>
                  <code><a href="/assets/html/guide_colourbar.html">guide_colorbar()</a></code>
                </p>
              </td>
              <td>
                <p>Continuous colour bar guide</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/guide_legend.html">guide_legend()</a></code>
                </p>
              </td>
              <td>
                <p>Legend guide</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/guide_axis.html">guide_axis()</a></code>
                </p>
              </td>
              <td>
                <p>Axis guide</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/guide_bins.html">guide_bins()</a></code>
                </p>
              </td>
              <td>
                <p>A binned version of guide_legend</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p>
                  <code><a href="/assets/html/guide_coloursteps.html">guide_coloursteps()</a></code>
                  <code><a href="/assets/html/guide_coloursteps.html">guide_colorsteps()</a></code>
                </p>
              </td>
              <td>
                <p>Discretized colourbar guide</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/guide_none.html">guide_none()</a></code>
                </p>
              </td>
              <td>
                <p>Empty guide</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/guides.html">guides()</a></code>
                </p>
              </td>
              <td>
                <p>Set guides for each scale</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/sec_axis.html">sec_axis()</a></code>
                  <code><a href="/assets/html/sec_axis.html">dup_axis()</a></code>
                  <code><a href="/assets/html/sec_axis.html">derive()</a></code>
                </p>
              </td>
              <td>
                <p>Specify a secondary axis</p>
              </td>
            </tr>
          </tbody>
        -->  
          <tbody>
            <tr>
              <th colspan="3">
                <h2 id="section-facetting" class="hasAnchor">
                  <a href="/assets/html/index.html#section-facetting"
                    class="anchor"></a>Facetting
                </h2>
                <p class="section-desc"></p>
                <p>Facetting generates small multiples, each displaying a different subset of the data.
                  Facets are an
                  alternative to aesthetics for displaying additional discrete variables.</p>
              </th>
            </tr>
          </tbody>
          <tbody>
            <!--
            <tr>
              <td><a href="/assets/html/facet_grid.html"><img
                    src="/assets/images/facet_grid.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/facet_grid.html">facet_grid()</a></code>
                </p>
              </td>
              <td>
                <p>Lay out panels in a grid</p>
              </td>
            </tr>
            -->
            <tr>
              <td><a href="/assets/html/facet_wrap.html"><img
                    src="/assets/images/facet_wrap.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/facet_wrap.html">facet_wrap()</a></code>
                </p>
              </td>
              <td>
                <p>Wrap a 1d ribbon of panels into 2d</p>
              </td>
            </tr>
            <!--
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/vars.html">vars()</a></code>
                </p>
              </td>
              <td>
                <p>Quote faceting variables</p>
              </td>
            </tr>
            -->
          </tbody>
          <!--
          <tbody>
            <tr>
              <th colspan="3">
                <h3 id="section-labels" class="hasAnchor">
                  <a href="/assets/html/index.html#section-labels" class="anchor"></a>Labels
                </h3>
                <p class="section-desc"></p>
                <p>These functions provide a flexible toolkit for controlling the display of the “strip”
                  labels on
                  facets.</p>
              </th>
            </tr>
          </tbody>
          <tbody>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/labeller.html">labeller()</a></code>
                </p>
              </td>
              <td>
                <p>Construct labelling specification</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/labellers.html">label_value()</a></code>
                  <code><a href="/assets/html/labellers.html">label_both()</a></code>
                  <code><a href="/assets/html/labellers.html">label_context()</a></code>
                  <code><a href="/assets/html/labellers.html">label_parsed()</a></code>
                  <code><a href="/assets/html/labellers.html">label_wrap_gen()</a></code>
                </p>
              </td>
              <td>
                <p>Useful labeller functions</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/labellers.html">label_value()</a></code>
                  <code><a href="/assets/html/labellers.html">label_both()</a></code>
                  <code><a href="/assets/html/labellers.html">label_context()</a></code>
                  <code><a href="/assets/html/labellers.html">label_parsed()</a></code>
                  <code><a href="/assets/html/labellers.html">label_wrap_gen()</a></code>
                </p>
              </td>
              <td>
                <p>Useful labeller functions</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/label_bquote.html">label_bquote()</a></code>
                </p>
              </td>
              <td>
                <p>Label with mathematical expressions</p>
              </td>
            </tr>
          </tbody>
          <tbody>
            <tr>
              <th colspan="3">
                <h2 id="section-coordinate-systems" class="hasAnchor">
                  <a href="/assets/html/index.html#section-coordinate-systems"
                    class="anchor"></a>Coordinate systems
                </h2>
                <p class="section-desc"></p>
                <p>The coordinate system determines how the <code>x</code> and <code>y</code> aesthetics
                  combine to
                  position elements in the plot. The default coordinate system is Cartesian
                  (<code><a href="/assets/html/coord_cartesian.html">coord_cartesian()</a></code>),
                  which can be tweaked with
                  <code><a href="/assets/html/coord_map.html">coord_map()</a></code>,
                  <code><a href="/assets/html/coord_fixed.html">coord_fixed()</a></code>,
                  <code><a href="/assets/html/coord_flip.html">coord_flip()</a></code>,
                  and
                  <code><a href="/assets/html/coord_trans.html">coord_trans()</a></code>,
                  or
                  completely replaced with
                  <code><a href="/assets/html/coord_polar.html">coord_polar()</a></code>.
                </p>
              </th>
            </tr>
          </tbody>
          <tbody>
            <tr>
              <td><a href="/assets/html/coord_cartesian.html"><img
                    src="/assets/images/coord_cartesian.png" width="30" height="30" alt=""></a>
              </td>
              <td>
                <p>
                  <code><a href="/assets/html/coord_cartesian.html">coord_cartesian()</a></code>
                </p>
              </td>
              <td>
                <p>Cartesian coordinates</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/coord_fixed.html"><img
                    src="/assets/images/coord_fixed.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/coord_fixed.html">coord_fixed()</a></code>
                </p>
              </td>
              <td>
                <p>Cartesian coordinates with fixed "aspect ratio"</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/coord_flip.html"><img
                    src="/assets/images/coord_flip.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/coord_flip.html">coord_flip()</a></code>
                </p>
              </td>
              <td>
                <p>Cartesian coordinates with x and y flipped</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/coord_map.html"><img
                    src="/assets/images/coord_map.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/coord_map.html">coord_map()</a></code>
                  <code><a href="/assets/html/coord_map.html">coord_quickmap()</a></code>
                </p>
              </td>
              <td>
                <p>Map projections</p>
              </td>
            </tr>
            <tr>
              <td><a href="/assets/html/coord_polar.html"><img
                    src="/assets/images/coord_polar.png" width="30" height="30" alt=""></a></td>
              <td>
                <p><code><a href="/assets/html/coord_polar.html">coord_polar()</a></code>
                </p>
              </td>
              <td>
                <p>Polar coordinates</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/coord_trans.html">coord_trans()</a></code>
                </p>
              </td>
              <td>
                <p>Transformed Cartesian coordinate system</p>
              </td>
            </tr>
          </tbody>
          -->
          <tbody>
            <tr>
              <th colspan="3">
                <h2 id="section-themes" class="hasAnchor">
                  <a href="/assets/html/index.html#section-themes" class="anchor"></a>Themes
                </h2>
                <p class="section-desc"></p>
                <p>Themes control the display of all non-data elements of the plot. <!-- You can override all
                  settings with a
                  complete theme like
                  <code><a href="/assets/html/ggtheme.html">theme_bw()</a></code>,
                  or choose
                  to tweak individual settings by using
                  <code><a href="/assets/html/theme.html">theme()</a></code>
                  and the
                  <code>element_</code> functions. Use
                  <code><a href="/assets/html/theme_get.html">theme_set()</a></code>
                  to
                  modify the active theme, affecting all future plots.
                  -->
                </p>
              </th>
            </tr>
          </tbody>          
          <tbody>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/theme.html">theme()</a></code>
                </p>
              </td>
              <!--
              <td>
                <p>Modify components of a theme</p>
              </td>
              -->
            </tr>
            <!--
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/ggtheme.html">theme_grey()</a></code>
                  <code><a href="/assets/html/ggtheme.html">theme_gray()</a></code>
                  <code><a href="/assets/html/ggtheme.html">theme_bw()</a></code>
                  <code><a href="/assets/html/ggtheme.html">theme_linedraw()</a></code>
                  <code><a href="/assets/html/ggtheme.html">theme_light()</a></code>
                  <code><a href="/assets/html/ggtheme.html">theme_dark()</a></code>
                  <code><a href="/assets/html/ggtheme.html">theme_minimal()</a></code>
                  <code><a href="/assets/html/ggtheme.html">theme_classic()</a></code>
                  <code><a href="/assets/html/ggtheme.html">theme_void()</a></code>
                  <code><a href="/assets/html/ggtheme.html">theme_test()</a></code>
                </p>
              </td>
              <td>
                <p>Complete themes</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/theme_get.html">theme_get()</a></code>
                  <code><a href="/assets/html/theme_get.html">theme_set()</a></code>
                  <code><a href="/assets/html/theme_get.html">theme_update()</a></code>
                  <code><a href="/assets/html/theme_get.html">theme_replace()</a></code>
                  <code><a href="/assets/html/theme_get.html">`%+replace%`</a></code>
                </p>
              </td>
              <td>
                <p>Get, set, and modify the active theme</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/element.html">margin()</a></code>
                  <code><a href="/assets/html/element.html">element_blank()</a></code>
                  <code><a href="/assets/html/element.html">element_rect()</a></code>
                  <code><a href="/assets/html/element.html">element_line()</a></code>
                  <code><a href="/assets/html/element.html">element_text()</a></code>
                  <code><a href="/assets/html/element.html">rel()</a></code>
                </p>
              </td>
              <td>
                <p>Theme elements</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/element.html">margin()</a></code>
                  <code><a href="/assets/html/element.html">element_blank()</a></code>
                  <code><a href="/assets/html/element.html">element_rect()</a></code>
                  <code><a href="/assets/html/element.html">element_line()</a></code>
                  <code><a href="/assets/html/element.html">element_text()</a></code>
                  <code><a href="/assets/html/element.html">rel()</a></code>
                </p>
              </td>
              <td>
                <p>Theme elements</p>
              </td>
            </tr>
          </tbody>
          <tbody>
            <tr>
              <th colspan="3">
                <h2 id="section-programming-with-cxplot-" class="hasAnchor">
                  <a href="/assets/html/index.html#section-programming-with-cxplot-"
                    class="anchor"></a>Programming with cxplot
                </h2>
                <p class="section-desc"></p>
                <p>These functions provides tools to help you program with cxplot, creating functions
                  and for-loops
                  that generate plots for you.</p>
              </th>
            </tr>
          </tbody>
          <tbody>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/aes_.html">aes_()</a></code>
                  <code><a href="/assets/html/aes_.html">aes_string()</a></code>
                  <code><a href="/assets/html/aes_.html">aes_q()</a></code>
                </p>
              </td>
              <td>
                <p>Define aesthetic mappings programmatically</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p>
                  <code><a href="/assets/html/print.cxplot.html">print(<i>&lt;cxplot&gt;</i>)</a></code>
                  <code><a href="/assets/html/print.cxplot.html">plot(<i>&lt;cxplot&gt;</i>)</a></code>
                </p>
              </td>
              <td>
                <p>Explicitly draw plot</p>
              </td>
            </tr>
          </tbody>
          <tbody>
            <tr>
              <th colspan="3">
                <h2 id="section-extending-cxplot-" class="hasAnchor">
                  <a href="/assets/html/index.html#section-extending-cxplot-"
                    class="anchor"></a>Extending cxplot
                </h2>
                <p class="section-desc"></p>
                <p>To create your own geoms, stats, scales, and facets, you’ll need to learn a bit about
                  the object
                  oriented system that cxplot uses. Start by reading
                  <code><a href="https://cxplot.tidyverse.org/articles/extending-cxplot.html">vignette("extending-cxplot")</a></code>
                  then consult these functions for more details.
                </p>
              </th>
            </tr>
          </tbody>
          <tbody>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/ggproto.html">ggproto()</a></code>
                  <code><a href="/assets/html/ggproto.html">ggproto_parent()</a></code>
                  <code><a href="/assets/html/ggproto.html">is.ggproto()</a></code>
                </p>
              </td>
              <td>
                <p>Create a new ggproto object</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p>
                  <code><a href="/assets/html/print.ggproto.html">print(<i>&lt;ggproto&gt;</i>)</a></code>
                  <code><a href="/assets/html/print.ggproto.html">format(<i>&lt;ggproto&gt;</i>)</a></code>
                </p>
              </td>
              <td>
                <p>Format or print a ggproto object</p>
              </td>
            </tr>
          </tbody>
          <tbody>
            <tr>
              <th colspan="3">
                <h2 id="section-vector-helpers" class="hasAnchor">
                  <a href="/assets/html/index.html#section-vector-helpers"
                    class="anchor"></a>Vector helpers
                </h2>
                <p class="section-desc"></p>
                <p>cxplot also provides a handful of helpers that are useful for creating
                  visualisations.</p>
              </th>
            </tr>
          </tbody>
          <tbody>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/cut_interval.html">cut_interval()</a></code>
                  <code><a href="/assets/html/cut_interval.html">cut_number()</a></code>
                  <code><a href="/assets/html/cut_interval.html">cut_width()</a></code>
                </p>
              </td>
              <td>
                <p>Discretise numeric data into categorical</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/hmisc.html">mean_cl_boot()</a></code>
                  <code><a href="/assets/html/hmisc.html">mean_cl_normal()</a></code>
                  <code><a href="/assets/html/hmisc.html">mean_sdl()</a></code>
                  <code><a href="/assets/html/hmisc.html">median_hilow()</a></code>
                </p>
              </td>
              <td>
                <p>A selection of summary functions from Hmisc</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/mean_se.html">mean_se()</a></code>
                </p>
              </td>
              <td>
                <p>Calculate mean and standard error of the mean</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/resolution.html">resolution()</a></code>
                </p>
              </td>
              <td>
                <p>Compute the "resolution" of a numeric vector</p>
              </td>
            </tr>
          </tbody>
          <tbody>
            <tr>
              <th colspan="3">
                <h2 id="section-data" class="hasAnchor">
                  <a href="/assets/html/index.html#section-data" class="anchor"></a>Data
                </h2>
                <p class="section-desc"></p>
                <p>cxplot comes with a selection of built-in datasets that are used in examples to
                  illustrate various
                  visualisation challenges.</p>
              </th>
            </tr>
          </tbody>
          <tbody>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/diamonds.html">diamonds</a></code>
                </p>
              </td>
              <td>
                <p>Prices of over 50,000 round cut diamonds</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/economics.html">economics</a></code>
                  <code><a href="/assets/html/economics.html">economics_long</a></code>
                </p>
              </td>
              <td>
                <p>US economic time series</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/faithfuld.html">faithfuld</a></code>
                </p>
              </td>
              <td>
                <p>2d density estimate of Old Faithful data</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/midwest.html">midwest</a></code>
                </p>
              </td>
              <td>
                <p>Midwest demographics</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/mpg.html">mpg</a></code> </p>
              </td>
              <td>
                <p>Fuel economy data from 1999 to 2008 for 38 popular models of cars</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/msleep.html">msleep</a></code>
                </p>
              </td>
              <td>
                <p>An updated and expanded version of the mammals sleep dataset</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/presidential.html">presidential</a></code>
                </p>
              </td>
              <td>
                <p>Terms of 11 presidents from Eisenhower to Obama</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/seals.html">seals</a></code>
                </p>
              </td>
              <td>
                <p>Vector field of seal movements</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/txhousing.html">txhousing</a></code>
                </p>
              </td>
              <td>
                <p>Housing sales in TX</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/luv_colours.html">luv_colours</a></code>
                </p>
              </td>
              <td>
                <p><code>colors()</code> in Luv space</p>
              </td>
            </tr>
          </tbody>
          <tbody>
            <tr>
              <th colspan="3">
                <h2 id="section-autoplot-and-fortify" class="hasAnchor">
                  <a href="/assets/html/index.html#section-autoplot-and-fortify"
                    class="anchor"></a>Autoplot and fortify
                </h2>
                <p class="section-desc"></p>
                <p><code><a href="/assets/html/autoplot.html">autoplot()</a></code>
                  is an
                  extension mechanism for cxplot: it provides a way for package authors to add
                  methods that work like
                  the base
                  <code><a href="https://rdrr.io/r/graphics/plot.default.html" class="external-link external-link">plot()</a></code>
                  function, generating useful default plots with little user interaction.
                  <code><a href="/assets/html/fortify.html">fortify()</a></code>
                  turns
                  objects into tidy data frames: it has largely been superceded by the <a
                    href="https://github.com/tidyverse/broom" class="external-link external-link">broom package</a>.
                </p>
              </th>
            </tr>
          </tbody>
          <tbody>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/autoplot.html">autoplot()</a></code>
                </p>
              </td>
              <td>
                <p>Create a complete cxplot appropriate to a particular data type</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/autolayer.html">autolayer()</a></code>
                </p>
              </td>
              <td>
                <p>Create a cxplot layer appropriate to a particular data type</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/fortify.html">fortify()</a></code>
                </p>
              </td>
              <td>
                <p>Fortify a model with data.</p>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <p><code><a href="/assets/html/map_data.html">map_data()</a></code>
                </p>
              </td>
              <td>
                <p>Create a data frame of map data</p>
              </td>
            </tr>
          </tbody>
        -->
        </table>
      </div>

      <div class="col-md-3 hidden-xs hidden-sm" id="pkgdown-sidebar">
        <nav id="toc" data-toggle="toc" class="sticky-top">
          <h2 data-toc-skip="">Contents</h2>
          <ul class="nav">
            <li><a href="#section-javascript-library">
                JavaScript Library</a></li>
            <li><a href="#section-plot-basics">
                Plot basics</a></li>
            <li><a href="#section-layers">
                Layers</a>
              <ul class="nav">
                <li><a href="#section-geoms">
                    Geoms</a></li>
                <!--    
                <li><a href="#section-stats">
                    Stats</a></li>
                <li><a href="#section-position-adjustment">
                    Position adjustment</a></li>
                <li><a href="#section-annotations">
                    Annotations</a></li>
                -->
              </ul>
            </li>
            <!--
            <li><a href="#section-aesthetics">
                Aesthetics</a></li>
            -->
            <li><a href="#section-scales">
                Scales</a></li>
            <!--    
            <li><a href="#section-guides-axes-and-legends">
                Guides: axes and legends</a></li>
            -->
            <li><a href="#section-facetting">
                Facetting</a>
              <!--
              <ul class="nav">
                <li><a href="#section-labels">
                    Labels</a></li>
              </ul>
              -->
            </li>
            <!--
            <li><a href="#section-coordinate-systems">
                Coordinate systems</a></li>
            -->
            <li><a href="#section-themes">
                Themes</a></li>
            <!--
            <li><a href="#section-programming-with-cxplot-">
                Programming with cxplot</a></li>
            <li><a href="#section-extending-cxplot-">
                Extending cxplot</a></li>
            <li><a href="#section-vector-helpers">
                Vector helpers</a></li>
            <li><a href="#section-data">
                Data</a></li>
            <li><a href="#section-autoplot-and-fortify">
                Autoplot and fortify</a></li>
            -->
          </ul>
        </nav>
      </div>
    </div>


    <footer>
      <div class="tidyverse">
        <p>cxplot is a part of <strong>CanvasXpress</strong>, a Javascript library for data analytics. 
          Learn more at <a href="https://canvasxpress.org/" class="external-link">canvasxpress.org</a>.</p>
      </div>

      <div class="author">
        <p>
          Developed by CanvasXpress
        </p>
      </div>

    </footer>
  </div>


</body>

</html>