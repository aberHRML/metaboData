#' availableDataSets
#' @description Displays available data sets.
#' @importFrom purrr walk
#' @export
#' @examples 
#' availableDataSets()

availableDataSets <- function(){
   dirs <- list.dirs(system.file('DataSets',package = 'metaboData'),recursive = F)
   dataSets <- walk(dirs,~{
       tech <- strsplit(.,'/')
       cat('\n',tech[[1]][length(tech[[1]])])
       dataSets <- basename(list.dirs(.,recursive = F)) %>%
           map_chr(~{str_c('\t- ',.)}) %>%
           str_c(.,collapse = '\n\n')
       cat('\n',dataSets)
   })
}