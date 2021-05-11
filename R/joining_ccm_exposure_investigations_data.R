#' Joining CCM exposure investigations data
#'
#' This function joins the clean CCM exposure investigations - transmission data
#' and clean CCM exposure investigations - acquisition data by exposure name. An
#' inner join is used as we do not want any null values as we are mapping
#' transmission epxosure investigations (cases) to acquisiton exposure
#' investigations (cases or contacts). We also relocate the exposure column
#' to be the first column in the tbl_df.
#'
#' @param clean_ccm_exposure_investigations_transmission_data A tbl_df of clean
#' CCM exposure investigations - transmission data.
#' @param clean_ccm_exposure_investigations_acquisition_data A tbl_df of clean
#' CCM exposure investigations - acquisition data.
#'
#' @return A tbl_df of joined CCM exposure investigations data.
#' @export
#'
#' @examples
#' `joining_ccm_exposure_investigations_data(clean_ccm_exposure_investigations_transmission_data, clean_ccm_exposure_investigations_acquisition_data)`
joining_ccm_exposure_investigations_data <-
  function(clean_ccm_exposure_investigations_transmission_data,
           clean_ccm_exposure_investigations_acquisition_data) {
    inner_join(
      x = clean_ccm_exposure_investigations_transmission_data,
      y = clean_ccm_exposure_investigations_acquisition_data,
      by = "exposure",
      suffix = c("_transmission", "_acquisition")
    ) %>%
      relocate(exposure)
  }
