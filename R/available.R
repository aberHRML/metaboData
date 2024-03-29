#' Available data sets
#' @description Displays available data sets.
#' @param dataSetDir directory containing local data set store. If \code{internalDir = TRUE} the full directory path would be relative to the package installation location.
#' @param internalDir stored the data set internally to the package installation location
#' @return A tibble containing available data set information.
#' @importFrom purrr walk map
#' @importFrom stringr str_extract regex str_remove_all
#' @importFrom tibble as_tibble tibble
#' @importFrom magrittr set_colnames set_names
#' @importFrom fs dir_ls dir_exists
#' @importFrom dplyr bind_rows mutate select left_join distinct
#' @export
#' @examples 
#' \dontrun{
#' availableDataSets()
#' }

availableDataSets <- function(dataSetDir = 'DataSets',
                              internalDir = TRUE){
   
   remote_data <- remoteData(remote_repository)
   
   remote_data_sets <- remote_data %>%
      select(technique,`data set`) %>%
      distinct()
   
   remote_data_files <- remote_data %>%
      split(.$tag) %>%
      map(~{.$file_name})
   
   data_set_directory <- dataDirectory(dataSetDir,
                                       internalDir)
   
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

#' Available files for a data set
#' @description Display the available files for a given data set.
#' @param technique metabolomic technique name
#' @param dataSet data set name
#' @param dataSetDir directory containing local data set store. If \code{internalDir = TRUE} the full directory path would be relative to the package installation location.
#' @param internalDir stored the data set internally to the package installation location
#' @return A tibble containing available file information.
#' @importFrom dplyr right_join relocate arrange
#' @export
#' @examples 
#' \dontrun{
#' availableFiles('FIE-HRMS','BdistachyonTechnical')
#' }

availableFiles <- function(technique,
                           dataSet,
                           dataSetDir = 'DataSets',
                           internalDir = TRUE){
   remote_data <- remoteData(remote_repository)
   
   remote_files <- remote_data %>%
      filter(technique == technique,
             `data set` == dataSet) %>% 
      select(file_name,size,technique,`data set`)
   
   data_set_directory <- dataDirectory(dataSetDir,
                                       internalDir) %>% 
      str_c(.,technique,dataSet,sep = '/')
   
   if (dir_exists(data_set_directory)){
      
      remote_files <- data_set_directory %>%
         dir_ls() %>%
         basename() %>%
         tibble(file_name = .) %>%
         mutate(status = 'available') %>% 
         right_join(remote_files, 
                   by = 'file_name') %>%
         {
            .$status[is.na(.$status)] <- 'needs downloading'  
            .
         } %>% 
         relocate(status,
                  .after = `data set`) %>% 
         arrange(file_name)
   } else {
      remote_files <- remote_files %>%
         mutate(status = 'needs downloading')
   }
   
   return(remote_files)
}