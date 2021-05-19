#' Creating edge data
#'
#' This function takes the filtered CCM exposure investigations and exposures
#' data and renames the investigation_investigation_number_transsmision field to
#' from and the investigation_investigation_number_acquisition field to to. This
#' is in accordance with the tbl_graph function from the tidygraph package.
#'
#' @param filter_ccm_exposure_investigations_and_exposures_data A tbl_df of
#' joined CCM exposure investigations and CCM exposures data.
#'
#' @return A tbl_df of edge data to generate networks with.
#' @export
#'
#' @examples
#' `creating_edge_data(filter_ccm_exposure_investigations_and_exposures_data)`
creating_edge_data <- function(filter_ccm_exposure_investigations_and_exposures_data) {
  # the tbl_graph function from the tidygraph package requires their to be
  # columns indicating from and to within the data.
  renaming_ccm_exposure_investigations_data(filter_ccm_exposure_investigations_and_exposures_data)
}
