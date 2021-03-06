% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/deprecated.R
\name{gclip}
\alias{gclip}
\title{Crops spatial object x to the bounding box of spatial object (or matrix) b}
\usage{
gclip(shp, bb)
}
\arguments{
\item{shp}{The spatial object a to be cropped}

\item{bb}{the bounding box or spatial object that will be used to crop \code{shp}}
}
\description{
This function is a cross between the spatial subsetting funtions such as
sp::over(), rgeos::gIntersects() etc, and the cropping functions of
raster::crop() and rgeos::gIntersection(). The output is the subset of
spatial object a with an outline described by a square bounding box.
The utility of such a function is illustrated in the following question:
\url{https://gis.stackexchange.com/questions/46954/clip-spatial-object-to-bounding-box-in-r/}.
}
\examples{
\dontrun{
cb <- sf::st_buffer(cents_sf[8, ], dist = 0.012)
plot(cents_sf$geometry)
plot(cb, add = TRUE)
clipped <- gclip(cents_sf, cb)
plot(clipped, add = TRUE)
clipped$avslope # gclip also returns the data attribute
points(clipped)
points(cents[cb, ], col = "red") # note difference
gclip(cents_sf, cb)
}
}
\seealso{
Other geo: 
\code{\link{bbox_scale}()},
\code{\link{geo_bb_matrix}()},
\code{\link{geo_bb}()},
\code{\link{mapshape_available}()},
\code{\link{mapshape}()},
\code{\link{quadrant}()},
\code{\link{reproject}()}
}
\concept{geo}
