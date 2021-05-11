#' Getting CCM investigations field names
#'
#' This function returns a vector indicating the mapping of field names for the
#' CCM investigations data.
#'
#' @return A character of field names.
#' @export
#'
#' @examples
#' `getting_ccm_investigations_field_names()`
getting_ccm_investigations_field_names <- function() {
  # this will allow us to rename the field names from the CCM extract
  c(
    client_id = "client_name_client_id",
    iphis_client_id = "client_name_iphis_client_id",
    investigation_number = "investigation_number",
    iphis_case_id = "iphis_case_id",
    outbreak_number = "investigation_outbreak_outbreak_number",
    outbreak_name = "investigation_outbreak_outbreak_name",
    outbreak_classification = "investigation_outbreak_outbreak_classification",
    outbreak_subtype = "outbreak_subtype",
    disease = "disease",
    investigation_subtype = "investigation_subtype",
    client_gender = "client_name_person_client_gender",
    client_date_of_birth = "client_name_person_client_date_of_birth",
    permanent_city_at_illness = "permanent_city_at_illness",
    current_city_at_illness = "current_city_at_illness",
    investigation_record_type = "investigation_record_type",
    classification = "classification",
    disposition = "disposition",
    status = "status",
    epidemiologic_link_status = "epidemiologic_link_status",
    epidemiologic_linkage = "epidemiologic_linkage",
    remote_positive = "remote_positive",
    re_positive = "re_positive",
    episode_date_type = "episode_date_type",
    episode_date = "episode_date",
    earliest_symptom_onset_date = "earliest_symptom_onset_date",
    earliest_positive_lab_collection_date = "earliest_positive_lab_collection_date",
    reported_date = "reported_date",
    investigation_start_date = "investigation_start_date",
    investigation_health_unit_rhu = "investigation_health_unit_rhu_phu_table_name"
  )
}
