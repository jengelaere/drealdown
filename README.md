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
remotes::install_gitlab(repo = "dreal-datalab/drealdown")
```

## Templates

### Voir tous les exemples inclus

``` r
examples <- system.file("examples", package = "drealdown")
browseURL(examples)
```

### Fonctions incluses

  - Markdown classique de type `rmarkown::html_document()` :
    `drealdown::html_document()`
  - Markdown avancé avec bookdown de type `bookdown::html_document2()` :
    `drealdown::html_document2()`
  - Markdown pour vignette de type `rmarkdown::html_vignette()` :
    `drealdown::html_vignette()`
  - Bookdown de type `bookdown::gitbook` : `drealdown::gitbook()`

*Pour toutes ces fonctions, il est possible de choisir le mode `offline
= TRUE` pour ne pas aller chercher les polices google si vous n’avez pas
accès à Internet*

### Exemples inclus

Vous pouvez éxécuter les fichiers d’exemples inclus dans le package

``` r
examples <- system.file("examples", package = "drealdown")
browseURL(examples)
```
