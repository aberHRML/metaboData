# Available data sets

Displays available data sets.

## Usage

``` r
availableDataSets(dataSetDir = "DataSets", internalDir = TRUE)
```

## Arguments

- dataSetDir:

  directory containing local data set store. If `internalDir = TRUE` the
  full directory path would be relative to the package installation
  location.

- internalDir:

  stored the data set internally to the package installation location

## Value

A tibble containing available data set information.

## Examples

``` r
if (FALSE) { # \dontrun{
availableDataSets()
} # }
```
