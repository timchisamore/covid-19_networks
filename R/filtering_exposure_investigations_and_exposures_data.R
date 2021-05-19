#' Filtering exposure investigations and exposures data
#'
#' This function takes the joined CCM exposure investigations and exposures
#' data and removes links between the same investigation number since a case
#' can't expose themselves, links where the acqusition and transmission windows
#' don't overlap, and links where the incubation period is not feasible.
#'
#' @param join_ccm_exposure_investigations_and_exposures_data A tbl_df of joined
#' CCM exposure investigations and exposures data.
#' @param clean_ccm_exposure_investigations_acquisition_data A tbl_df of clean
#' CCM exposure investigations acqusition data.
#' @param clean_ccm_investigations_data A tbl_df of clean CCM invesitgations
#' data.
#'
#' @return A tbl_df of filtered exposure inveestigations and exposures data.
#' @export
#'
#' @examples
#' `filtering_exposure_investigations_and_exposures_data(join_ccm_exposure_investigations_and_exposures_data, clean_ccm_exposure_investigations_acquisition_data, clean_ccm_investigations_data)`
filtering_exposure_investigations_and_exposures_data <- function(join_ccm_exposure_investigations_and_exposures_data,
                                                                 clean_ccm_exposure_investigations_acquisition_data,
                                                                 clean_ccm_investigations_data) {
  join_ccm_exposure_investigations_and_exposures_data %>%
    # filtering our joined CCM exposure investigations data to remove links
    # between the same investigation number (a case could be both a transmission
    # and acquisiton exposure investigation on a given exposure), where the
    # transmission and acquisition exposure windows don't overlap, and where the
    # case acquired COVID-19 outside of the incubation period.
    filter(
      investigation_number_transmission != investigation_number_acquisition,
      lubridate::int_overlaps(
        int1 = lubridate::interval(start = beginning_date_of_exposure_contact_transmission, end = end_date_of_exposure_contact_transmission),
        int2 = lubridate::interval(start = beginning_date_of_exposure_contact_acquisition, end = end_date_of_exposure_contact_acquisition)
      ), !(
        exposure_investigation_name_acquisition %in% getting_acquisitions_outside_incubation_period(clean_ccm_exposure_investigations_acquisition_data, clean_ccm_investigations_data)
      )
    )
}
