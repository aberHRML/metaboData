# metaboData 0.6.3

* Removed malformed email addresses from the [`abr1`](https://aberhrml.github.io/metaboData/reference/abr1.html) data set documentation.

# metaboData 0.6.2

* Fixes to the package description for CRAN submission.

# metaboData 0.6.1

* Added Manfred Beckmann, David Enot and Wanchang Lin as package contributors.

* Added return values to the documentation of [`metaboData::downloadFiles()`](https://aberhrml.github.io/metaboData/reference/downloadFiles.html) and [`metaboData::downloadDataSet()`](https://aberhrml.github.io/metaboData/reference/downloadDataSet.html).

# metaboData 0.6.0

* Fix error caused when destination directory for data downloads does not exist.

* Added [`metaboData::availableFiles()`](https://aberhrml.github.io/metaboData/reference/availableFiles.html) to view the available files for a given data set.

* Added [`metaboData::downloadFiles()`](https://aberhrml.github.io/metaboData/reference/downloadFiles.html) to download specific files of given data set.

* The [`magrittr::%>%`](https://magrittr.tidyverse.org/reference/pipe.html) is now re-exported.

# metaboData 0.5.1

* [`metaboData::filePaths()`](https://aberhrml.github.io/metaboData/reference/filePaths.html) now only returns file paths to `.mzML` files.

# metaboData 0.5.0

* Added a `NEWS.md` file to track changes to the package.

* Added RP-UHPLC-HRMS *Brachypodium distachyon* ecotype comparison data set.

* Data sets now available remotely and are available to download using [`metaboData::downloadDataSet()`](https://aberhrml.github.io/metaboData/reference/downloadDataSet.html).
