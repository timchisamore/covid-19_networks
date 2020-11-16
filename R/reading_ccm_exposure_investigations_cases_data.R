#' Reading CCM Exposure Investigations - Cases Data
#'
#' This function reads the Case and Contact Management (CCM) COVID-19 Exposure Investigations
#' - Cases data into our R project from a local folder. Note that the returned object will be a
#' tbl_df.
#'
#' @param path a pathway to the CCM Exposure Investigations - Cases data .csv file
#'
#' @return A tbl_df of our CCM Exposure Investigations - Cases data
#' @export
#'
#' @examples
#' reading_ccm_exposure_investigations_cases_data(here::here("data", "raw", "ccm_exposure_investigations_cases_data.csv"))
reading_ccm_exposure_investigations_cases_data <- function(path) {
  raw_ccm_exposure_investigations_cases_data <-
    read_csv(file = path)

  return(raw_ccm_exposure_investigations_cases_data)
}
