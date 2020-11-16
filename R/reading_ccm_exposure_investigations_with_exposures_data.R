#' Reading CCM Exposure Investigations with Exposures Data
#'
#' This function reads the Case and Contact Management (CCM) COVID-19 Exposure
#' Investigations with Exposures data into our R project from a local folder.
#' Note that the returned object will be a tbl_df
#'
#' @param path a pathway to the CCM Exposure Investigations with Exposures
#' data .csv file
#'
#' @return A tbl_df of our CCM Exposure Investigations with Exposures data
#' @export
#'
#' @examples
#' reading_ccm_exposure_investigations_with_exposures_data(here::here("data", "raw", "ccm_exposure_investigations_with_exposures_data.csv"))
reading_ccm_exposure_investigations_with_exposures_data <- function(path) {
  raw_ccm_exposure_investigations_with_exposures_data <- read_csv(file = path)

  return(raw_ccm_exposure_investigations_with_exposures_data)
}
