#' availableDataSets
#' @description Displays available data sets.
#' @param dataSetDir directory containing local data set store. If \code{internalDir = TRUE} the full directory path would be relative to the library location.
#' @param internalDir Logical, are local data sets stored internal to the package location.
#' @return A tibble containing available data set information.
#' @importFrom purrr walk map
#' @importFrom piggyback pb_list
#' @importFrom stringr str_split_fixed str_extract regex str_remove_all
#' @importFrom tibble as_tibble tibble
#' @importFrom magrittr set_colnames set_names
#' @importFrom fs dir_ls dir_exists
#' @importFrom dplyr bind_rows mutate select left_join
#' @export
#' @examples 
#' availableDataSets()

availableDataSets <- function(dataSetDir = 'DataSets',
                              internalDir = TRUE){
   
   remote_data <- pb_list(repo = remote_repository)
   
   remote_data_sets <- remote_data$tag %>%
      unique() %>%
      str_split_fixed('_',2) %>%
      as_tibble(.name_repair = 'minimal') %>%
      set_colnames(c('technique','data set'))
   
   remote_data_files <- remote_data %>%
      split(.$tag) %>%
      map(~{.$file_name})
   
   if (isTRUE(internalDir)){
      data_set_directory <- system.file(package = 'metaboData') %>%
         str_c('/',dataSetDir)
   } else {
      data_set_directory <- dataSetDir
   }
   
   if (dir_exists(data_set_directory)){
      local_techniques <- dir_ls(data_set_directory)
      
      local_data_sets <- local_techniques %>%
         map(~{
            .x %>%
               dir_ls() %>%
               basename() %>%
               tibble(`data set` = .)
         }) %>%
         set_names(basename(local_techniques)) %>%
         bind_rows(.id = 'technique') %>%
         mutate(status = 'available')
      
      local_data_files <- local_data_sets %>%
         split(seq_len(nrow(.))) %>%
         map(~{
            str_c(data_set_directory,.x$technique,.x$`data set`,sep = '/') %>%
               dir_ls() %>%
               basename()
         }) %>%
         set_names(str_c(local_data_sets$technique,
                         local_data_sets$`data set`,
                         sep = '_'))
      
      local_data_status <- names(local_data_files) %>%
         map(~{
            {remote_data_files[[.x]] %in% local_data_files[[.x]]} %>%
               {
                  !(FALSE %in% .)
               } %>%
               tibble(complete = .)
         }) %>%
         set_names(names(local_data_files)) %>%
         bind_rows(.id = 'tag') %>%
         mutate(technique = str_extract(tag,regex('.*_')) %>%
                   str_remove_all('_'),
                `data set` = str_extract(tag,regex('_.*')) %>%
                   str_remove_all('_')) %>%
         select(-tag)
      
      local_data_sets <- local_data_sets %>%
         left_join(local_data_status, 
                   by = c("technique", "data set")) %>%
         {
            .$status[.$complete == FALSE] <- 'incomplete download'  
            .
         } %>%
         select(-complete)
      
      remote_data_sets <- remote_data_sets %>%
         left_join(local_data_sets, 
                   by = c("technique", "data set")) %>%
         {
            .$status[is.na(.$status)] <- 'needs downloading'
            .
         }   
   } else {
      remote_data_sets <- remote_data_sets %>%
         mutate(status = 'needs downloading')
   }
   
   return(remote_data_sets)
}