#' Getting COVID-19 Networks Plot
#'
#' This function takes the COVID-19 networks data and creates a plot of the
#' networks where the nodes are coloured by investigation record type. Note that
#' there are some unknown investigation record types due to these having neither
#' a permanent or investigation health unit corresponding to our area.
#'
#' @param get_covid_19_networks_data a tbl_graph of COVID-19 networks data
#'
#' @return a .png of the COVID-19 networks plot
#' @export
#'
#' @examples
#' getting_covid_19_networks_plot(get_covid_19_networks_data)
getting_covid_19_networks_plot <- function(get_covid_19_networks_data) {
  get_covid_19_networks_plot <- get_covid_19_networks_data %>%
    activate("nodes") %>%
    mutate(investigation_record_type = fct_explicit_na(investigation_record_type, na_level = "Unknown")) %>%
    ggraph(layout = "nicely") +
    geom_node_point(aes(colour = investigation_record_type), size = 5) +
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

  return(get_covid_19_networks_plot)
}
