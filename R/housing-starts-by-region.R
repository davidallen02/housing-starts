library(magrittr)

dat <- pamngr::join_sheets(c("nhspsne","nhspswe","nhspsso","nhspsmw")) %>%
  set_colnames(c("dates", "Northeast","West","South","Midwest")) %>%
  dplyr::slice_max(dates, n = 60) %>%
  reshape2::melt(id.vars = "dates")

p <- dat %>%
  pamngr::barplot() %>%
  pamngr::pam_plot(
    plot_title = "Housings Starts",
    plot_subtitle = "Thousands, SAAR",
    show_legend = FALSE
  )

p <- p + ggplot2::facet_wrap( .~variable, ncol = 2)


p %>% pamngr::all_output("housing-starts-by-region")