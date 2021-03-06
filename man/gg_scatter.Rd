% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gg_scatter.R
\name{gg_scatter}
\alias{gg_scatter}
\title{Scatter plot with color directed by PCA}
\usage{
gg_scatter(data, mapping = aes(), col_low = "#0091ff",
  col_high = "#f0650e", alpha_focus = FALSE, alpha_range = c(0.05,
  0.25), alpha = 1, global = TRUE, ...)
}
\arguments{
\item{data}{data frame to be plotted.}

\item{mapping}{aesthetic mapping. Since this function automatically colors the points, just specify only x and y.}

\item{col_low}{low end of the gradient.}

\item{col_high}{high end of the gradient.}

\item{alpha_focus}{If TRUE; transparency let dense points visible}

\item{alpha_range}{range argument of [scale_alpha]}

\item{alpha}{Set alpha parameter at one value}

\item{global}{give aes mapping in the global ggplot environment.}

\item{...}{Additional parameters for geom_point()}
}
\description{
Draw a scatter plot and color the points along the principal components.
Color direction becomes the data spread the most.
}
\examples{
gg_scatter(ggplot2::mpg, mapping = ggplot2::aes(x = displ, y = hwy), global = TRUE)
}
