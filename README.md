
metaboData
==========

[![Travis build status](https://travis-ci.org/aberHRML/metaboData.svg?branch=master)](https://travis-ci.org/aberHRML/metaboData) [![Coverage status](https://codecov.io/gh/aberHRML/metaboData/branch/master/graph/badge.svg)](https://codecov.io/github/aberHRML/metaboData?branch=master)

An R package containing example data sets for metabolomics analyses

To install this repository run:

``` {r,eval=false)
remotes::install_github('aberHRML/metaboData')
```

Available data sets can be viewed using:

``` r
library(metaboData)

availableDataSets()
#> 
#>  FIE-HRMS
#>   - BdistachyonEcotypes
```

Available metabolomic techniques can be returned using:

``` r
techniques()
#> [1] "FIE-HRMS"
```

Available data sets for a given metabolomic technique can be returned using:

``` r
dataSets(techniques()[1])
#> [1] "BdistachyonEcotypes"
```

File paths for data files within a given data set can be returned using:

``` r
files <- filePaths(
    techniques()[1],
    dataSets(techniques()[1])[1])

length(files)
#> [1] 68
```

Run information can be retrieved for a given experiment of a given metabolomic technique using:

``` r
info <- runinfo(
    techniques()[1],
    dataSets(techniques()[1])[1])
#> Parsed with column specification:
#> cols(
#>   fileOrder = col_integer(),
#>   injOrder = col_integer(),
#>   fileName = col_character(),
#>   batch = col_integer(),
#>   block = col_integer(),
#>   name = col_character(),
#>   class = col_character()
#> )

head(info)
#> # A tibble: 6 x 7
#>   fileOrder injOrder fileName batch block name    class
#>       <int>    <int> <chr>    <int> <int> <chr>   <chr>
#> 1         1       40 10.mzML      1     3 ABR1_10 ABR1 
#> 2         2       52 11.mzML      1     4 ABR1_11 ABR1 
#> 3         3       67 12.mzML      1     5 ABR1_12 ABR1 
#> 4         4       32 13.mzML      1     3 ABR1_13 ABR1 
#> 5         5       53 14.mzML      1     4 ABR1_14 ABR1 
#> 6         6        4 15.mzML      1     1 ABR1_15 ABR1
```

The `abr1` FIE-MS data set is included from the [FIEmspro](https://github.com/aberHRML/FIEmspro) package.
