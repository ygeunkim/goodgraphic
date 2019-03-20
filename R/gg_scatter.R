#' Scatter plot with color directed by PCA
#'
#' @description
#' Draw a scatter plot and color the points along the principal components.
#' Color direction becomes the data spread the most.
#' @param data data frame to be plotted.
#' @param mapping aesthetic mapping. Since this function automatically colors the points, just specify only x and y.
#' @param col_low low end of the gradient.
#' @param col_high high end of the gradient.
#' @param global give aes mapping in the global ggplot environment.
#' @param ... Additional parameters for geom_point()
#' @importFrom stats prcomp
#' @examples
#' gg_scatter(mpg, mapping = aes(x = displ, y = hwy), global = TRUE)
#' @export
gg_scatter <- function(data, mapping = aes(), col_low = "#ff4b1f", col_high = "#1fddff", global = TRUE, ...) {
  data <-
    data %>%
    gg_aes(mapping = mapping) %>%
    mutate(PC = prcomp(~ ., data = .)$x[,1])
  if (global) {
    gg_plot <-
      ggplot(data = data, mapping = mapping) +
      geom_point(mapping = aes(colour = PC), show.legend = FALSE, ...)
  } else {
    var_name <- names(data)
    x <- sym(var_name[1])
    y <- sym(var_name[2])
    gg_plot <-
      ggplot(data = data) +
      geom_point(mapping = aes(x = !!x, y = !!y, colour = PC), show.legend = FALSE, ...)
  }
  gg_plot +
    scale_colour_gradient(low = col_low, high = col_high)
}
