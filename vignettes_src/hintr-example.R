#' ---
#' title: "Emulate a hintr model run"
#' output: rmarkdown::html_vignette
#' vignette: >
#'   %\VignetteIndexEntry{`hintr` example run}
#'   %\VignetteEngine{knitr::rmarkdown}
#'   %\VignetteEncoding{UTF-8}
#' ---

##+ include = FALSE
knitr::opts_chunk$set(
                    collapse = TRUE,
                    comment = "#>"
                  )
unlink("outputs", recursive = TRUE)
#'
#'
#' This vignette provides example

##+ setup, message = FALSE

library(naomi)

##+ fit model
hintr_data <- list(
  pjnz = system.file("extdata/mwi2019.PJNZ", package = "naomi"),
  population = system.file("extdata/population/population_agesex.csv", package = "naomi"),
  shape = system.file("extdata/areas/area_merged.geojson", package = "naomi"),
  survey = system.file("extdata/survey/survey_hiv_indicators.csv", package = "naomi"),
  art_number = system.file("extdata/programme/art_number.csv", package = "naomi"),
  anc_testing = system.file("extdata/programme/anc_testing.csv", package = "naomi")
)

hintr_options <- list(
  area_scope = "MWI",
  area_level = "4",
  calendar_quarter_t1 = "CY2016Q1",
  calendar_quarter_t2 = "CY2018Q3",
  calendar_quarter_t3 = "CY2019Q2",
  survey_prevalence = c("MWI2016PHIA", "MWI2015DHS"),
  survey_art_coverage = "MWI2016PHIA",
  survey_recently_infected = "MWI2016PHIA",
  include_art_t1 = "true",
  include_art_t2 = "true",
  anc_prevalence_year1 = 2016,
  anc_prevalence_year2 = 2018,
  anc_art_coverage_year1 = 2016,
  anc_art_coverage_year2 = 2018,
  spectrum_population_calibration = "national",
  spectrum_plhiv_calibration_level = "national",
  spectrum_plhiv_calibration_strat = "sex_age_group",
  spectrum_artnum_calibration_level = "national",
  spectrum_artnum_calibration_strat = "age_coarse",
  spectrum_infections_calibration_level = "national",
  spectrum_infections_calibration_strat = "age_coarse",
  artattend = "true",
  artattend_t2 = "true",
  artattend_log_gamma_offset = -4L,
  rng_seed = 17,
  no_of_samples = 20,
  max_iter = 250,
  permissive = "false"
)

hintr_options$outer_verbose <- TRUE

hintr_paths <- hintr_run_model(hintr_data, hintr_options)
