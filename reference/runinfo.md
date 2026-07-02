# Data set sample information

Return tibble of run information for a given data set of a given
metabolomics technique.

## Usage

``` r
runinfo(technique, dataSet, dataSetDir = "DataSets", internalDir = TRUE, ...)
```

## Arguments

- technique:

  metabolomic technique name

- dataSet:

  data set name

- dataSetDir:

  directory to store local data sets. If `internalDir = TRUE` this is a
  directory relative to the library location.

- internalDir:

  Logical, should the directory for storing local data sets be internal
  to the package location.

- ...:

  arguments to pass to
  [`downloadDataSet()`](https://aberhrml.github.io/metaboData/reference/downloadDataSet.md)

## Value

A tibble containing sample information.

## Examples

``` r
if (FALSE) { # \dontrun{
info <- runinfo(
   techniques()[1],
   dataSets(techniques()[1])[1])

head(info)
} # }
```
