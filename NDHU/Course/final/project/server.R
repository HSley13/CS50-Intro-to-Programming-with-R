if (!require(shiny)) install.packages("shiny")
library(shiny)
if (!require(tidyverse)) install.packages("tidyverse")
library(tidyverse)

# ==== SHINY SERVER ================================================
server <- function(input, output, session) {
  # Reactive data slices
  democracy_slice <- shiny::reactive({
    democracy |>
      dplyr::filter(
        year >= input$yrange[1],
        year <= input$yrange[2],
        country %in% c("Taiwan", input$country_compare)
      )
  })

  gdp_slice <- shiny::reactive({
    dplyr::bind_rows(
      gdp_tw |>
        dplyr::filter(year >= input$yrange[1], year <= input$yrange[2]) |>
        dplyr::mutate(country = "Taiwan"),
      gdp_world_long |>
        dplyr::filter(
          country %in% input$country_compare,
          year >= input$yrange[1], year <= input$yrange[2]
        )
    )
  })

  foreigners_slice <- shiny::reactive({
    purpose_long |>
      dplyr::filter(year >= input$yrange[1], year <= input$yrange[2])
  })

  residence_slice <- shiny::reactive({
    residence_tidy |>
      dplyr::filter(year >= input$yrange[1], year <= input$yrange[2])
  })

  salary_slice <- shiny::reactive({
    keep <- c("Taiwan", input$salary_countries)
    salary_raw |>
      dplyr::filter(native_country %in% keep)
  })

  # Plot outputs
  output$gdp_plot <- shiny::renderPlot({
    gdp_slice() |>
      ggplot2::ggplot(ggplot2::aes(year, gdp_usd_bn)) +
      ggplot2::geom_line(linewidth = 1.2, colour = "steelblue") +
      ggplot2::geom_point(colour = "steelblue") +
      ggplot2::scale_y_continuous(labels = scales::comma) +
      ggplot2::facet_wrap(~country, scales = "free_y") +
      ggplot2::labs(
        title = "GDP by Country (US$ billion, free y-axis)",
        y = "US$ billion", x = NULL
      ) +
      ggplot2::theme_minimal()
  })

  output$cpi_plot <- shiny::renderPlot({
    macro_tw |>
      dplyr::filter(year >= input$yrange[1], year <= input$yrange[2]) |>
      ggplot2::ggplot(ggplot2::aes(year, cpi_nsadj)) +
      ggplot2::geom_line(linewidth = 1.2, colour = "firebrick") +
      ggplot2::geom_point(colour = "firebrick") +
      ggplot2::labs(
        title = "Taiwan CPI (non-seasonal)",
        y = "Index (2001 = 100)", x = NULL
      ) +
      ggplot2::theme_minimal()
  })

  output$demo_plot <- shiny::renderPlot({
    democracy_slice() |>
      ggplot2::ggplot(ggplot2::aes(year, demo_score, colour = country)) +
      ggplot2::geom_line(linewidth = 1) +
      ggplot2::geom_point() +
      ggplot2::labs(
        title = "EIU Democracy Index",
        y = "Score (0-10)", x = NULL, colour = NULL
      ) +
      ggplot2::theme_minimal()
  })

  output$stock_plot <- shiny::renderPlot({
    stocks_all |>
      dplyr::filter(
        company %in% input$stock_company,
        date >= input$stock_daterange[1],
        date <= input$stock_daterange[2]
      ) |>
      ggplot2::ggplot(ggplot2::aes(date, adj_close, colour = company)) +
      ggplot2::geom_line(linewidth = 1) +
      ggplot2::labs(
        title = "Adjusted-Close Price Comparison",
        y = "US$", x = NULL, colour = NULL
      ) +
      ggplot2::theme_minimal()
  })

  output$purpose_plot <- shiny::renderPlot({
    foreigners_slice() |>
      dplyr::group_by(year, purpose) |>
      dplyr::summarise(visitors = sum(count, na.rm = TRUE), .groups = "drop") |>
      ggplot2::ggplot(ggplot2::aes(year, visitors, fill = purpose)) +
      ggplot2::geom_area(alpha = 0.9) +
      ggplot2::scale_y_continuous(labels = scales::comma) +
      ggplot2::labs(
        title = "Foreign Visitors by Purpose",
        y = "Visitors", x = NULL, fill = "Purpose"
      ) +
      ggplot2::theme_minimal()
  })

  output$residence_plot <- shiny::renderPlot({
    residence_slice() |>
      dplyr::group_by(residence) |>
      dplyr::summarise(total = sum(total, na.rm = TRUE), .groups = "drop") |>
      dplyr::slice_max(total, n = 10) |>
      ggplot2::ggplot(ggplot2::aes(reorder(residence, total), total)) +
      ggplot2::geom_col(fill = "darkorange") +
      ggplot2::coord_flip() +
      ggplot2::scale_y_continuous(labels = scales::comma) +
      ggplot2::labs(
        title = "Top 10 Visitor Residences",
        y = "Visitors", x = NULL
      ) +
      ggplot2::theme_minimal()
  })

  output$salary_dist_plot <- shiny::renderPlot({
    salary_slice() |>
      dplyr::count(native_country, salary) |>
      ggplot2::ggplot(ggplot2::aes(native_country, n, fill = salary)) +
      ggplot2::geom_col(position = "fill") +
      ggplot2::scale_y_continuous(labels = scales::percent) +
      ggplot2::labs(
        title = "Income Share (> 50K vs ≤ 50K)",
        y = "% of respondents", x = NULL, fill = "Income"
      ) +
      ggplot2::theme_minimal() +
      ggplot2::theme(axis.text.x = element_text(angle = 45, hjust = 1))
  })

  output$salary_num_plot <- shiny::renderPlot({
    salary_slice() |>
      ggplot2::ggplot(ggplot2::aes(native_country, .data[[input$salary_numeric]],
        fill = native_country
      )) +
      ggplot2::geom_boxplot(alpha = 0.7, outlier.alpha = 0.25, show.legend = FALSE) +
      ggplot2::labs(
        title = paste("Distribution of", input$salary_numeric),
        x = NULL, y = NULL
      ) +
      ggplot2::theme_minimal() +
      ggplot2::theme(axis.text.x = element_text(angle = 45, hjust = 1))
  })

  # Table output
  output$tbl_democracy <- shiny::renderTable({
    democracy_slice() |> utils::head(100)
  })

  # Download handlers
  output$dl_democracy <- shiny::downloadHandler(
    filename = function() paste0("democracy_", Sys.Date(), ".csv"),
    content = function(file) readr::write_csv(democracy_slice(), file)
  )

  output$dl_salary <- shiny::downloadHandler(
    filename = function() paste0("salary_", Sys.Date(), ".csv"),
    content = function(file) readr::write_csv(salary_slice(), file)
  )
}
