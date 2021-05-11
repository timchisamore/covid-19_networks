#' Getting CCM exposures field names
#'
#' This function returns a vector indicating the mapping of field names for the
#' CCM exposures data.
#'
#' @return A character of field names.
#' @export
#'
#' @examples
#' `getting_ccm_exposures_field_names()`
getting_ccm_exposures_field_names <- function() {
  # this will allow us to rename the field names from the CCM extract
  c(
    exposure = "exposure_exposure_name",
    outbreak_name = "exposure_outbreak",
    exposure_type = "exposure_type",
    exposure_setting = "exposure_setting",
    exposure_status = "exposure_status",
    beginning_of_exposure = "beginning_of_exposure",
    end_of_exposure = "end_of_exposure",
    location = "location"
  )
}
