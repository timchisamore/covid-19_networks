#' Creating COVID-19 network plot
#'
#' This function takes the COVID-19 network data and creates a plot of the
#' network where the nodes are coloured by investigation record type.
#'
#' @param create_covid_19_network_data A tbl_graph of COVID-19 network data.
#'
#' @return A ggraph of the COVID-19 network data.
#' @export
#'
#' @examples
#' `creating_covid_19_network_plot(create_covid_19_network_data)`
creating_covid_19_network_plot <- function(create_covid_19_network_data) {
  create_covid_19_network_data %>%
    ggraph(layout = "nicely") +
    geom_node_point(aes(colour = investigation_record_type), size = 3) +
    geom_edge_link(arrow = arrow(length = unit(3, "mm"))) +
    # ggforce::geom_mark_ellipse(aes(x = x, y = y, group = investigation_outbreak, label = investigation_outbreak, filter = !is.na(investigation_outbreak)), label.fontsize = 10) +
    # geom_node_text(aes(label = name), show.legend = FALSE) +
    scale_colour_brewer(
      type = "qual",
      palette = "Set1"
    ) +
    labs(
      title = "COVID-19 Networks",
      colour = "Investigation Type"
    ) +
    theme_graph()
}
