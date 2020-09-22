library(magrittr)

pamngr::get_data("nhspstot") %>%
  set_colnames(c("dates", "Housing Starts")) %>%
  dplyr::slice_max(dates, n = 60) %>%
  reshape2::melt(id.vars = "dates") %>%
  pamngr::barplot() %>%
  pamngr::pam_plot(
    plot_title = "Housings Starts",
    plot_subtitle = "Thousands, SAAR",
    show_legend = FALSE
  ) %>%
  pamngr::all_output("housing-starts")
