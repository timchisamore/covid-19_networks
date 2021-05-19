#' Reading CCM exposure investigations - transmission data
#'
#' This function reads the Case and Contact Management (CCM) COVID-19 Exposure
#' Investigations - Transmission data into our R project from a local folder.
#' Note that the returned object will be a tbl_df.
#'
#' @param ccm_exposure_investigations_transmission_path A character representing
#' the pathway to the CCM Exposure Investigations - Transmission data.
#'
#' @return A tbl_df of raw CCM Exposure Investigations - Transmission data.
#' @export
#'
#' @examples
#' `reading_ccm_exposure_investigations_transmission_data(here::here("data", "raw", "ccm_exposure_investigations_transmission_data.csv"))`
reading_ccm_exposure_investigations_transmission_data <- function(ccm_exposure_investigations_transmission_path) {
  read_csv(
    file = ccm_exposure_investigations_transmission_path,
    col_names = TRUE,
    col_types = cols(
      `Exposure` = col_character(),
      `Exposure Investigation: Exposure Investigation Name` = col_character(),
      `Exposure Mode` = col_factor(levels = c("Acquisition", "Transmission")),
      `Exposure Role` = col_factor(levels = c("Attendee", "Patient", "Patron/Customer", "Resident", "Residency", "Staff", "Student", "Visit", "Visitor", "Volunteer", "Work", "Other")),
      `Beginning Date of Exposure Contact` = col_date(format = "%Y-%m-%d"),
      `End Date of Exposure Contact` = col_date(format = "%Y-%m-%d"),
      `Investigation: Investigation Number` = col_character()
    )
  )
}
