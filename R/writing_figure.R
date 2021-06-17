#' Writing figure
#'
#' This function writes a figure to ./documents/figures and returns the path as
#' targets requires.
#'
#' @param figure A ggplot to write to the ./documents/figures folder.
#'
#' @return A character representing the path to the figure.
#' @export
#'
#' @examples
#' `writing_figure(create_covid_19_network_plot)`
writing_figure <- function(figure) {
  figure_name <- rlang::as_name(enquo(figure))

  ggsave(
    filename = here::here("documents", "figures", paste0(figure_name, ".png")),
    plot = figure,
    width = 13,
    height = 8
  )

  here::here("documents", "figures", paste0(figure_name, ".png"))
}
