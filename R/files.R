#' @importFrom stringr str_c
#' @export

filePaths <- function(technique,dataSet){
    list.files(system.file(str_c('DataSets',technique,dataSet,sep = '/'),package = 'metaboData'),full.names = T)
}

#' @importFrom magrittr %>%
#' @importFrom stringr str_split
#' @importFrom purrr map_chr
#' @export

techniques <- function(){
    list.dirs(system.file('DataSets',package = 'metaboData'),recursive = F) %>%
        map_chr(~{
            str_split(.,'/') %>%
                .[[1]] %>%
                .[length(.)]    
        })
        
}

#' @export

dataSets <- function(technique){
    list.dirs(system.file(str_c('DataSets',technique,sep = '/'),package = 'metaboData'),recursive = F) %>%
        map_chr(~{
            str_split(.,'/') %>%
                .[[1]] %>%
                .[length(.)]  
        })
}