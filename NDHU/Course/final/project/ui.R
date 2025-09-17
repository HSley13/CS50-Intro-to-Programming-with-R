if (!require(shiny)) install.packages("shiny")
library(shiny)

# ==== SHINY UI ====================================================
ui <- shiny::fluidPage(
  shiny::titlePanel("Taiwan – Global Footprint Dashboard"),
  shiny::sidebarLayout(
    shiny::sidebarPanel(
      shiny::sliderInput("yrange", "Year range:",
        min = years_all[1], max = years_all[2],
        value = c(2010, 2024), step = 1, sep = ""
      ),
      shiny::selectInput("country_compare", "Compare GDP / Democracy with:",
        choices = sort(unique(gdp_world_long$country)),
        selected = c("United States", "China"),
        multiple = TRUE
      ),

      # Conditional panels for each tab
      shiny::conditionalPanel(
        "input.nav === 'Stock'",
        shiny::checkboxGroupInput("stock_company", "Company",
          choices = sort(unique(stocks_all$company)),
          selected = unique(stocks_all$company)
        ),
        shiny::dateRangeInput("stock_daterange", "Price window",
          start = stock_min, end = stock_max
        )
      ),
      shiny::conditionalPanel(
        "input.nav === 'Salary'",
        shiny::selectInput("salary_countries", "Compare with (add)",
          choices = salary_country_choices,
          selected = c("United-States", "China"),
          multiple = TRUE
        ),
        shiny::selectInput("salary_numeric", "Numeric variable",
          choices = salary_numeric_vars,
          selected = "hours_per_week"
        )
      ),
      shiny::hr(),
      shiny::downloadButton("dl_democracy", "Download democracy slice"),
      shiny::downloadButton("dl_salary", "Download salary slice")
    ),
    shiny::mainPanel(
      shiny::tabsetPanel(
        id = "nav",
        shiny::tabPanel("Macro",
          value = "Macro",
          shiny::plotOutput("gdp_plot", height = 300),
          shiny::plotOutput("cpi_plot", height = 250)
        ),
        shiny::tabPanel("Democracy",
          value = "Democracy",
          shiny::plotOutput("demo_plot", height = 350)
        ),
        shiny::tabPanel("Stock",
          value = "Stock",
          shiny::plotOutput("stock_plot", height = 350)
        ),
        shiny::tabPanel("Foreigners",
          value = "Foreigners",
          shiny::plotOutput("purpose_plot", height = 300),
          shiny::plotOutput("residence_plot", height = 300)
        ),
        shiny::tabPanel("Salary",
          value = "Salary",
          shiny::plotOutput("salary_dist_plot", height = 280),
          shiny::plotOutput("salary_num_plot", height = 280)
        ),
        shiny::tabPanel("Data",
          value = "Data",
          shiny::tableOutput("tbl_democracy")
        )
      )
    )
  )
)
