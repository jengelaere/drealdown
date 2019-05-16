
<!-- README.md is generated from README.Rmd. Please edit that file -->

# drealdown

<!-- badges: start -->

<!-- badges: end -->

This is package {drealdown}: Templates for html outputs. You are using
version 0.0.0.9000.

## Installation

The list of dependencies required to install this package is:

    #> [1] "bookdown"  "rmarkdown"

To install the package, you can run the following script

``` r
# install.packages("remotes")
remotes::install_git(url = "https://git.thinkr.fr/ThinkR/Missions/drealdown")
```

## Templates

### Voir tous les exemples inclus

``` r
examples <- system.file("examples", package = "drealdown")
browseURL(examples)
```

### Fonctions incluses

  - Markdown classique de type `rmarkown::html_document()` :
    `drealdown::html_mark()`
  - Markdown avancé avec bookdown de type `bookdown::html_document2()` :
    `drealdown::html_book2()`
  - Markdown pour vignette de type `rmarkdown::html_vignette()` :
    `drealdown::html_vignette()`
