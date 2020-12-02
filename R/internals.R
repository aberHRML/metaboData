
remote_repository <- 'aberHRML/metaboData'

#' @importFrom piggyback pb_list
#' @importFrom fs fs_bytes

remoteData <- function(remote_repository){
    pb_list(repo = remote_repository) %>%
        as_tibble() %>%
        mutate(size = fs_bytes(size))
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