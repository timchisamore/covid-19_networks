#' Filtering COVID-19 network by VOC
#'
#' This function returns COVID-19 networks where the nodes are exclusively
#' cases and one or more nodes of each edge has either an investigation or
#' outbreak subtype that is a VOC.
#'
#' @param create_covid_19_network_data A tbl_graph of COVID-19 network data.
#'
#' @return A ggraph of filtered COVID-19 networks.
#' @export
#'
#' @examples
#' `filtering_covid_19_network_by_voc(create_covid_19_network_data)`
filtering_covid_19_network_by_voc <- function(create_covid_19_network_data) {
  get_voc_node_indices <- getting_voc_node_indices(create_covid_19_network_data)

  create_covid_19_network_data %>%
    convert(.f = to_subgraph, from %in% get_voc_node_indices | to %in% get_voc_node_indices, subset_by = "edges", .select = 1) %>%
    activate("nodes") %>%
    filter(investigation_record_type == "Case Investigation") %>%
    filter(!node_is_isolated()) %>%
    mutate(
      investigation_subtype = coalesce(investigation_subtype, outbreak_subtype),
      investigation_subtype = fct_explicit_na(investigation_subtype, na_level = "COVID-19")
    ) %>%
    ggraph(layout = "nicely") +
    geom_node_point(aes(colour = investigation_subtype),
      size = 3
    ) +
    geom_edge_link(
      arrow = arrow(length = unit(2, "mm")),
      end_cap = circle(3, "mm")
    ) +
    ggforce::geom_mark_hull(aes(
      x = x,
      y = y,
      fill = outbreak_name,
      filter = !is.na(outbreak_name)
    )) +
    scale_color_brewer(
      type = "qual",
      palette = "Set1"
    ) +
    rcartocolor::scale_fill_carto_d() +
    labs(
      title = "COVID-19 Networks with VOCs",
      colour = NULL,
      fill = NULL
    ) +
    theme_graph()
}
