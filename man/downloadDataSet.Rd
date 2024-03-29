% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/download.R
\name{downloadDataSet}
\alias{downloadDataSet}
\title{Download a data set}
\usage{
downloadDataSet(
  technique,
  dataSet,
  dataSetDir = "DataSets",
  internalDir = TRUE,
  ask = TRUE,
  ...
)
}
\arguments{
\item{technique}{metabolomic technique name}

\item{dataSet}{data set name}

\item{dataSetDir}{directory to store local data sets. If \code{internalDir = TRUE} this is a directory relative to the library location.}

\item{internalDir}{stored the data set internally to the package installation location}

\item{ask}{ask before downloading}

\item{...}{arguments to pass to \code{piggyback::pb_download()}}
}
\value{
A list object containing the API request response results for the downloaded files.
}
\description{
Download an example data set.
}
\examples{
\dontrun{
downloadDataSet('FIE-HRMS','BdistachyonTechnical')
}
}
