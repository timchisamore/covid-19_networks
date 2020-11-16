#' Cleaning CCM Exposure Investigations - Cases Data
#'
#' This function takes the raw CCM exposure investigations - cases data and cleans the
#' field names, removes empty fields, and coverts date objects to lubridate date objects.
#' Note, we had to manually trim the time out of the field reported_date
#'
#' @param raw_ccm_exposure_investigations_cases_data A tbl_df of our raw CCM exposure investigations - cases data
#'
#' @return A tbl_df of our cleaned CCM exposure invesetigations - cases data
#' @export
#'
#' @examples
#' cleaning_ccm_exposure_investigations_cases_data(raw_ccm_exposure_investigations_cases_data)
cleaning_ccm_exposure_investigations_cases_data <- function(raw_ccm_exposure_investigations_cases_data) {
  clean_ccm_exposure_investigations_cases_data <- raw_ccm_exposure_investigations_cases_data %>%
    janitor::remove_empty(which = "cols") %>%
    janitor::clean_names() %>%
    mutate(
      across(.cols = contains("date"), .fns = as.Date),
      across(.cols = contains("date"), .fns = lubridate::ymd)
    )

  return(clean_ccm_exposure_investigations_cases_data)
}
