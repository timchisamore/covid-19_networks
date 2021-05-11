#' Filtering COVID-19 network by date
#'
#' This function takes the entire COVID-19 network and filters it by a given
#' beginning of exposure date.
#'
#' @param create_covid_19_network_data A tbl_graph of COVID-19 networks.
#' @param date A character representing the date to filter the networks by.
#'
#' @return A ggraph of filtered COVID-19 networks.
#' @export
#'
#' @examples
#' `filtering_covid_19_network_by_date(create_covid_19_network_data, "2020-01-20")`
filtering_covid_19_network_by_date <- function(create_covid_19_network_data, date = lubridate::today()) {
  create_covid_19_network_data %>%
    convert(.f = to_subgraph, beginning_of_exposure >= lubridate::ymd(date) + lubridate::days(-14), subset_by = "edges", .select = 1) %>%
    activate("nodes") %>%
    filter(!node_is_isolated()) %>%
    ggraph(layout = "nicely") +
    geom_node_point(aes(colour = investigation_record_type),
      size = 3
    ) +
    geom_edge_link(
      arrow = arrow(length = unit(2, "mm")),
      end_cap = circle(3, "mm")
    ) +
    ggforce::geom_mark_hull(aes(
      x = x,
      y = y,
      fill = iconv(outbreak_name, to = "ASCII//TRANSLIT"),
      filter = (!is.na(outbreak_name) & outbreak_classification == "Confirmed")
    )) +
    scale_colour_brewer(
      type = "qual",
      palette = "Set1",
      labels = c(
        "Case Investigation" = "Case",
        "Contact Outreach" = "Contact"
      )
    ) +
    rcartocolor::scale_fill_carto_d(type = "qualitative") +
    labs(
      title = "COVID-19 Networks",
      subtitle = paste0(date + lubridate::days(-14), " and on"),
      colour = NULL,
      fill = NULL
    ) +
    theme_graph()
}
