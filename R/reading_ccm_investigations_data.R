#' Reading CCM investigations data
#'
#' This function reads the Case and Contact Management (CCM) COVID-19
#' Investigations data into our R project from a local folder. Note that the
#' returned object will be a tbl_df.
#'
#' @param ccm_investigations_path A character representing the pathway to the
#' CCM Investigations data.
#'
#' @return A tbl_df of raw CCM Investigations data.
#' @export
#'
#' @examples
#' `reading_ccm_investigations_data(here::here("data", "raw", "ccm_investigations_data.csv"))`
reading_ccm_investigations_data <- function(ccm_investigations_path) {
  read_csv(
    file = ccm_investigations_path,
    col_names = TRUE,
    col_types = cols(
      `Client Name: Client ID` = col_character(),
      `Client Name: IPHIS Client ID` = col_character(),
      `Investigation Number` = col_character(),
      `IPHIS Case ID` = col_character(),
      `Investigation Outbreak: Outbreak Number` = col_character(),
      `Investigation Outbreak: Outbreak Name` = col_character(),
      `Investigation Outbreak: Outbreak Classification` = col_character(),
      `Outbreak Subtype` = col_character(),
      `Disease` = col_character(),
      `Investigation Subtype` = col_character(),
      `Client Name: Person Client: Gender` = col_factor(levels = c("Female", "Male", "Non-binary", "Prefer not to say", "Unknown", "Not listed, please specify", "Trans man", "Trans woman")),
      `Client Name: Person Client: Date of Birth` = col_date(format = "%Y-%m-%d"),
      `Permanent City at Illness` = col_character(),
      `Current City at Illness` = col_character(),
      `Investigation Record Type` = col_factor(levels = c("Case Investigation", "Contact Outreach", "AEFI Investigation")),
      `Classification` = col_factor(levels = c("Confirmed", "Probable", "Person Under Investigation", "Does Not Meet")),
      `Disposition` = col_factor(levels = c("Complete", "Duplicate", "Entered in error", "Exposure Ruled Out", "Lost To Followup", "Pending", "Referred External (IJN)", "Referred Federal Client", "Untraceable")),
      `Status` = col_factor(levels = c("Awaiting Follow-up", "Follow up Underway", "Monitoring and Support", "Closed")),
      `Epidemiologic link Status` = col_factor(levels = c("Yes", "No", "Missing Information")),
      `Epidemiologic linkage` = col_factor(levels = c("Close contact", "Household contact", "Outbreak related", "Travel")),
      `Remote Positive` = col_factor(levels = c("Yes", "No", "Unknown", "Not Reported")),
      `Re-Positive` = col_factor(levels = c("Yes", "No", "Unknown", "Not Reported")),
      `Episode Date Type` = col_factor(levels = c("Investigation Reported", "Lab Specimen Collection", "Symptom Onset")),
      `Episode Date` = col_character(),
      `Earliest Symptom OnsetDate` = col_character(),
      `Earliest Positive Lab Collection Date` = col_character(),
      `Reported Date` = col_character(),
      `Investigation Start Date` = col_date(format = "%Y-%m-%d"),
      `Investigation Health Unit (RHU): PHU Table Name` = col_character()
    )
  )
}
