#' availableDataSets
#' @description Displays available data sets.
#' @export
#' @examples 
#' availableDataSets()

availableDataSets <- function(){
   dirs <- list.dirs(system.file('DataSets',package = 'metaboData'),recursive = F)
   dataSets <- lapply(dirs,function(x){
       tech <- strsplit(x,'/')
       cat('\n',tech[[1]][length(tech[[1]])])
       dataSets <- basename(list.dirs(x,recursive = F))
       cat('\n\t','-',dataSets,'\n\n')
   })
}