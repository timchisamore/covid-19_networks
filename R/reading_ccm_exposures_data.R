#' Reading CCM exposures data
#'
#' This function reads the Case and Contact Management (CCM) COVID-19 Exposures
#' data into our R project from a local folder. Note that the returned object
#' will be a tbl_df.
#'
#' @param ccm_exposures_path A character representing the pathway to the CCM
#' Exposures data.
#'
#' @return A tbl_df of raw CCM Exposures data.
#' @export
#'
#' @examples
#' `reading_ccm_exposures_data(here::here("data", "raw", "ccm_exposures_data.csv"))`
reading_ccm_exposures_data <- function(ccm_exposures_path) {
  read_csv(
    file = ccm_exposures_path,
    col_names = TRUE,
    col_types = cols(
      `Exposure: Exposure Name` = col_character(),
      `Exposure Outbreak` = col_character(),
      `Exposure Type` = col_factor(levels = c("Community", "Congregate Living", "Household", "Institutional", "Travel")),
      `Exposure Setting` = col_character(),
      `Exposure Status` = col_factor(levels = c("In Progress", "Pending", "Complete", "Exposure Ruled Out")),
      `Beginning of Exposure` = col_character(),
      `End of Exposure` = col_character(),
      `Location` = col_character()
    )
  )
}
