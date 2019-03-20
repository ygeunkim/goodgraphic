#' Interpret aesthetic mapping into data frame literature
#'
#' @description
#' This function subset the data specified in the mapping to use aes() in the custom function.
#' Denote that this is defined for the others.
#' @param data data object that can be used in the ggplot2 package
#' @param mapping argument
#' @examples
#' gg_aes(mpg, aes(x = displ, y = hwy, colour = fl, group = class))
#' @export
gg_aes <- function(data, mapping = aes()) {
  var_name <-
    mapping %>%
    as.character() %>%
    str_remove_all(pattern = "\\~")
  var_name <- var_name[!str_detect(var_name, pattern = "\\.")]
  var_list <- syms(var_name)
  data %>%
    select(!!!var_list)
}
