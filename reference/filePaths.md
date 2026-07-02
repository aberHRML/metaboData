# Data set file paths

Return a vector of file paths for a given data set of a given
metabolomic technique.

## Usage

``` r
filePaths(technique, dataSet, dataSetDir = "DataSets", internalDir = TRUE, ...)
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

A character vector of file paths.

## Examples

``` r
if (FALSE) { # \dontrun{
files <- filePaths(
   techniques()[1],
   dataSets(techniques()[1])[1])

head(files)
} # }
```
