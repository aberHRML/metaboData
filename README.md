
# metaboData

<!-- badges: start -->

[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![R build
status](https://github.com/aberHRML/metaboData/workflows/R-CMD-check/badge.svg)](https://github.com/aberHRML/metaboData/actions)
[![Coverage
status](https://codecov.io/gh/aberHRML/metaboData/branch/master/graph/badge.svg)](https://codecov.io/github/aberHRML/metaboData?branch=master)
![License: GPL
v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)
<!-- badges: end -->

An R package containing example data sets for metabolomics analyses.

To install directly from this repository run:

``` {r,eval=false)
devtools::install_github('aberHRML/metaboData',build_vignettes = TRUE)
```

Or package can be installed via a drat repository hosted on github
using:

``` rm
install.packages('metaboData',repos = 'https://aberhrml.github.io/drat/')
```

Available data sets can be viewed using:

``` r
library(metaboData)

availableDataSets()
#> 
#>  FIE-HRMS
#>      - BdistachyonEcotypes
#>  - BdistachyonTechnical
#>  - PlasmaTechnical
#>  - SerumTechnical
#>  - UrineTechnical
```

Available metabolomic techniques can be returned using:

``` r
techniques()
#> [1] "FIE-HRMS"
```

Available data sets for a given metabolomic technique can be returned
using:

``` r
dataSets(techniques()[1])
#> [1] "BdistachyonEcotypes"  "BdistachyonTechnical" "PlasmaTechnical"     
#> [4] "SerumTechnical"       "UrineTechnical"
```

File paths for data files within a given data set can be returned using:

``` r
files <- filePaths(
    techniques()[1],
    dataSets(techniques()[1])[1])

length(files)
#> [1] 68
```

An experimental description can be retrieved for a given experiment of a
given metabolomic technique using:

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

Run information can be retrieved for a given experiment of a given
metabolomic technique using:

``` r
info <- runinfo(
    techniques()[1],
    dataSets(techniques()[1])[1])

head(info)
#> # A tibble: 6 x 7
#>   fileOrder injOrder fileName   batch block name    class
#>       <dbl>    <dbl> <chr>      <dbl> <dbl> <chr>   <chr>
#> 1         1       64 1.mzML.gz      1     5 ABR1_1  ABR1 
#> 2         2       40 10.mzML.gz     1     3 ABR1_10 ABR1 
#> 3         3       52 11.mzML.gz     1     4 ABR1_11 ABR1 
#> 4         4       67 12.mzML.gz     1     5 ABR1_12 ABR1 
#> 5         5       32 13.mzML.gz     1     3 ABR1_13 ABR1 
#> 6         6       53 14.mzML.gz     1     4 ABR1_14 ABR1
```

The `abr1` FIE-MS data set is included from the
[FIEmspro](https://github.com/aberHRML/FIEmspro) package.
