
metaboData
==========

[![Travis build status](https://travis-ci.org/aberHRML/metaboData.svg?branch=master)](https://travis-ci.org/aberHRML/metaboData)

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

Available techniques can be returned using:

``` r
techniques()
#> [1] "FIE-HRMS"
```

Available data sets for a given technique can be returned using:

``` r
dataSets(techniques()[1])
#> [1] "BdistachyonEcotypes"
```

File paths for files within a given data set can be returned using:

``` r
files <- filePaths(
    techniques()[1],
    dataSets(techniques()[1])[1])

length(files)
#> [1] 69
```

The `abr1` FIE-MS data set is included from the [FIEmspro](https://github.com/aberHRML/FIEmspro) package.
