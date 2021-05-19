#' Creating interval length
#'
#' This function takes a start date and an end date and creates the interval
#' length between them in days.
#'
#' @param start_date A date representing the start of the interval.
#' @param end_date A date representing the end of the interval.
#'
#' @return A double representing the interval length in days.
#' @export
#'
#' @examples
#' `creating_interval_length(lubridate::ymd("2020-01-01"), lubridate::ymd("2021-01-01"))`
creating_interval_length <- function(start_date, end_date) {
  lubridate::time_length(
    x = lubridate::interval(start = start_date, end = end_date),
    unit = "days"
  )
}
