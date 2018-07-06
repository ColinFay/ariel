
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

# ariel

The goal of ariel is to provide an easy access to the SIRENE API from R.

## Installation

``` r
remotes::install_github("ColinFay/ariel")
```

## Before using

You need to create an account on the INSEE website, and get an access
token. See
[here](https://api.insee.fr/catalogue/site/themes/wso2/subthemes/insee/pages/help.jag)
for more infos about how to do that.

## Example

Set your token

``` r
token <- "XXX"
```

### With SIRENE

``` r
get_with_siren(siren = "810064519",
                date = "2017-01-01",
                token = token)
```

### With SIRET

``` r
get_with_siret("81006451900020", 
               token = token)
```

## Misc

Please note that this project is released with a [Contributor Code of
Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree
to abide by its terms.
