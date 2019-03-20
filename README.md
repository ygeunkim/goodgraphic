
# goodgraphic

**Private** tools for ggplot2

This package is a set of functions that are frequently used with
`ggplot2`.

## Install

``` r
devtools::install_github("ygeunkim/goodgraphic")
```

``` r
library(tidyverse)
#> ── Attaching packages ─────────── tidyverse 1.2.1 ──
#> ✔ ggplot2 3.1.0       ✔ purrr   0.3.1  
#> ✔ tibble  2.0.1       ✔ dplyr   0.8.0.1
#> ✔ tidyr   0.8.3       ✔ stringr 1.4.0  
#> ✔ readr   1.3.1       ✔ forcats 0.4.0
#> ── Conflicts ────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
library(goodgraphic)
```

## Scatter plot

This is the function motivated by Jackson
(2017).

``` r
gg_scatter(diamonds, mapping = aes(x = carat, y = price), size = 2, alpha = .2)
```

<img src="README_files/figure-gfm/unnamed-chunk-3-1.png" width="70%" style="display: block; margin: auto;" />

-----

## Reference

<div id="refs" class="references">

<div id="ref-scatter">

Jackson, Simon. 2017. “Pretty Scatter Plots with Ggplot2.”
<https://www.r-bloggers.com/pretty-scatter-plots-with-ggplot2/>.

</div>

</div>
