#' Scatter plot with color directed by PCA
#'
#' @description
#' Draw a scatter plot and color the points along the principal components.
#' Color direction becomes the data spread the most.
#' @param data data frame to be plotted.
#' @param mapping aesthetic mapping. Since this function automatically colors the points, just specify only x and y.
#' @param col_low low end of the gradient.
#' @param col_high high end of the gradient.
#' @param alpha_focus If TRUE; transparency let dense points visible
#' @param alpha_range range argument of [scale_alpha]
#' @param alpha Set alpha parameter at one value
#' @param global give aes mapping in the global ggplot environment.
#' @param ... Additional parameters for geom_point()
#' @importFrom fields interp.surface
#' @importFrom stats prcomp
#' @examples
#' gg_scatter(mpg, mapping = aes(x = displ, y = hwy), global = TRUE)
#' @export
gg_scatter <- function(data, mapping = aes(), col_low = "#0091ff", col_high = "#f0650e", alpha_focus = FALSE, alpha_range = c(.05, .25), alpha = 1, global = TRUE, ...) {
  data <-
    data %>%
    gg_aes(mapping = mapping) %>%
    mutate(
      PC = prcomp(~ ., data = .)$x[,1],
      trans = 1
    )
  if (alpha_focus) {
    bins <- ash::bin2(data %>% select(1:2) %>% as.matrix())
    kern <- ash::ash2(bins)
    dens <- fields::interp.surface(kern, data %>% select(1:2) %>% as.matrix())
    data <-
      data %>%
      mutate(trans = 1 / dens)
  } else {
    alpha_range <- c(.1, 1)
  }
  if (global) {
    gg_plot <-
      ggplot(data = data, mapping = mapping) +
      geom_point(mapping = aes(colour = PC, alpha = trans), show.legend = FALSE, ...) +
      scale_alpha(range = alpha_range)
  } else {
    var_name <- names(data)
    x <- sym(var_name[1])
    y <- sym(var_name[2])
    gg_plot <-
      ggplot(data = data) +
      geom_point(mapping = aes(x = !!x, y = !!y, colour = PC), show.legend = FALSE, ...) +
      scale_alpha(range = alpha_range)
  }
  gg_plot +
    scale_colour_gradient(low = col_low, high = col_high)
}
