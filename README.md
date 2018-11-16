
metaboData
==========

[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/0.1.0/active.svg)](http://www.repostatus.org/#active) [![Travis build status](https://travis-ci.org/aberHRML/metaboData.svg?branch=master)](https://travis-ci.org/aberHRML/metaboData) [![Coverage status](https://codecov.io/gh/aberHRML/metaboData/branch/master/graph/badge.svg)](https://codecov.io/github/aberHRML/metaboData?branch=master) ![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg) [![CRAN status](https://www.r-pkg.org/badges/version/metaboData)](https://cran.r-project.org/package=metaboData) ![downloads](https://cranlogs.r-pkg.org/badges/metaboData)

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

An experimental description can be retrieved for a given experiment of a given metabolomic technique using:

``` r
experimentDescription <- description(
   techniques()[1],
   dataSets(techniques()[1])[1])

str(experimentDescription)
#> List of 8
#>  $ Name             : chr "BdistachyonEcotypes"
#>  $ Technique        : chr "Flow-infusion electrospray ionisation-high resolution mass spectrometry (FIE-HRMS)"
#>  $ Organism         : chr "Brachypodium distachyon"
#>  $ Tissue           : chr "leaf"
#>  $ Description      : chr "Comparison of leaf tissue from 4 B. distachyon ecotypes."
#>  $ Sample_collection: chr "B. distachyon plants were grown to 21 days old. The middle 4cm section of the 3rd leaf from the base of the pla"| __truncated__
#>  $ Extracion        : chr "Samples were milled for 30 seconds at 30Hz whilst frozen then 700ul extraction solvent added (chloroform:methan"| __truncated__
#>  $ MS_analysis      : chr "A QC sample was prepared by taking an equal volume from each sample. Samples were run in a randomised block ord"| __truncated__
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
