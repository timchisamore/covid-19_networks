plan <- drake_plan(
  raw_ccm_exposure_investigations_transmission_data = reading_ccm_exposure_investigations_transmission_data(file_in(!!here::here("data", "raw", "ccm_exposure_investigations_transmission_data.csv"))),
  raw_ccm_exposure_investigations_acquisition_data = reading_ccm_exposure_investigations_acquisition_data(file_in(!!here::here("data", "raw", "ccm_exposure_investigations_acquisition_data.csv"))),
  raw_ccm_exposures_data = reading_ccm_exposures_data(file_in(!!here::here("data", "raw", "ccm_exposures_data.csv"))),
  raw_ccm_investigations_data = reading_ccm_investigations_data(file_in(!!here::here("data", "raw", "ccm_investigations_data.csv"))),
  clean_ccm_exposure_investigations_transmission_data = cleaning_ccm_exposure_investigations_transmission_data(raw_ccm_exposure_investigations_transmission_data),
  clean_ccm_exposure_investigations_acquisition_data = cleaning_ccm_exposure_investigations_acquisition_data(raw_ccm_exposure_investigations_acquisition_data),
  clean_ccm_exposures_data = cleaning_ccm_exposures_data(raw_ccm_exposures_data),
  clean_ccm_investigations_data = cleaning_ccm_investigations_data(raw_ccm_investigations_data),
  join_ccm_exposure_investigations_and_exposures_data = joining_ccm_exposure_investigations_and_exposures_data(clean_ccm_exposure_investigations_transmission_data, clean_ccm_exposure_investigations_acquisition_data, clean_ccm_exposures_data),
  create_covid_19_network_data = creating_covid_19_network_data(join_ccm_exposure_investigations_and_exposures_data, clean_ccm_investigations_data),
  create_covid_19_network_plot = creating_covid_19_network_plot(create_covid_19_network_data),
  filter_covid_19_network_by_date = filtering_covid_19_network_by_date(create_covid_19_network_data),
  filter_covid_19_network_by_voc = filtering_covid_19_network_by_voc(create_covid_19_network_data),
  create_common_acquisition_exposures_data = creating_common_acquisition_exposures_data(clean_ccm_exposure_investigations_acquisition_data, clean_ccm_exposures_data, clean_ccm_investigations_data)
  # report = rmarkdown::render(
  #   input = knitr_in(!!here::here("documents", "covid_19_networks.Rmd")),
  #   output_file = file_out(!!here::here("documents", "covid_19_networks.html"))
  # )
)
