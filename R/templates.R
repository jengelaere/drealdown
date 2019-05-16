#' Convert to HTML document with dreal template
#' 
#' @param ... parameters of \code{\link[rmarkdown]{html_document}}
#' @param offline Logical. TRUE if no access to internet
#' @importFrom rmarkdown includes
#' 
#' @export
html_mark <- function(..., offline = FALSE) {
  
  # get the locations of resource files located within the package
  css <- c(system.file("css/uikit.css", package = "drealdown"),
           system.file("css/drealdown.css", package = "drealdown"))
  
  if (isTRUE(offline)) {
    # call the base html_document function
    rmarkdown::html_document(
      css = css,
      ...
    )
  } else {
    header <- system.file("templates/rmarkdown.html", package = "drealdown")
    # call the base html_document function
    rmarkdown::html_document(
      css = css,
      includes = includes(before_body = header), 
      ...
    )
  }
}

#' Output formats that allow numbering and cross-referencing figures/tables/equations with dreal template
#' 
#' @param ... parameters of \code{\link[bookdown]{html_document2}}
#' @inheritParams html_mark
#' 
#' @export
html_book2 <- function(..., offline = FALSE) {
  
  # call the base html_document function
  bookdown::html_document2(
    base_format = function(...) html_mark(offline = offline, ...),
    ...
  )
}

#' Convert to an HTML vignette with dreal template
#' 
#' @param ... parameters of \code{\link[rmarkdown]{html_vignette}}
#' @inheritParams html_mark
#' 
#' @export
html_vignette <- function(..., offline = FALSE) {
  
  # get the locations of resource files located within the package
  css <- c(system.file("css/uikit.css", package = "drealdown"),
           system.file("css/drealdown.css", package = "drealdown"))
  
  if (isTRUE(offline)) {
    # call the base html_document function
    rmarkdown::html_vignette(
      css = css,
      ...
    )
  } else {
    header <- system.file("templates/rmarkdown.html", package = "drealdown")
    # call the base html_document function
    rmarkdown::html_vignette(
      css = css,
      includes = includes(before_body = header), 
      ...
    )
  }
}