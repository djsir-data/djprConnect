
<!-- README.md is generated from README.Rmd. Please edit that file -->

# djprConnect

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

## Installation

You can install the development version of djprConnect like so:

``` r
remotes::install_github('djpr-data/djprConnect')
```

## Example

This is a basic example which shows you how to connect to the DJPR
PostgreSQL database:

``` r
library(djprConnect)

con <- djpr_connect()

DBI::dbListTables(con)
#>  [1] "spatial_ref_sys"        "geography_columns"      "topology"              
#>  [4] "layer"                  "plan_zone"              "supp_fy"               
#>  [7] "green_wedge2016_region" "metadata_uploads"       "geometry_columns"      
#> [10] "abs_labour_force"       "supp_cy"                "bop"                   
#> [13] "merch"                  "merch_imp"              "service_trade"         
#> [16] "foodfibre"
```
