#' Joining CCM Exposure Investigations Data
#'
#' This function takes the clean CCM exposure investigations data and joins it on
#' exposure name, providing us a tbl_df of connections between cases and cases or contacts.
#' Note that we also only return the investigation numbers, we are not interested in
#' the further exposure information.
#'
#' @param clean_ccm_exposure_investigations_cases_data a tbl_df of clean CCM exposure investigations - cases data
#' @param clean_ccm_exposure_investigations_contacts_data a tbl_df of clean CCM exposure investigations - contacts data
#' @param clean_ccm_exposure_investigations_with_exposures_data a tbl_df of clean CCM exposure investigations with exposures data
#'
#' @return a tbl_df of joined CCM exposure investigations data
#' @export
#'
#' @examples
#' joining_ccm_exposure_investigations_data(clean_ccm_exposure_investigations_cases_data, clean_ccm_exposure_investigations_contacts_data, clean_ccm_exposure_investigations_with_exposures_data)
joining_ccm_exposure_investigations_data <-
  function(clean_ccm_exposure_investigations_cases_data,
           clean_ccm_exposure_investigations_contacts_data,
           clean_ccm_exposure_investigations_with_exposures_data) {
    join_ccm_exposure_investigations_data <-
      clean_ccm_exposure_investigations_cases_data %>%
      inner_join(clean_ccm_exposure_investigations_contacts_data, by = "exposure") %>%
      filter(
        investigation_investigation_number.x != investigation_investigation_number.y,
        str_detect(string = exposure, pattern = "^EXP-[0-9]{4,}$")
      ) %>%
      select(exposure,
        from = investigation_investigation_number.x,
        from_role = residency_work_visit.x,
        from_beginning_date_of_exposure = beginning_date_of_exposure_contact.x,
        from_end_date_of_exposure = end_date_of_exposure_contact.x,
        to = investigation_investigation_number.y,
        to_role = residency_work_visit.y,
        to_beginning_date_of_exposure = beginning_date_of_exposure_contact.y,
        to_end_date_of_exposure = end_date_of_exposure_contact.y
      ) %>%
      inner_join(clean_ccm_exposure_investigations_with_exposures_data,
        by = c(exposure = "exposure_exposure_name")
      )

    return(join_ccm_exposure_investigations_data)
  }
