#' Convert to HTML document with dreal template
#' 
#' @param ... parameters of \code{\link[rmarkdown]{html_document}}
#' @param offline Logical. TRUE if no access to internet
#' @importFrom rmarkdown includes
#' @inheritParams rmarkdown::html_document
#' 
#' @export
html_document <- function(..., includes = NULL, css = NULL, offline = FALSE) {
  
  # get the locations of resource files located within the package
  css <- c(css, 
           system.file("css/uikit_Lato_Roboto.css", package = "drealdown"),
           system.file("css/drealdown_Lato_Roboto.css", package = "drealdown"),
           list.files(system.file("fonts/dreal", package = "drealdown"),
                      recursive = TRUE, pattern = ".css", full.names = TRUE),
           list.files(system.file("fonts/line-awesome", package = "drealdown"),
                      recursive = TRUE, pattern = ".min.css", full.names = TRUE)
           )
  
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
#' @inheritParams html_document
#' 
#' @export
html_document2 <- function(..., offline = FALSE) {
  
  # call the base html_document function
  bookdown::html_document2(
    base_format = function(...) drealdown::html_document(offline = offline, ...),
    ...
  )
}

#' Convert to an HTML vignette with dreal template
#' 
#' @param ... parameters of \code{\link[rmarkdown]{html_vignette}}
#' @inheritParams html_document
#' 
#' @export
html_vignette <- function(..., css = NULL, offline = FALSE) {
  
  # get the locations of resource files located within the package
  css <- c(css,
           system.file("css/uikit_Lato_Roboto.css", package = "drealdown"),
           system.file("css/drealdown_Lato_Roboto.css", package = "drealdown"))
  
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

#' The GitBook output format with dreal template
#' 
#' @param ... parameters of \code{\link[bookdown]{gitbook}}
#' @param offline Set to TRUE to create a bookdown without internet connection
#' @inheritParams html_document
#' @inheritParams bookdown::gitbook
#' 
#' @export
gitbook <- function(..., css = NULL, lib_dir = "libs", offline = FALSE) {
  
  # get the locations of resource files located within the package
  css <- normalizePath(c(
    css,
    system.file("css/uikit_Lato_Roboto.css", package = "drealdown"),
    system.file("css/gitbook.css", package = "drealdown")))
  css_names <- file.path(lib_dir, basename(css))
  if (!dir.exists(lib_dir)) {dir.create(lib_dir)}
  for (i in seq_along(css)) {
    file.copy(css[i], css_names[i], overwrite = TRUE)
  }
  
  if (isTRUE(offline)) {
    # call the base html_document function
    bookdown::gitbook(
      css = css_names,
      lib_dir = lib_dir,
      ...
    )
  } else {
    # header <- normalizePath(system.file("templates/rmarkdown.html", package = "drealdown"))
    # call the base html_document function
    bookdown::gitbook(
      lib_dir = lib_dir,
      css = css_names,
      # includes = includes(before_body = header), 
      template = system.file("templates/gitbook.html", package = "drealdown"),
      ...
    )
  }
}

#' Build book chapters into separate HTML files with dreal template
#' 
#' @param ... parameters of \code{\link[bookdown]{html_chapters}}
#' @param offline Set to TRUE to create a bookdown without internet connection
#' @inheritParams html_document
#' @inheritParams bookdown::gitbook
#' 
#' @export
html_chapters <- function(..., css = NULL, lib_dir = "libs", offline = FALSE) {
  
  # get the locations of resource files located within the package
  css <- normalizePath(c(
    css,
    # system.file("resources/gitbook/css/style.css", package = "bookdown"),
    system.file("css/uikit_Lato_Roboto.css", package = "drealdown"),
    system.file("css/gitbook.css", package = "drealdown")))
  css_names <- file.path(lib_dir, basename(css))
  if (!dir.exists(lib_dir)) {dir.create(lib_dir)}
  for (i in seq_along(css)) {
    file.copy(css[i], css_names[i], overwrite = TRUE)
  }
  
  if (isTRUE(offline)) {
    # call the base html_document function
    bookdown::html_chapters(
      css = css_names,
      lib_dir = lib_dir,
      ...
    )
  } else {
    # header <- system.file("templates/rmarkdown.html", package = "drealdown")
    # call the base html_document function
    bookdown::html_chapters(
      css = css_names,
      lib_dir = lib_dir,
      # includes = includes(before_body = header),
      template = system.file("templates/gitbook.html", package = "drealdown"),
      ...
    )
  }
}