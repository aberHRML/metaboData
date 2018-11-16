
context('metaboData')

test_that('available data sets displayed',{
    out <- capture.output(availableDataSets())
    
    expect_true(is.character(out))
    expect_true(length(out) == 4)
})

test_that('techinques are returned',{
    tech <- techniques()
    
    expect_true(is.character(tech))
    expect_true(length(tech) == 1)
})

test_that('data sets are returned',{
    sets <- dataSets(techniques()[1])
    
    expect_true(is.character(sets))
    expect_true(length(sets) == 1)
})

test_that('file paths are returned',{
    files <- filePaths(techniques()[1],dataSets(techniques()[1])[1])
    
    expect_true(is.character(files))
    expect_true(length(files) == 68)
})

test_that('run information is read correctly',{
    info <- runinfo(
        techniques()[1],
        dataSets(techniques()[1])[1])
    
    expect_true(identical(class(info),c("tbl_df","tbl","data.frame")))
    expect_true(nrow(info) == 68)
    expect_true(ncol(info) == 7)
})

test_that('description is returned',{
    experimentDescription <- description(
        techniques()[1],
        dataSets(techniques()[1])[1])
    
    expect_true(class(experimentDescription) == 'list')
    expect_true(length(experimentDescription) == 8)
})