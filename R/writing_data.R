#' Writing data
#' 
#' This function writes data to ./data/clean and returns the path as targets
#' requires.
#'
#' @param data A tbl_df of data to write to the ./data/clean folder.
#'
#' @return A character representing the path to the data.
#' @export
#'
#' @examples
#' `writing_data(create_common_acquisition_exposures_data)`
writing_data <- function(data) {
  data_name <- rlang::as_name(enquo(data))
  
  write_csv(x = data, file = here::here("data", "clean", paste0(data_name, ".csv")))

  here::here("data", "clean", paste0(data_name, ".csv"))
}
