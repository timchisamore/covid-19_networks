#' Joining CCM exposure investigations acquisition and investigations data
#'
#' This function joins the clean CCM exposure investigations acquisition and
#' clean CCM investigations data by investigation number.
#'
#' @param clean_ccm_exposure_investigations_acquisition_data A tbl_df of clean
#' CCM exposure investigations acqusition data.
#' @param clean_ccm_investigations_data A tbl_df of clean CCM investigations
#' data.
#'
#' @return A tbl_df of joined CCM exposure investigations acqusition and
#' investigations data.
#' @export
#'
#' @examples
#' `joining_ccm_exposure_investigations_acquisition_and_investigations_data(clean_ccm_exposure_investigations_acquisition_data, clean_ccm_investigations_data)`
joining_ccm_exposure_investigations_acquisition_and_investigations_data <- function(clean_ccm_exposure_investigations_acquisition_data, clean_ccm_investigations_data) {
  clean_ccm_exposure_investigations_acquisition_data %>%
    left_join(
      y = clean_ccm_investigations_data,
      by = "investigation_number"
    )
}
