#' Draw a curve of a function
#'
#' @description
#' Draw a line corresponding to a function expression.
#' This implements [ggplot2::geom_path()] given a tibble of range [from, to, n].
#' @param expr same argument as [curve()]. The name of a function, or a call or an expression written as a function of x which will evaluate to an object of the same length as x.
#' @param from the lower bound of the x-axis
#' @param to the upper bound of the x-axis
#' @param n the number of x values to be evaluated
#' @param xname character; argument of the function in expr, the name of the x axis
#' @param xlab label of the x-axis
#' @param ylab label of the y-axis
#' @param args list of the additional argument of the function
#' @param ... Additional arguments in drawing function expr
#' @examples
#' gg_curve(sqrt(1 + x), from = 1, to = 10)
#' @export
gg_curve <- function(expr, from = NULL, to = NULL, n = 101,
                     xname = "x", xlab = xname, ylab = NULL,
                     args = list(), ...) {
  sexpr <- substitute(expr)
  draw <- tibble(x = seq(from = from, to = to, length.out = n))
  if (is.name(sexpr)) {
    draw <-
      draw %>%
      mutate(y = expr(x, ...))
  } else {
    args[[xname]] <- draw$x
    draw <-
      draw %>%
      mutate(y = eval(sexpr, envir = args, enclos = parent.frame()))
  }
  if ( is.null(ylab) ) ylab <- sexpr
  draw %>%
    ggplot(aes(x = x)) +
    geom_path(aes(y = y)) +
    labs(
      x = xlab,
      y = ylab
    )
}

