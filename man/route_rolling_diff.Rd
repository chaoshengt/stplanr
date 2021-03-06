% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/route_funs.R
\name{route_rolling_diff}
\alias{route_rolling_diff}
\title{Return smoothed differences between vector values}
\usage{
route_rolling_diff(x, lag = 1, abs = TRUE)
}
\arguments{
\item{x}{Numeric vector to smooth}

\item{lag}{The window size of the smoothing function. The default, 3, will take
the mean of values before, after and including each value.}

\item{abs}{Should the absolute (always positive) change be returned? True by default}
}
\description{
This function calculates a simple rolling mean in base R. It is useful for
calculating route characteristics such as mean distances of segments and
changes in gradient.
}
\examples{
r1 <- od_data_routes[od_data_routes$route_number == 2, ]
y <- r1$elevations
route_rolling_diff(y, lag = 1)
route_rolling_diff(y, lag = 2)
r1$elevations_diff_1 <- route_rolling_diff(y, lag = 1)
r1$elevations_diff_n <- route_rolling_diff(y, lag = 1, abs = FALSE)
d <- cumsum(r1$distances) - r1$distances / 2
diff_above_mean <- r1$elevations_diff_1 + mean(y)
diff_above_mean_n <- r1$elevations_diff_n + mean(y)
plot(c(0, cumsum(r1$distances)), c(y, y[length(y)]), ylim = c(80, 130))
lines(c(0, cumsum(r1$distances)), c(y, y[length(y)]))
points(d, diff_above_mean)
points(d, diff_above_mean_n, col = "blue")
abline(h = mean(y))
}
\seealso{
Other route_funs: 
\code{\link{route_average_gradient}()},
\code{\link{route_rolling_average}()},
\code{\link{route_rolling_gradient}()},
\code{\link{route_sequential_dist}()},
\code{\link{route_slope_matrix}()},
\code{\link{route_slope_vector}()}
}
\concept{route_funs}
