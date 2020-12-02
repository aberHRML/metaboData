
context('metaboData')

test_that('available data sets displayed',{
    out <- availableDataSets()
    
    expect_s3_class(out,'tbl_df')
})    


test_that('techinques are returned',{
    tech <- techniques()
    
    expect_true(is.character(tech))
    expect_length(tech,1)
})

test_that('data sets are returned',{
    sets <- dataSets(techniques()[1])
    
    expect_true(is.character(sets))
    expect_length(sets,5)
})

test_that('file paths are returned',{
    files <- filePaths(techniques()[1],
                       dataSets(techniques()[1])[1],
                       ask = FALSE)
    
    expect_true(is.character(files))
    expect_length(files,12)
})

test_that('run information is read correctly',{
    info <- runinfo(
        techniques()[1],
        dataSets(techniques()[1])[1],
        ask = FALSE)
    
    expect_s3_class(info,'tbl_df')
    expect_equal(nrow(info),10)
    expect_equal(ncol(info),7)
})

test_that('description is returned',{
    experimentDescription <- description(
        techniques()[1],
        dataSets(techniques()[1])[1],
        ask = FALSE)
    
    expect_equal(class(experimentDescription),'list')
    expect_length(experimentDescription,8)
})

test_that('available data sets displayed once downloaded',{
    out <- availableDataSets()
    
    expect_s3_class(out,'tbl_df')
})