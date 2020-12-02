#' Download a data set
#' @description Download an example data set.
#' @param technique metabolomic technique name
#' @param dataSet data set name
#' @param dataSetDir directory to store local data sets. If \code{internalDir = TRUE} this is a directory relative to the library location.
#' @param internalDir Logical, should the directory for storing local data sets be internal to the package location.
#' @param ask ask before downloading
#' @importFrom rlang is_interactive inform
#' @importFrom dplyr group_by summarise filter
#' @importFrom piggyback pb_download
#' @export

downloadDataSet <- function(technique,
                            dataSet,
                            dataSetDir = 'DataSets',
                            internalDir = TRUE,
                            ask = TRUE){
    
    if (!is_interactive()){
        stop('Session is non-interactive and user input is required. Use "ask = FALSE" to override this.',
             call. = FALSE)
    }
    
    available_data_sets <- availableDataSets(dataSetDir = dataSetDir,
                                             internalDir = internalDir)
    
    if (!(technique %in% available_data_sets$technique) | 
        !(dataSet %in% available_data_sets$`data set`)){
        stop('Data set not available. Use "availableDataSets()" to find available data sets.',call. = FALSE)
    }
    
    release_tag <- str_c(technique,'_',dataSet)

    remote_data <- remoteData(remote_repository)

    data_set_size <- remote_data %>%
        group_by(tag) %>%
        summarise(size = sum(size),.groups = 'drop') %>%
        filter(tag == release_tag)

    message(technique,' ',dataSet)
    message('size: ',data_set_size$size)
    
    download <- 1
    
    if (isTRUE(ask)) {
        inform('Download?')
        download <- menu(c('yes','no'))
    }
    
    if (download == 1) {
        
        data_set_directory <- dataDirectory(dataSetDir,internalDir)
        
        pb_download(tag = release_tag,
                    dest = data_set_directory)
    }
}