#' Getting COVID-19 Networks Data
#'
#' This function takes the joined CCM exposure investigations data and coerces it to
#' a tbl_graph using the as_tbl_graph function from the {tidygraph} package. Afterwards,
#' we join our clean CCM investigations data to the nodes by investigation number. This
#' will provide us with information on the investigations, such as investigation record
#' type.
#'
#' @param join_ccm_exposure_investigation_data a tbl_df of joined CCM exposure investigations data
#' @param clean_ccm_investigations_data a tbl_df of clean CCM investigations data
#'
#' @return a tbl_graph of COVID-19 networks data
#' @export
#'
#' @examples
#' getting_covid_19_networks_data(join_ccm_exposure_investigations_data, clean_ccm_investigations_data)
getting_covid_19_networks_data <-
  function(join_ccm_exposure_investigations_data,
           clean_ccm_investigations_data) {
    get_covid_19_networks_data <-
      as_tbl_graph(join_ccm_exposure_investigations_data) %>%
      activate("nodes") %>%
      left_join(
        clean_ccm_investigations_data %>%
          mutate(investigation_number = as.character(investigation_number)),
        by = c(name = "investigation_number")
      )

    return(get_covid_19_networks_data)
  }
