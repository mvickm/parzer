assert <- function(x, y) {
  if (!is.null(x)) {
    if (!inherits(x, y)) {
      stop(deparse(substitute(x)), " must be of class ",
           paste0(y, collapse = ", "), call. = FALSE)
    }
  }
}

lint_inputs <- function(lat = NULL, lon = NULL, format) {
  assert(lat, c("character", "numeric", "integer"))
  assert(lon, c("character", "numeric", "integer"))
  assert(format, "character")
}

# FIXME: stopgap for now until figure out how to replace these on on src side
# -> smart quote and degree symbol
scrub <- function(x) gsub("\u2019|\u00b0", "'", x)

stop_form <- function() stop("format handling not ready yet")
