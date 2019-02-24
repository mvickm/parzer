parzer
======



[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)

`parzer` parses coordinates

basis of parzer ([src/CLongLatString.cpp](src/CLongLatString.cpp) and [src/llstr.h](src/llstr.h)) originally from: https://www.codeproject.com/Articles/15659/Longitude-Latitude-String-Parser-and-Formatter; retrieved from: https://github.com/batela/Gaypu-Src/tree/master/ll2utm

`parzer` API:

 - `extract_coords`
 - `parse_lat`
 - `parse_lat_lon`
 - `parse_lon`
 - `parse_parts`


## Installation


```r
devtools::install_github("ropenscilabs/parzer")
```


```r
library("parzer")
```

## parse

latitudes


```r
parse_lat("45N54.2356")
#> [1] 45.90393
parse_lat("-45.98739874")
#> [1] -45.9874
parse_lat("N455698735", "HDDMMmmmmm")
#> [1] 45.94979
parse_lat("40.123°")
#> [1] 40.123
parse_lat("40.123N74.123W")
#> [1] NaN
parse_lat("N45 04.25764")
#> [1] 45.07096
# bad values -> NaN
parse_lat("191.89")
#> [1] NaN
# many inputs
x <- c("40.123°", "40.123N74.123W", "191.89", 12, "N45 04.25764")
parse_lat(x)
#> [1] 40.12300      NaN      NaN 12.00000 45.07096
```

longitudes


```r
parse_lon("45W54.2356")
#> [1] -45.90393
parse_lon("-45.98739874")
#> [1] -45.9874
parse_lon("N455698735", "HDDMMmmmmm")
#> [1] 45.94979
parse_lon("40.123°")
#> [1] 40.123
parse_lon("40.123N74.123W")
#> [1] NaN
parse_lon("N45 04.25764")
#> [1] 45.07096
# bad values
parse_lon("181")
#> [1] NaN
# many inputs
x <- c("45W54.2356", "181", 45, 45.234234, "-45.98739874")
parse_lon(x)
#> [1] -45.90393       NaN  45.00000  45.23423 -45.98740
```

both lat and lon together


```r
lats <- c("40.123°", "40.123N74.123W", "191.89", 12, "N45 04.25764")
lons <- c("45W54.2356", "181", 45, 45.234234, "-45.98739874")
parse_lat_lon(lats, lons)
#>        lat       lon
#> 1 40.12300 -45.90393
#> 2      NaN       NaN
#> 3      NaN  45.00000
#> 4 12.00000  45.23423
#> 5 45.07096 -45.98740
```

parse into degree, min, sec parts


```r
parse_parts("45N54.2356")
#>   decimal_degree decimal_min decimal_sec
#> 1             45     54.2356      14.136
parse_parts("40.4183318")
#>   decimal_degree decimal_min decimal_sec
#> 1             40    25.09991    5.994481
parse_parts("-74.6411133")
#>   decimal_degree decimal_min decimal_sec
#> 1             74     38.4668    28.00788
# many inputs
x <- c("40.123°", "40.123N74.123W", "191.89", 12, "N45 04.25764")
parse_parts(x)
#>   decimal_degree decimal_min  decimal_sec
#> 1             40   7.3800006 2.280000e+01
#> 2             NA         NaN          NaN
#> 3             NA         NaN          NaN
#> 4             12   0.0000006 6.000005e-07
#> 5             45   4.2576404 1.545840e+01
```

