#' Creating node data
#'
#' This function takes the filtered CCM exposure investigations and exposures
#' data and creates a tbl_df of distinct node names.
#'
#' @param filter_ccm_exposure_investigations_and_exposures_data A tbl_df of
#' filtered CCM exposure investigations data.
#'
#' @return A tbl_df of node data to generate networks with.
#' @export
#'
#' @examples
#' `creating_node_data(filter_ccm_exposure_investigations_and_exposures_data)`
creating_node_data <- function(filter_ccm_exposure_investigations_and_exposures_data) {
  renaming_ccm_exposure_investigations_data(filter_ccm_exposure_investigations_and_exposures_data) %>%
    select(from, to) %>%
    pivot_longer(cols = everything(), names_to = "mode", values_to = "investigation_number") %>%
    distinct(investigation_number)
}
