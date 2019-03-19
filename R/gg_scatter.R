#' Scatter plot with color directed by PCA
#'
#' @description
#' Draw a scatter plot and color the points along the principal components.
#' Color direction becomes the data spread the most.
#' @param data data frame to be plotted
#' @param mapping same as ggplot
#' @param col_low low value of gradient
#' @param col_high high value of gradient
#' @import ggplot2 dplyr stringr rlang
#' @importFrom stats prcomp
#' @examples
#' gg_scatter(mpg, mapping = aes(x = displ, y = hwy))
#' @export
gg_scatter <- function(data, mapping, col_low = "#ff4b1f", col_high = "#1fddff") {
  var_name <-
    mapping %>%
    as.character() %>%
    str_remove_all(pattern = "\\~")
  x <- sym(var_name[1])
  y <- sym(var_name[2])
  data %>%
    select(!!x, !!y) %>%
    mutate(PC = prcomp(~ ., data = .)$x[,1]) %>%
    ggplot(mapping = aes(x = !!x, y = !!y)) +
    geom_point(mapping = aes(colour = PC), show.legend = FALSE) +
    scale_colour_gradient(low = col_low, high = col_high)
}
