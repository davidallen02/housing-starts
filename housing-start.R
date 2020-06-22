devtools::install_github("davidallen02/pamngr")
library(magrittr)

pamngr::get_data("nhspstot") %>%
  set_colnames(c("dates", "Housing Starts")) %>%
  dplyr::slice_max(dates, n = 60) %>%
  reshape2::melt(id.vars = "dates") %>%
  pamngr::barplot() %>%
  pamngr::pam.plot(
    plot.title = "Housings Starts",
    plot.subtitle = "Thousands, SAAR",
    show.legend = FALSE
  ) %>%
  pamngr::ppt_output("housing-starts.png")
