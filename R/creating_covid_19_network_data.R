#' Creating COVID-19 network data
#'
#' This function takes the filtered CCM exposure investigations and exposures
#' data and creates a tbl_graph object using the tidygraph package. Afterwards,
#' we join our clean CCM investigations data to the nodes by investigation
#' number. This provides node attributes, such as episode date.
#'
#' @param filter_ccm_exposure_investigations_and_exposures_data A tbl_df of
#' filtered CCM exposure investigations and exposures data.
#' @param clean_ccm_investigations_data A tbl_df of clean CCM investigations
#' data.
#'
#' @return A tbl_graph of COVID-19 network data.
#' @export
#'
#' @examples
#' `creating_covid_19_network_data(filter_ccm_exposure_investigations_and_exposures_data, clean_ccm_investigations_data)`
creating_covid_19_network_data <-
  function(filter_ccm_exposure_investigations_and_exposures_data,
           clean_ccm_investigations_data) {
    tbl_graph(
      nodes = creating_node_data(filter_ccm_exposure_investigations_and_exposures_data),
      edges = creating_edge_data(filter_ccm_exposure_investigations_and_exposures_data),
      node_key = "investigation_number",
      directed = TRUE
    ) %>%
      activate("nodes") %>%
      left_join(
        clean_ccm_investigations_data,
        by = "investigation_number"
      )
  }
