#' Cleaning CCM exposure investigations - acquisition data
#'
#' This function takes the raw CCM exposure investigations - acquisition data
#' and cleans the field names and coverts date objects to lubridate date
#' objects.
#'
#' @param raw_ccm_exposure_investigations_acquisition_data A `tbl_df` of our raw
#' CCM exposure investigations - acquisition data.
#'
#' @return A `tbl_df` of our cleaned CCM exposure invesetigations - acquisition
#' data.
#' @export
#'
#' @examples
#' `cleaning_ccm_exposure_investigations_acquisition_data(raw_ccm_exposure_investigations_acquisition_data)`
cleaning_ccm_exposure_investigations_acquisition_data <- function(raw_ccm_exposure_investigations_acquisition_data) {
  clean_ccm_exposure_investigations_acquisition_data <- raw_ccm_exposure_investigations_acquisition_data %>%
    janitor::clean_names() %>%
    mutate(
      across(.cols = contains("date"), .fns = str_remove_all, pattern = "[\\.,]"),
      across(.cols = contains("date"), .fns = lubridate::parse_date_time, orders = c("%Y-%m-%d %I:%M %p", "%Y-%m-%d")),
    )

  return(clean_ccm_exposure_investigations_acquisition_data)
}
