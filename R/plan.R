plan <- drake_plan(
  raw_ccm_investigations_data = reading_ccm_investigations_data(file_in(!!here::here("data", "raw", "ccm_investigations_data.csv"))),
  raw_ccm_exposure_investigations_cases_data = reading_ccm_exposure_investigations_cases_data(file_in(!!here::here("data", "raw", "ccm_exposure_investigations_cases_data.csv"))),
  raw_ccm_exposure_investigations_contacts_data = reading_ccm_exposure_investigations_contacts_data(file_in(!!here::here("data", "raw", "ccm_exposure_investigations_contacts_data.csv"))),
  raw_ccm_exposure_investigations_with_exposures = reading_ccm_exposure_investigations_with_exposures_data(file_in(!!here::here("data", "raw", "ccm_exposure_investigations_with_exposures_data.csv"))),
  clean_ccm_investigations_data = cleaning_ccm_investigations_data(raw_ccm_investigations_data),
  clean_ccm_exposure_investigations_cases_data = cleaning_ccm_exposure_investigations_cases_data(raw_ccm_exposure_investigations_cases_data),
  clean_ccm_exposure_investigations_contacts_data = cleaning_ccm_exposure_investigations_contacts_data(raw_ccm_exposure_investigations_contacts_data),
  clean_ccm_exposure_investigations_with_exposures_data = cleaning_ccm_exposure_investigations_with_exposures_data(raw_ccm_exposure_investigations_with_exposures),
  join_ccm_exposure_investigations_data = joining_ccm_exposure_investigations_data(clean_ccm_exposure_investigations_cases_data, clean_ccm_exposure_investigations_contacts_data, clean_ccm_exposure_investigations_with_exposures_data),
  get_covid_19_networks_data = getting_covid_19_networks_data(join_ccm_exposure_investigations_data, clean_ccm_investigations_data),
  get_covid_19_networks_plot = getting_covid_19_networks_plot(get_covid_19_networks_data),
  report = rmarkdown::render(
    input = knitr_in(!!here::here("documents", "covid_19_networks.Rmd")),
    output_file = file_out(!!here::here("documents", "covid_19_networks.html"))
  )
)
