#' Reading CCM exposure investigations - acquisition data
#'
#' This function reads the Case and Contact Management (CCM) COVID-19 Exposure
#' Investigations - Acquisition data into our R project from a local folder.
#' Note that the returned object will be a tbl_df.
#'
#' @param ccm_exposure_investigations_acquisition_path A character representing
#' the pathway to the CCM Exposure Investigations - Acquisition data.
#'
#' @return A tbl_df of raw CCM Exposure Investigations - Acquisition data.
#' @export
#'
#' @examples
#' `reading_ccm_exposure_investigations_acquisition_data(here::here("data", "raw", "ccm_exposure_investigations_acquisition_data.csv"))`
reading_ccm_exposure_investigations_acquisition_data <-
  function(ccm_exposure_investigations_acquisition_path) {
    read_csv(
      file = ccm_exposure_investigations_acquisition_path,
      col_names = TRUE,
      col_types = cols(
        `Investigation: Investigation Number` = col_character(),
        `Exposure` = col_character(),
        `Exposure Mode` = col_factor(),
        `Exposure Role` = col_factor(),
        `Beginning Date of Exposure Contact` = col_date(format = "%Y-%m-%d"),
        `End Date of Exposure Contact` = col_date(format = "%Y-%m-%d")
      )
    )
  }
