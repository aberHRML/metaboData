#' filePaths
#' @description Return a vector of file paths for a given data set of a given metabolomic technique.
#' @param technique metabolomic technique name
#' @param dataSet data set name
#' @examples 
#' files <- filePaths(
#'    techniques()[1],
#'    dataSets(techniques()[1])[1])
#' 
#' head(files)
#' @importFrom stringr str_c str_detect
#' @export

filePaths <- function(technique,dataSet){
    list.files(system.file(str_c('DataSets',technique,dataSet,sep = '/'),package = 'metaboData'),full.names = T) %>%
        .[str_detect(.,'.mzML')]
}

#' techniques
#' @description Return a vector of available metabolomic techniques.
#' @examples 
#' techniques()
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

#' dataSets
#' @description Return a vector of available data sets for a given metabolomic technique.
#' @param technique metabolomic technique name
#' @examples 
#' dataSets(techniques()[1])
#' @export

dataSets <- function(technique){
    list.dirs(system.file(str_c('DataSets',technique,sep = '/'),package = 'metaboData'),recursive = F) %>%
        map_chr(~{
            str_split(.,'/') %>%
                .[[1]] %>%
                .[length(.)]  
        })
}