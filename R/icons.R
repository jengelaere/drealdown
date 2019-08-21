#' Add Icon in the text
#'
#' @param name icon name
#' @param size icon size
#' @param color icon color
#'
#' @return HTML object with an icon
#' @importFrom htmltools tags
#' @export
#'
#' @examples
#' my_icon("la-jsfiddle")
#' my_icon("drl-explosion", size = 2)
#' my_icon("drl-cadastre", size = 7, color = 'red')
my_icon <- function(
  name = drealdown::my_icon_list, 
  size = 1, 
  color = "#5a1e82"
){
  name <- match.arg(name)
  if (grepl("drl-", name)){
    tags$span(
      class = sprintf("icon %s", name), 
      style = sprintf("font-size:%srem;color:%s;", size, color)
    )
  } else {
    tags$span(
      tags$i(
        class = sprintf("la %s", name), 
        style = sprintf("font-size:%srem;color:%s;", size, color)
      )
    )
  }
}
