#' runinfo
#' @description Return tibble of run information for a given data set of a given metabolomics technique.
#' @param technique metabolomic technique name
#' @param dataSet data set name
#' @param dataSetDir directory to store local data sets. If \code{internalDir = TRUE} this is a directory relative to the library location.
#' @param internalDir Logical, should the directory for storing local data sets be internal to the package location.
#' @param  ... arguments to pass to \code{downloadDataSet()}
#' @examples
#' info <- runinfo(
#'    techniques()[1],
#'    dataSets(techniques()[1])[1])
#' 
#' head(info)
#' @importFrom readr read_csv
#' @export

runinfo <- function(technique,
                    dataSet,
                    dataSetDir = 'DataSets',
                    internalDir = TRUE,
                    ...){
    if (!dataSetAvailableLocal(technique,dataSet,dataSetDir,internalDir)) {
        downloadDataSet(technique,dataSet,dataSetDir,internalDir,...)
    }
    
    data_directory <- dataDirectory(dataSetDir,internalDir)
    
    data_directory %>%
        str_c(technique,dataSet,sep = '/') %>%
        dir_ls() %>%
        .[str_detect(.,'.csv')] %>%
        {
            suppressMessages(read_csv(.))   
        }
}