#' Getting acquisitions outside incubation period
#'
#' This function takes the joined CCM exposure investigations acquisition and
#' investigations data and identifies acqusitions that occured less than 1 day
#' from their beginning exposure date or more than 14 days from their end of
#' exposure date. These fall outside of the accepted incubation period of
#' COVID-19.
#'
#' @param clean_ccm_exposure_investigations_acquisition_data A tbl_df of clean
#' CCM exposure investigations acquisition data.
#' @param clean_ccm_investigations_data A tbl_df of clean CCM investigations
#' data.
#'
#' @return A character of exposure investigation names indicating acquistions
#' that fell outside the incubation period of COVID-19.
#' @export
#'
#' @examples
#' `getting_acquisitions_outside_incubation_period(clean_ccm_exposure_investigations_acquisition_data, clean_ccm_investigations_data)`
getting_acquisitions_outside_incubation_period <- function(clean_ccm_exposure_investigations_acquisition_data, clean_ccm_investigations_data) {
  joining_ccm_exposure_investigations_acquisition_and_investigations_data(
    clean_ccm_exposure_investigations_acquisition_data,
    clean_ccm_investigations_data
  ) %>%
    mutate(
      length_beginning_to_episode = creating_interval_length(start = beginning_date_of_exposure_contact, end = episode_date),
      length_end_to_episode = creating_interval_length(end_date_of_exposure_contact, end = episode_date)
    ) %>%
    filter(
      investigation_record_type == "Case Investigation",
      (length_beginning_to_episode < 1 |
        length_end_to_episode > 14)
    ) %>%
    pull(exposure_investigation_name)
}
