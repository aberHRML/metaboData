#' runinfo
#' @description Return tibble of run information for a given data set of a given metabolomics technique.
#' @param technique metabolomic technique name
#' @param dataSet data set name
#' @examples
#' info <- runinfo(
#'    techniques()[1],
#'    dataSets(techniques()[1])[1])
#' 
#' head(info)
#' @importFrom readr read_csv
#' @export

runinfo <- function(technique,dataSet){
    list.files(system.file(str_c('DataSets',technique,dataSet,sep = '/'),package = 'metaboData'),full.names = T) %>%
        .[str_detect(.,'.csv')] %>%
        read_csv()
}