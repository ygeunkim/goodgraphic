
gg_curve <- function(expr, from = NULL, to = NULL, n = 101,
                     xname = "x", xlab = xname, ylab = NULL,
                     xlim = NULL, ...) {
  sexpr <- substitute(expr)
  if ( is.name(sexpr) ) {
    expr <- call(as.character(sexpr), as.name("x"))
  } else {
    if( !(is.call(sexpr) || is.expression(sexpr)) ) {
      stop(gettextf("'expr' must be a function, or a call or an expression containing '%s'"), domain = NA)
    }
  }
  Myfunction <- function(x) {
    eval(expr, envir = list(x))
  }

}
