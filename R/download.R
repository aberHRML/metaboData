#' Download a data set
#' @description Download an example data set.
#' @param technique metabolomic technique name
#' @param dataSet data set name
#' @param dataSetDir directory to store local data sets. If \code{internalDir = TRUE} this is a directory relative to the library location.
#' @param internalDir stored the data set internally to the package installation location
#' @param ask ask before downloading
#' @param ... arguments to pass to \code{piggyback::pb_download()}
#' @importFrom rlang is_interactive inform
#' @importFrom dplyr group_by summarise filter
#' @importFrom piggyback pb_download
#' @importFrom utils menu
#' @export
#' @examples 
#' \dontrun{
#' downloadDataSet('FIE-HRMS','BdistachyonTechnical')
#' }

downloadDataSet <- function(technique,
                            dataSet,
                            dataSetDir = 'DataSets',
                            internalDir = TRUE,
                            ask = TRUE,
                            ...){
    
    if ((!is_interactive()) & isTRUE(ask)){
        stop('Session is non-interactive and user input is required. Use "ask = FALSE" to override this.',
             call. = FALSE)
    }
    
    
    data_set_available <- dataSetAvailable(technique,dataSet,dataSetDir,internalDir)
    
    if (isFALSE(data_set_available)){
        stop('Data set not available. Use "availableDataSets()" to find available data sets.',call. = FALSE)
    }
    
    release_tag <- str_c(technique,'_',dataSet)

    remote_data <- remoteData(remote_repository)

    data_set_size <- remote_data %>%
        filter(tag == release_tag) %>%
        .$size %>%
        sum()

    message(technique,' ',dataSet)
    message('size: ',data_set_size)
    
    download <- 1
    
    if (isTRUE(ask)) {
        inform('Download?')
        download <- menu(c('yes','no'))
    }
    
    if (download == 1) {
        
        data_set_directory <- dataDirectory(dataSetDir,internalDir) %>% 
            str_c(.,
                  technique,
                  dataSet,
                  sep = '/')
        
        if (!dir_exists(data_set_directory)){
            dir_create(data_set_directory)
        }
            
        pb_download(repo = remote_repository,
                    tag = release_tag,
                    dest = data_set_directory,
                    ...)
    }
}

#' Download specific files from a data set
#' @description Download specific files for a given example data set.
#' @param files character vector of file paths to download
#' @param technique metabolomic technique name
#' @param dataSet data set name
#' @param dataSetDir directory to store local data sets. If \code{internalDir = TRUE} this is a directory relative to the library location.
#' @param internalDir stored the data set internally to the package installation location
#' @param ask ask before downloading
#' @param ... arguments to pass to \code{piggyback::pb_download()}
#' @export
#' @examples
#' \dontrun{
#' downloadFiles(c('31.mzML.gz','32.mzML.gz'),'FIE-HRMS','BdistachyonTechnical')
#' }

downloadFiles <- function(files,
                          technique,
                          dataSet,
                          dataSetDir = 'DataSets',
                          internalDir = TRUE,
                          ask = TRUE,
                          ...){
    
    if ((!is_interactive()) & isTRUE(ask)){
        stop('Session is non-interactive and user input is required. Use "ask = FALSE" to override this.',
             call. = FALSE)
    }
    
    
    dataSetAvailable(technique,dataSet,dataSetDir,internalDir)
    
    filesAvailable(files,technique,dataSet,dataSetDir,internalDir)
    
    release_tag <- str_c(technique,'_',dataSet)
    
    remote_files <- availableFiles(technique,dataSet,dataSetDir,internalDir) %>% 
        filter(file_name %in% files)
    
    download_size <- remote_files %>%
        .$size %>%
        sum()
    
    message(technique,' ',dataSet)
    message(str_c(files,collapse = ' '))
    message('size: ',download_size)
    
    download <- 1
    
    if (isTRUE(ask)) {
        inform('Download?')
        download <- menu(c('yes','no'))
    }
    
    if (download == 1) {
        
        data_set_directory <- dataDirectory(dataSetDir,internalDir) %>% 
            str_c(.,
                  technique,
                  dataSet,
                  sep = '/')
        
        if (!dir_exists(data_set_directory)){
            dir_create(data_set_directory)
        }
        
        pb_download(file = remote_files$file_name,
                    repo = remote_repository,
                    tag = release_tag,
                    dest = data_set_directory,
                    ...)
    }
}