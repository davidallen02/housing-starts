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


# Northeast -------------------------------------------------------------------------
dat <- pamngr::get_data("nhspsne") %>%
  dplyr::slice_max(dates, n = 12) %>%
  tidyr::pivot_longer(cols = -dates, names_to = "variable")
  
p <- dat %>%
  pamngr::barplot() %>%
  pamngr::pam_plot(
    plot_title = "Northeast",
    plot_subtitle = "Thousands, SAAR",
    show_legend = FALSE
  )

p <- p + ggplot2::scale_fill_manual(values = pamngr::pam.pal()[2])

p %>% pamngr::all_output("housing-starts-northeast")

# West ------------------------------------------------------------------------------
dat <- pamngr::get_data("nhspswe") %>%
  dplyr::slice_max(dates, n = 12) %>%
  tidyr::pivot_longer(cols = -dates, names_to = "variable")

p <- dat %>%
  pamngr::barplot() %>%
  pamngr::pam_plot(
    plot_title = "West",
    plot_subtitle = "Thousands, SAAR",
    show_legend = FALSE
  )

p <- p + ggplot2::scale_fill_manual(values = pamngr::pam.pal()[3])

p %>% pamngr::all_output("housing-starts-west")

# Midwest ---------------------------------------------------------------------------
dat <- pamngr::get_data("nhspsmw") %>%
  dplyr::slice_max(dates, n = 12) %>%
  tidyr::pivot_longer(cols = -dates, names_to = "variable")

p <- dat %>%
  pamngr::barplot() %>%
  pamngr::pam_plot(
    plot_title = "Midwest",
    plot_subtitle = "Thousands, SAAR",
    show_legend = FALSE
  )

p <- p + ggplot2::scale_fill_manual(values = pamngr::pam.pal()[4])

p %>% pamngr::all_output("housing-starts-midwest")

# South -----------------------------------------------------------------------------
dat <- pamngr::get_data("nhspsso") %>%
  dplyr::slice_max(dates, n = 12) %>%
  tidyr::pivot_longer(cols = -dates, names_to = "variable")

p <- dat %>%
  pamngr::barplot() %>%
  pamngr::pam_plot(
    plot_title = "South",
    plot_subtitle = "Thousands, SAAR",
    show_legend = FALSE
  )

p <- p + ggplot2::scale_fill_manual(values = pamngr::pam.pal()[5])

p %>% pamngr::all_output("housing-starts-south")

