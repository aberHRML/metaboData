# Available files for a data set

Display the available files for a given data set.

## Usage

``` r
availableFiles(technique, dataSet, dataSetDir = "DataSets", internalDir = TRUE)
```

## Arguments

- technique:

  metabolomic technique name

- dataSet:

  data set name

- dataSetDir:

  directory containing local data set store. If `internalDir = TRUE` the
  full directory path would be relative to the package installation
  location.

- internalDir:

  stored the data set internally to the package installation location

## Value

A tibble containing available file information.

## Examples

``` r
if (FALSE) { # \dontrun{
availableFiles('FIE-HRMS','BdistachyonTechnical')
} # }
```
