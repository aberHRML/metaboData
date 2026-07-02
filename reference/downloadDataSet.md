# Download a data set

Download an example data set.

## Usage

``` r
downloadDataSet(
  technique,
  dataSet,
  dataSetDir = "DataSets",
  internalDir = TRUE,
  ask = TRUE,
  ...
)
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

  stored the data set internally to the package installation location

- ask:

  ask before downloading

- ...:

  arguments to pass to
  [`piggyback::pb_download()`](https://docs.ropensci.org/piggyback/reference/pb_download.html)

## Value

A list object containing the API request response results for the
downloaded files.

## Examples

``` r
if (FALSE) { # \dontrun{
downloadDataSet('FIE-HRMS','BdistachyonTechnical')
} # }
```
