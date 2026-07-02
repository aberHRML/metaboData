# Download specific files from a data set

Download specific files for a given example data set.

## Usage

``` r
downloadFiles(
  files,
  technique,
  dataSet,
  dataSetDir = "DataSets",
  internalDir = TRUE,
  ask = TRUE,
  ...
)
```

## Arguments

- files:

  character vector of file paths to download

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
downloadFiles(c('31.mzML.gz','32.mzML.gz'),'FIE-HRMS','BdistachyonTechnical')
} # }
```
