
context('metaboData')

test_that('available data sets displayed',{
    out <- availableDataSets()
    
    expect_s3_class(out,'tbl_df')
})    


test_that('techinques are returned',{
    tech <- techniques()
    
    expect_true(is.character(tech))
    expect_length(tech,2)
})

test_that('data sets are returned',{
    sets <- dataSets('FIE-HRMS')
    
    expect_true(is.character(sets))
    expect_length(sets,5)
})

test_that('file paths are returned',{
    files <- filePaths('FIE-HRMS',
                       dataSets('FIE-HRMS')[1],
                       ask = FALSE)
    
    expect_true(is.character(files))
    expect_length(files,10)
})

test_that('run information is read correctly',{
    info <- runinfo(
        'FIE-HRMS',
        dataSets('FIE-HRMS')[1],
        ask = FALSE)
    
    expect_s3_class(info,'tbl_df')
    expect_equal(nrow(info),10)
    expect_equal(ncol(info),7)
})

test_that('description is returned',{
    experimentDescription <- description(
        'FIE-HRMS',
        dataSets('FIE-HRMS')[1],
        ask = FALSE)
    
    expect_equal(class(experimentDescription),'list')
    expect_length(experimentDescription,8)
})

test_that('available data sets displayed once downloaded',{
    out <- availableDataSets()
    
    expect_s3_class(out,'tbl_df')
})