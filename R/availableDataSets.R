#' availableDataSets
#' @description Displays file paths for available data sets.
#' @export
#' @examples 
#' availableDataSets()
#' 
#' ## Can be run to access individual file paths
#' list.files(system.file('DataSets/FIE-HRMS/BdistachyonEcotypes',
#'                         package = 'metaboData'),
#'            full.names = TRUE)

availableDataSets <- function(){
   dirs <- list.dirs(system.file('DataSets',package = 'metaboData'),recursive = F)
   dataSets <- lapply(dirs,function(x){
       tech <- strsplit(x,'/')
       cat('\n',tech[[1]][length(tech[[1]])])
       dataSets <- list.dirs(x,recursive = F)
       cat('\n',dataSets,'\n\n')
   })
}