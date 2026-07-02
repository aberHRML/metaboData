# The abr1 dataset

Real world FIE-MS dataset.

## Usage

``` r
data(abr1)
```

## Source

The FIEmspro package <https://github.com/aberHRML/FIEmspro>

## Value

A list with the following elements:

- fact:

  A data frame containing experimental meta-data.

- pos:

  A data frame for positive data with 120 observations and 2000
  variables.

- neg:

  A data frame for negative data with 120 observations and 2000
  variables.

## Details

FIE-MS data matrices developed from analysis of samples representing a
time course of pathogen attack in a model plant species (Brachypodium
distachyon). The data was developed in a single batch with all samples
randomised using a Thermo LTQ linear ion trap processed using
`fiems_ltq_main`. Both positive and negative ion mode are given
(`abr1$pos` and `abr1$neg`). To avoid confusions, variable names are
given with a letter corresponding to the ionisation mode followed by the
actual nominal mass value (e.g. P130 corresponds to the nominal mass 130
in the positive mode).

Experimental factors are given in the `abr1$fact` data frame:

- `injorder:` sample injection order

- `name:` sample name

- `rep:` biological replicate for a given class

- `day:` number of days following infection after which the sample has
  been harvested - Level H corresponds to an healthy plant.

- `class:` identical to day except that `class=6` when `day=H`

- `pathcdf,filecdf,name.org,remark:` are generated from profile
  processing and are kept for traceability purposes.

Factor of interest for classification are contained in `abr1$fact$day`.
There are 20 biological replicates in each class has

## Author

Manfred Beckmann, David Enot and Wanchang Lin

## Examples

``` r

# Load data set
data(abr1)

# Select data set
dat <- abr1$neg

# number of observations and variables in the negative mode matrix
dim(dat)
#> [1]  120 2000

# names of the variables
dimnames(dat)[[2]] %>% 
 head()
#> [1] "N1" "N2" "N3" "N4" "N5" "N6"

# print out the experimental factors
abr1$fact %>% 
 head()
#>   injorder                              pathcdf filecdf name.org remark name
#> 1        1 C:/Xcalibur/ANDI-LTQ/050509-Abr1/cdf  01.cdf     12_2     ok 12_2
#> 2        2 C:/Xcalibur/ANDI-LTQ/050509-Abr1/cdf  02.cdf     13_3     ok 13_4
#> 3        3 C:/Xcalibur/ANDI-LTQ/050509-Abr1/cdf  03.cdf     15_4     ok 15_5
#> 4        4 C:/Xcalibur/ANDI-LTQ/050509-Abr1/cdf  04.cdf     12_1     ok 12_2
#> 5        5 C:/Xcalibur/ANDI-LTQ/050509-Abr1/cdf  05.cdf     12_2     ok 12_2
#> 6        6 C:/Xcalibur/ANDI-LTQ/050509-Abr1/cdf  06.cdf     11_1     ok 11_2
#>   rep day class
#> 1   2   2     2
#> 2   3   3     3
#> 3   5   4     4
#> 4   2   1     1
#> 5   2   2     2
#> 6   1   1     1

# check out the repartition of class
table(abr1$fact$class)
#> 
#>  1  2  3  4  5  6 
#> 20 20 20 20 20 20 
```
