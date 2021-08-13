
context('metaboData')

test_that('available data sets displayed',{
    skip_on_cran()
    skip_on_ci()
    
    out <- availableDataSets()
    
    expect_s3_class(out,'tbl_df')
})    

test_that('available files can be displayed',{
    skip_on_cran()
    skip_on_ci()
    
    out <- availableFiles('FIE-HRMS','BdistachyonTechnical')
    
    expect_s3_class(out,'tbl_df')
})   

test_that('techinques are returned',{
    skip_on_cran()
    skip_on_ci()
    
    tech <- techniques()
    
    expect_true(is.character(tech))
    expect_length(tech,2)
})

test_that('data sets are returned',{
    skip_on_cran()
    skip_on_ci()
    
    sets <- dataSets('FIE-HRMS')
    
    expect_true(is.character(sets))
    expect_length(sets,5)
})


test_that('a file can be downloaded',{
    skip_on_cran()
    skip_on_ci()
    
    data_directory <- str_c(tempdir(),'/DataSets')
    
    downloadFiles('31.mzML.gz',
                  'FIE-HRMS',
                  'BdistachyonTechnical',
                  dataSetDir = data_directory,
                  internalDir = FALSE,
                  ask = FALSE,
                  show_progress = FALSE)
    
    expect_true(file.exists(
        str_c(data_directory,
              'FIE-HRMS',
              'BdistachyonTechnical',
              '31.mzML.gz',
              sep = '/')))
})

test_that('a data set can be downloaded and that the file paths, runinfo and description can be retrieved',{
    skip_on_cran()
    skip_on_ci()
    
    downloadDataSet(
        'FIE-HRMS',
        dataSets('FIE-HRMS')[1],
        ask = FALSE,
        show_progress = FALSE
    )
    
    files <- filePaths('FIE-HRMS',
                       dataSets('FIE-HRMS')[1],
                       ask = FALSE)
    
    expect_true(is.character(files))
    expect_length(files,10)
    
    info <- runinfo(
        'FIE-HRMS',
        dataSets('FIE-HRMS')[1],
        ask = FALSE)
    
    expect_s3_class(info,'tbl_df')
    expect_equal(nrow(info),10)
    expect_equal(ncol(info),7)
    
    experimentDescription <- description(
        'FIE-HRMS',
        dataSets('FIE-HRMS')[1],
        ask = FALSE)
    
    expect_equal(class(experimentDescription),'list')
    expect_length(experimentDescription,8)
})

test_that('available data sets displayed once downloaded',{
    skip_on_cran()
    skip_on_ci()
    
    out <- availableDataSets()
    
    expect_s3_class(out,'tbl_df')
    
    out_files <- availableFiles('FIE-HRMS',
                                dataSets('FIE-HRMS')[1])
    
    expect_s3_class(out_files,'tbl_df')
})

test_that('available files displayed once downloaded',{
    skip_on_cran()
    skip_on_ci()
    
    out_files <- availableFiles('FIE-HRMS',
                                dataSets('FIE-HRMS')[1])
    
    expect_s3_class(out_files,'tbl_df')
})