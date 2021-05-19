#' Getting VOC node indices
#'
#' This function takes the COVID-19 network data and determines the node indices
#' for cases with either an investigation or outbreak subtype that is a VOC,
#' i.e., a lineage.
#'
#' @param create_covid_19_network_data A tbl_graph of COVID-19 network data.
#'
#' @return An integer of node indices.
#' @export
#'
#' @examples
#' `getting_voc_node_indices(create_covid_19_network_data)`
getting_voc_node_indices <- function(create_covid_19_network_data) {
  create_covid_19_network_data %>%
    activate(what = "nodes") %>%
    as_tibble() %>%
    mutate(node_index = row_number()) %>%
    filter(
      investigation_record_type == "Case Investigation",
      (str_detect(investigation_subtype, "^Lineage") | str_detect(outbreak_subtype, "^Lineage"))
    ) %>%
    pull(node_index)
}
