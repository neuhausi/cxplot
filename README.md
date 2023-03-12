
# cxplot

<!-- badges: start -->
<!-- badges: end -->

cxplot is wrapper for CanvasXpress. This library implements the grammar of the R ggplot2 package
written completely in Javascript. Please beware that these pages are not updated often but the
library is continuously updated and currently being developed. These pages show just a few examples
of the way the library is used. Please report bugs and features request through the github repo
https://github.com/neuhausi/canvasxpress

Learn more at canvasxpress.org.

## Installation

You can install the development version of cxplot from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("neuhausi/cxplot")
```

## Reference

cxplot is wrapper for CanvasXpress that implements the grammar of the R
ggplot2 package written completely in Javascript.

## Plot basics 

All cxplot plots begin with a call to `var cxp = cxplot()`, supplying a
DOM target id to place the visualization, a default data and aesthetic
mappings, specified by `aes()`. You can also supply an additional
parameter with custom events. You then add layers, scales, coords and
facets with `cxp`.

## Layers 

Like ggplot2, cxplot supports the use of layers to construct plots and aesthetic mappings.

### Geoms 

A layer combines data, aesthetic mapping, a geom (geometric object), a
stat (statistical transformation), and a position adjustment. Typically,
you will create layers using a `geom_` function, overriding the default
position and stat if needed.


### Scales 

Scales control the details of how data values are translated to visual
properties. Override the default scales to tweak details like the axis
labels or legend keys, or to use a completely different translation from
data to aesthetic. labs() and lims() are convenient helpers for the most
common adjustments to the labels and limits.

### Facetting 

Facetting generates small multiples, each displaying a different subset
of the data. Facets are an alternative to aesthetics for displaying
additional discrete variables.

Developed by CanvasXpress
