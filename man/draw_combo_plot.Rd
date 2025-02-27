% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DrawingFunctions.R
\name{draw_combo_plot}
\alias{draw_combo_plot}
\title{Make combo plot for statistics plots}
\usage{
draw_combo_plot(
  stat_df,
  xc = "Feature",
  yc = "Intensity",
  comp = list(c(1, 2)),
  Xlab = xc,
  Ylab = yc,
  stats = "wilcox.test",
  fc = xc,
  Ylim = NULL,
  title = "",
  nf = 1
)
}
\arguments{
\item{stat_df}{a dataframe with column names c(xc, yc)}

\item{xc}{a string denoting column name for grouping}

\item{yc}{a string denoting column name for numeric data to be plotted}

\item{comp}{a list of vectors denoting pair-wise comparisons to be performed
between groups}

\item{Xlab}{a string for x-axis label}

\item{Ylab}{a string for y-axis label}

\item{stats}{the name of pair-wise statistical tests, like t.test or
wilcox.test}

\item{fc}{a string denoting column name for sub-grouping based on an
additional factor}

\item{Ylim}{a numeric vector of two elements, defining custom limits of y-axis}

\item{title}{a string for plot title}

\item{nf}{a integer normalizing factor for correct count of observations when
the data table has two factors, such as those produced by pivot_longer,
equals to the number of factors}
}
\value{
a ggplot object
}
\description{
Place violin plot, boxplot without outliers, mean+se barplot and
quantile plot on the same page
}
\examples{

stat_df <- data.frame(
    Feature = rep(c("A", "B"), c(200, 300)),
    Intensity = c(rnorm(200, 2, 5), rnorm(300, 3, 5)),
    Height = c(rnorm(200, 5, 5), rnorm(300, 1, 5))
)
stat_df_long <- tidyr::pivot_longer(stat_df,
    cols = c(Intensity, Height),
    names_to = "type", values_to = "value"
)

print(draw_combo_plot(stat_df_long,
    xc = "Feature", yc = "value", fc = "type",
    Ylab = "value", comp = list(c(1, 2), c(3, 4), c(1, 3), c(2, 4)), nf = 2
))

}
\author{
Shuye Pu
}
