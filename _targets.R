library(targets)
library(tarchetypes)
purrr::walk(.x = fs::dir_ls(path = here::here("R")), .f = source)
tar_option_set(packages = c("tidyverse", "conflicted", "tidygraph", "ggraph"))
list(
  tar_file(ccm_exposure_investigations_acquisition_path, here::here("data", "raw", "ccm_exposure_investigations_acquisition_data.csv")),
  tar_file(ccm_exposure_investigations_transmission_path, here::here("data", "raw", "ccm_exposure_investigations_transmission_data.csv")),
  tar_file(ccm_exposures_path, here::here("data", "raw", "ccm_exposures_data.csv")),
  tar_file(ccm_investigations_path, here::here("data", "raw", "ccm_investigations_data.csv")),
  tar_target(raw_ccm_exposure_investigations_acquisition_data, reading_ccm_exposure_investigations_acquisition_data(ccm_exposure_investigations_acquisition_path)),
  tar_target(raw_ccm_exposure_investigations_transmission_data, reading_ccm_exposure_investigations_transmission_data(ccm_exposure_investigations_transmission_path)),
  tar_target(raw_ccm_exposures_data, reading_ccm_exposures_data(ccm_exposures_path)),
  tar_target(raw_ccm_investigations_data, reading_ccm_investigations_data(ccm_investigations_path)),
  tar_target(clean_ccm_exposure_investigations_acquisition_data, cleaning_ccm_exposure_investigations_acquisition_data(raw_ccm_exposure_investigations_acquisition_data)),
  tar_target(clean_ccm_exposure_investigations_transmission_data, cleaning_ccm_exposure_investigations_transmission_data(raw_ccm_exposure_investigations_transmission_data)),
  tar_target(clean_ccm_exposures_data, cleaning_ccm_exposures_data(raw_ccm_exposures_data)),
  tar_target(clean_ccm_investigations_data, cleaning_ccm_investigations_data(raw_ccm_investigations_data)),
  tar_target(join_ccm_exposure_investigations_and_exposures_data, joining_ccm_exposure_investigations_and_exposures_data(clean_ccm_exposure_investigations_transmission_data, clean_ccm_exposure_investigations_acquisition_data, clean_ccm_exposures_data)),
  tar_target(filter_ccm_exposure_investigations_and_exposures_data, filtering_exposure_investigations_and_exposures_data(join_ccm_exposure_investigations_and_exposures_data, clean_ccm_exposure_investigations_acquisition_data, clean_ccm_investigations_data)),
  tar_target(create_covid_19_network_data, creating_covid_19_network_data(filter_ccm_exposure_investigations_and_exposures_data, clean_ccm_investigations_data)),
  tar_target(create_covid_19_network_plot, creating_covid_19_network_plot(create_covid_19_network_data)),
  tar_file(write_covid_19_network_plot, writing_figure(create_covid_19_network_plot)),
  tar_target(filter_covid_19_network_by_date, filtering_covid_19_network_by_date(create_covid_19_network_data)),
  tar_file(write_covid_19_network_by_date, writing_figure(filter_covid_19_network_by_date)),
  tar_target(filter_covid_19_network_by_voc, filtering_covid_19_network_by_voc(create_covid_19_network_data)),
  tar_file(write_covid_19_network_by_voc, writing_figure(filter_covid_19_network_by_voc)),
  tar_target(create_common_acquisition_exposures_data, creating_common_acquisition_exposures_data(clean_ccm_exposure_investigations_acquisition_data, clean_ccm_exposures_data, clean_ccm_investigations_data)),
  tar_file(write_common_acquisition_exposures_data, writing_data(create_common_acquisition_exposures_data))
)
