doc:
    Rscript -e "devtools::document()"

check:
    Rscript -e "devtools::check()"

check-release:
    Rscript -e "devtools::release_checks()"

test:
    Rscript -e "devtools::test()"

test-coverage:
    Rscript -e "devtools::test_coverage()"

build:
    Rscript -e "devtools::build()"

