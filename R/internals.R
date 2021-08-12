
remote_repository <- 'aberHRML/metaboData'

#' @importFrom piggyback pb_list
#' @importFrom fs fs_bytes dir_create

remoteData <- function(remote_repository){
    pb_list(repo = remote_repository) %>%
        as_tibble() %>%
        filter(!str_detect(tag,regex('(v[0-9]+[.][0-9]+[.][0-9]+)'))) %>%
        mutate(size = fs_bytes(size),
               technique = str_extract(tag,regex('.*_')) %>%
                   str_remove_all('_'),
               `data set` = str_extract(tag,regex('_.*')) %>%
                   str_remove_all('_'))
}

dataDirectory <- function(dataSetDir,internalDir){
    if (isTRUE(internalDir)){
        data_set_directory <- system.file(package = 'metaboData') %>%
            str_c('/',dataSetDir)
    } else {
        data_set_directory <- dataSetDir
    }
    
    return(data_set_directory)
}

dataSetAvailable <- function(technique,dataSet,dataSetDir,internalDir){
    available_data_sets <- availableDataSets(dataSetDir = dataSetDir,
                                             internalDir = internalDir)
    
    if (!(technique %in% available_data_sets$technique) | 
        !(dataSet %in% available_data_sets$`data set`)){
        stop('Data set not available. Use "availableDataSets()" to find available data sets.',call. = FALSE)
    } else {
        invisible(TRUE)
    }
}

filesAvailable <- function(files,technique,dataSet,dataSetDir,internalDir){
    available_data_sets <- availableDataSets(dataSetDir = dataSetDir,
                                             internalDir = internalDir)
    
    if (!(technique %in% available_data_sets$technique) | 
        !(dataSet %in% available_data_sets$`data set`)){
        stop('Files are not available. Use "availableFiles()" to find available files for this data set.',call. = FALSE)
    } else {
        invisible(TRUE)
    }
}

dataSetAvailableLocal <- function(technique,dataSet,dataSetDir,internalDir){
    data_directory <- dataDirectory(dataSetDir,internalDir)
    
    dir_exists(str_c(data_directory,technique,dataSet,sep = '/'))
}