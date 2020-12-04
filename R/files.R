#' Data set file paths
#' @description Return a vector of file paths for a given data set of a given metabolomic technique.
#' @param technique metabolomic technique name
#' @param dataSet data set name
#' @param dataSetDir directory to store local data sets. If \code{internalDir = TRUE} this is a directory relative to the library location.
#' @param internalDir Logical, should the directory for storing local data sets be internal to the package location.
#' @param  ... arguments to pass to \code{downloadDataSet()}
#' @return A character vector of file paths.
#' @examples 
#' \dontrun{
#' files <- filePaths(
#'    techniques()[1],
#'    dataSets(techniques()[1])[1])
#' 
#' head(files)
#' }
#' @importFrom stringr str_c str_detect
#' @export

filePaths <- function(technique,
                      dataSet,
                      dataSetDir = 'DataSets',
                      internalDir = TRUE,
                      ...){
    
    if (!dataSetAvailableLocal(technique,dataSet,dataSetDir,internalDir)) {
        downloadDataSet(technique,dataSet,dataSetDir,internalDir,...)
    }
    
    data_directory <- dataDirectory(dataSetDir,internalDir)
    
    dir_ls(str_c(data_directory,technique,dataSet,sep = '/'))
}

#' Available data set techniques
#' @description Return a vector of available metabolomic techniques.
#' @return A character vector of available techniques.
#' @examples 
#' techniques()
#' @importFrom magrittr %>%
#' @importFrom stringr str_split
#' @importFrom purrr map_chr
#' @export

techniques <- function(){

    remote_data <- remoteData(remote_repository)
    
    unique(remote_data$technique)
}

#' Available data sets for a given technique
#' @description Return a vector of available data sets for a given metabolomic technique.
#' @param technique metabolomic technique name
#' @return A character vector of available data sets.
#' @examples 
#' dataSets(techniques()[1])
#' @importFrom tibble deframe
#' @export

dataSets <- function(technique){
    if (!technique %in% techniques()) {
        stop('Technique unavailable. Use "techniques()" to show available techniques.',
             call. = FALSE)
    }
    
    remote_data <- remoteData(remote_repository)
    
    remote_data %>%
        filter(technique == technique) %>%
        select(`data set`) %>%
        distinct() %>%
        deframe()
}

#' Data set description
#' @description Return list containing experiment description elements
#' @param technique metabolomic technique name
#' @param dataSet data set name
#' @param dataSetDir directory to store local data sets. If \code{internalDir = TRUE} this is a directory relative to the library location.
#' @param internalDir Logical, should the directory for storing local data sets be internal to the package location.
#' @param  ... arguments to pass to \code{downloadDataSet()}
#' @return A list containing data set descriptors.
#' @examples 
#' \dontrun{
#' description(
#'    techniques()[1],
#'    dataSets(techniques()[1])[1])
#' }
#' @importFrom yaml read_yaml 
#' @export

description <- function(technique,
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
        .[str_detect(.,'.yml')] %>%
        read_yaml() 
}