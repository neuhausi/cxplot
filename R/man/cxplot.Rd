% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cxplot.R
\name{cxplot}
\alias{cxplot}
\title{cxplot}
\usage{
cxplot(o = ggplot2::last_plot())
}
\arguments{
\item{targetId}{DOM id of the <canvas> element included in the <body> element of the web page where the graph will be rendered.}

\item{data}{Default dataset to use for plot. If not specified, must be supplied in each layer added to the plot. It can be a link to a coma or tab delimited text file, a json representation of a two dimensional array or a CanvasXpress data obiject.}

\item{mapping}{Default list of aesthetic mappings to use for plot. If not specified, must be supplied in each layer added to the plot.}

\item{events}{json object with custom user-defined mouse events. This is optional as there are many out-of-the-box already provided.}
}
\value{

}
\description{
Initializes a cxplot object.
}
\details{
It can be used to declare the input data frame for a graphic, to specify the set of plot aesthetics intended to be
common throughout all subsequent layers unless specifically overridden and custom mouse events.

\code{cxplot()} is used to construct the initial plot object, and is almost always followed by cxp. to add component to the
plot. There are three common ways to invoke \code{cxplot()}:

\code{cxplot("targetId", df, aes("x", "y"))}

\code{cxplot("targetId", df)}

The first method is recommended if all layers use the same data and the same set of aesthetics, although this method
can also be used to add a layer using data from another data frame. See the first example below. The second method
specifies the default data frame to use for the plot, but no aesthetics are defined up front. This is useful when
one data frame is used predominantly as layers are added, but the aesthetics may vary from one layer to another.
}
\examples{
\dontrun{
df = "https://www.cxplot.com/assets/data/mtcars.csv";
cxp = cxplot("canvasId", df, aes("wt", "mpg"));
cxp.geom_point();

df = [["height", "weight"], [5.2, 130], [5.6, 150], [6.0, 200],
          [5.8, 180], [5.9, 170], [5.5, 160], [5.7, 175]];
cxp = cxplot("canvasId", df, aes("weight", "height"));
cxp.geom_point();
}
}
