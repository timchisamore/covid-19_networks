#' Filtering CCM exposure investigations data
#'
#' This function takes the joined CCM exposure investigations data and removes
#' loops, i.e., instances where a transmission exposure investigation and
#' an acquisition exposure investigation with the same investigation number are
#' joined. It also removes instances where the transmission exposure
#' investigation and acquisition exposure investigation exposure windows did
#' not overlap.
#'
#' @param join_ccm_exposure_investigations_data A tbl_df of joined CCM
#' exposure investigations data.
#'
#' @return A tbl_df of filtered CCM exposure investigation data.
#' @export
#'
#' @examples
#' `filtering_ccm_exposure_investigations_data(join_ccm_exposure_investigations_data)`
filtering_ccm_exposure_investigations_data <-
  function(join_ccm_exposure_investigations_data) {
    # removing edges that link a case to itself and edges that link a case to
    # a contact when the dates do no allow is. This is an artifact of how
    # exposures are stored, i.e., there can be more than one transmission
    # exposure mode per exposure.
    filter(
      .data = join_ccm_exposure_investigations_data,
      investigation_investigation_number_transmission != investigation_investigation_number_acquisition,
      lubridate::int_overlaps(
        int1 = lubridate::interval(start = beginning_date_of_exposure_contact_transmission, end = end_date_of_exposure_contact_transmission),
        int2 = lubridate::interval(start = beginning_date_of_exposure_contact_acquisition, end = end_date_of_exposure_contact_acquisition)
      )
    )
  }
