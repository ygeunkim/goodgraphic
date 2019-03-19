#' Default ggplot color
#'
#' @description ggplot default colors
#' @param n group numbers
#' @importFrom grDevices hcl
#' @examples
#' gg_hcl(3)
#' @return gives pallete values
#' @export
gg_hcl <- function(n) {
  hue <- seq(15, 375, length.out = n + 1)
  hcl_cols <- hcl(h = hue, c = 100, l = 65)[-(n + 1)]
  hcl_cols
}
