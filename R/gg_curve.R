#' Draw a curve of a function
#'
#' @description
#' Draw a line corresponding to a function expression.
#' This implements [ggplot2::stat_function()] given a tibble of range [from, to].
#' @param expr same argument as [curve()]. The name of a function, or a call or an expression written as a function of x which will evaluate to an object of the same length as x.
#' @param from the lower bound of the x-axis
#' @param to the upper bound of the x-axis
#' @param n the number of x values to be evaluated
#' @param xname character; argument of the function in expr, the name of the x axis
#' @param xlab label of the x-axis
#' @param ylab label of the y-axis
#' @param xlim Optionally, restrict the range of the function
#' @param args list of the additional argument of the function
#' @param ... Additional arguments in stat_function()
#' @examples
#' gg_curve(sqrt(1 + x), from = 1, to = 10)
#' @export
gg_curve <- function(expr, from = NULL, to = NULL, n = 101,
                     xname = "x", xlab = xname, ylab = NULL,
                     xlim = NULL, args = list(), ...) {
  sexpr <- substitute(expr)
  Myfunction <- function(x) {
    env <- list(x = x)
    names(env) <- xname
    eval(sexpr, envir = env)
  }
  if ( is.null(ylab) ) ylab <- sexpr
  tibble(x = c(from, to)) %>%
    ggplot(aes(x = x)) +
    stat_function(
      fun = Myfunction,
      n = n,
      xlim = xlim,
      args = args,
      ...
    ) +
    labs(
      x = xlab,
      y = ylab
    )
}

