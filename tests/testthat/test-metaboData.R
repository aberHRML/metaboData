
context('metaboData')

test_that('available data sets displayed',{
    skip_on_cran()
    
    out <- availableDataSets()
    
    expect_s3_class(out,'tbl_df')
})    

test_that('techinques are returned',{
    skip_on_cran()
    
    tech <- techniques()
    
    expect_true(is.character(tech))
    expect_length(tech,2)
})

test_that('data sets are returned',{
    skip_on_cran()
    
    sets <- dataSets('FIE-HRMS')
    
    expect_true(is.character(sets))
    expect_length(sets,5)
})

test_that('a data set can be downloaded and that the file paths, runinfo and description can be retrieved',{
    skip_on_cran()
    
    downloadDataSet(
        'FIE-HRMS',
        'BdistachyonTechnical',
        ask = FALSE
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
    
    out <- availableDataSets()
    
    expect_s3_class(out,'tbl_df')
})