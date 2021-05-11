#' Cleaning CCM exposures data
#'
#' This function takes the raw CCM exposures data and cleans the field names and
#' coverts date objects to lubridate date objects.
#'
#' @param raw_ccm_exposures_data A tbl_df of raw CCM exposures data.
#'
#' @return A tbl_df of clean CCM Exposures data.
#' @export
#'
#' @examples
#' `cleaning_ccm_exposures_data(raw_ccm_exposures_data)`
cleaning_ccm_exposures_data <- function(raw_ccm_exposures_data) {
  raw_ccm_exposures_data %>%
    janitor::clean_names() %>%
    mutate(
      across(.cols = c(contains("date"), beginning_of_exposure, end_of_exposure), .fns = str_remove_all, pattern = "[\\.,]"),
      across(.cols = c(contains("date"), beginning_of_exposure, end_of_exposure), .fns = lubridate::parse_date_time, orders = c("%Y-%m-%d %I:%M %p", "%Y-%m-%d")),
    ) %>%
    rename(!!!getting_ccm_exposures_field_names())
}
