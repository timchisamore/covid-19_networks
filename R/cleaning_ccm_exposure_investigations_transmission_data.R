#' Cleaning CCM exposure investigations - transmission data
#'
#' This function takes the raw CCM exposure investigations - transmission data
#' and cleans the field names and coverts date objects to lubridate date
#' objects.
#'
#' @param raw_ccm_exposure_investigations_transmission_data A tbl_df of raw CCM
#' exposure investigations - transmission data.
#'
#' @return A tbl_df of clean CCM exposure investigations - transmission data.
#' @export
#'
#' @examples
#' `cleaning_ccm_exposure_investigations_transmission_data(raw_ccm_exposure_investigations_transmission_data)`
cleaning_ccm_exposure_investigations_transmission_data <- function(raw_ccm_exposure_investigations_transmission_data) {
  raw_ccm_exposure_investigations_transmission_data %>%
    janitor::clean_names() %>%
    rename(!!!getting_ccm_exposure_investigations_field_names()) %>%
    mutate(
      across(.cols = contains("date"), .fns = str_remove_all, pattern = "[\\.,]"),
      across(.cols = contains("date"), .fns = lubridate::parse_date_time, orders = c("%Y-%m-%d %I:%M %p", "%Y-%m-%d")),
      across(.cols = contains("date"), .fns = lubridate::as_date),
      exposure_role = fct_explicit_na(exposure_role, na_level = "Missing")
    )
}
