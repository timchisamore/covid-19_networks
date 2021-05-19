#' Getting CCM exposure investigations field names
#'
#' This function returns a vector indicating the mapping of field names for the
#' CCM exposure investigations data.
#'
#' @return A character of field names.
#' @export
#'
#' @examples
#' `getting_ccm_exposure_investigations_field_names()`
getting_ccm_exposure_investigations_field_names <- function() {
  # this will allow us to rename the field names from the CCM extract
  c(
    exposure = "exposure",
    exposure_investigation_name = "exposure_investigation_exposure_investigation_name",
    exposure_mode = "exposure_mode",
    beginning_date_of_exposure_contact = "beginning_date_of_exposure_contact",
    end_date_of_exposure_contact = "end_date_of_exposure_contact",
    investigation_number = "investigation_investigation_number"
  )
}
