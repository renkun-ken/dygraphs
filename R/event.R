#' dygraph event line
#' 
#' Add a vertical event line to a dygraph
#' 
#' @param dygraph Dygraph to add event line to
#' @param date Date/time for the event (must be a \code{as.POSIXct} object or 
#'   another object convertible to \code{as.POSIXct}). convertable via 
#'   \code{as.POSIXct}).
#' @param label Label for event.
#' @param color Color of event line. This can be of the form "#AABBCC" or 
#'   "rgb(255,100,200)" or "yellow". Defaults to black.
#'   "dotdash") or a custom pattern array where the even index is a draw and odd
#'   is a space in pixels.
#'   
#' @return A dygraph with the specified event line.
#'   
#' @note See the \href{http://jjallaire.github.io/dygraphs/}{online 
#'   documentation} for additional details and examples.
#'   
#' @export
dyEvent <- function(dygraph, 
                    date, 
                    label, 
                    color = "black", 
                    strokePattern = "dashed") {
  
  # create event
  event <- list()
  event$date <- asISO8601Time(date)
  event$label <- label
  event$color <- color
  event$strokePattern <- resolveStrokePattern(strokePattern)
 
  # add it to list of events
  dygraph$x$events[[length(dygraph$x$events) + 1]] <- event
  
  # return modified dygraph
  dygraph
}
