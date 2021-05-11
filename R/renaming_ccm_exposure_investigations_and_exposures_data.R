#' Renaming CCM exposure investigations and exposures data
#'
#' This function takes the joined CCM exposure investigations and exposures data
#' and renames the investigation_investigation_number_transmission field to from
#' and the investigation_investigation_number_acquisition field to to. This is
#' to adhere with the requirements of the tbl_graph function from the tidygraph
#' package.
#'
#' @param join_ccm_exposure_investigations_and_exposures_data A tbl_df of
#' joined CCM exposure investigations and exposures data.
#'
#' @return A tbl_df of renamed CCM exposure investigations and exposures data.
#' @export
#'
#' @examples
#' `renaming_ccm_exposure_investigations_and_exposures_data(join_ccm_exposure_investigations_and_exposures_data)`
renaming_ccm_exposure_investigations_data <- function(join_ccm_exposure_investigations_and_exposures_data) {
  rename(
    .data = join_ccm_exposure_investigations_and_exposures_data,
    from = investigation_investigation_number_transmission,
    to = investigation_investigation_number_acquisition,
  )
}
