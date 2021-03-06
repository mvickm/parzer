% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/parse_lat_lon.R
\name{parse_lat_lon}
\alias{parse_lat_lon}
\title{parse latitude and longitude}
\usage{
parse_lat_lon(lat, lon)
}
\arguments{
\item{lat}{(character/numeric/integer) one or more latitude values}

\item{lon}{(character/numeric/integer) one or more longitude values}
}
\value{
data.frame, with columns lat, lon
}
\description{
parse latitude and longitude
}
\details{
length(lat) == length(lon)
}
\examples{
parse_lat_lon(49.12, -120.43)
parse_lat_lon(93, -120.43)
parse_lat_lon(49.12, -190)
parse_lat_lon(49.12, 240)
parse_lat_lon(92, -190)
# many
lats <- c("40.123°", "40.123N74.123W", "191.89", 12, "N45 04.25764")
lons <- c("45W54.2356", "181", 45, 45.234234, "-45.98739874")
parse_lat_lon(lats, lons)
}
