#' Cleaning CCM Exposure Investigations with Exposures Data
#'
#' This function takes the raw CCM exposure investigations with exposures data and cleans the
#' field names, removes empty fields, and coverts date objects to lubridate date objects.
#' Note, we had to manually trim the time out of the field reported_date
#'
#' @param raw_ccm_exposure_investigations_with_exposures_data A tbl_df of our CCM exposure
#' investigations with exposures data
#'
#' @return A tbl_df of our cleaned CCM exposure investigations with exposure data
#' @export
#'
#' @examples
#' cleaning_ccm_exposure_investigations_with_exposures_data(raw_ccm_exposure_investigations_with_exposures_data)
cleaning_ccm_exposure_investigations_with_exposures_data <- function(raw_ccm_exposure_investigations_with_exposures_data) {
  clean_ccm_exposure_investigations_with_exposures_data <- raw_ccm_exposure_investigations_with_exposures_data %>%
    janitor::remove_empty(which = "cols") %>%
    janitor::clean_names() %>%
    mutate(
      across(.cols = contains("date"), .fns = lubridate::ymd)
    ) %>%
    distinct()

  return(clean_ccm_exposure_investigations_with_exposures_data)
}
