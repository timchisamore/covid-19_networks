#' Creating common acquisition exposures data
#'
#' This function takes the clean CCM exposure investigation - acquisition,
#' exposures, and investigations data and returns the exposures and locations
#' with more than one case attached in the past 14 days.
#'
#' @param clean_ccm_exposure_investigations_acquisition_data A tbl_df of clean
#' CCM exposure investigations - acquisition data.
#' @param clean_ccm_exposures_data A tbl_df of clean CCM exposures data.
#' @param clean_ccm_investigations_data A tbl_df of clean CCM investigations
#' data.
#'
#' @return A tbl_df of common acquisition exposures data.
#' @export
#'
#' @examples
#' `creating_common_acquisiton_exposures_data(clean_ccm_exposure_investigations_acquisition_data, clean_ccm_exposures_data, clean_ccm_investigations_data)`
creating_common_acquisition_exposures_data <- function(clean_ccm_exposure_investigations_acquisition_data, clean_ccm_exposures_data, clean_ccm_investigations_data) {
  joining_ccm_exposure_investigations_acquisition_and_investigations_data(
    clean_ccm_exposure_investigations_acquisition_data,
    clean_ccm_investigations_data
  ) %>%
    left_join(clean_ccm_exposures_data,
      by = "exposure"
    ) %>%
    # including anything within an incubation period
    filter(
      investigation_record_type == "Case Investigation",
      episode_date >= (lubridate::today() + lubridate::days(-14))
    ) %>%
    count(exposure,
      location,
      sort = TRUE
    )
}
