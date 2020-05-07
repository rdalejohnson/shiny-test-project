library(shiny)
library(ggplot2)  # for the diamonds dataset

ui <- fluidPage(
  title = "Examples of DataTables",
#  sidebarLayout(
#    sidebarPanel(
      # conditionalPanel(
      #   'input.dataset === "diamonds"',
      #   checkboxGroupInput("show_vars", "Columns in diamonds to show:",
      #                      names(diamonds), selected = names(diamonds))
      # ),
      #conditionalPanel(
      #  'input.dataset === "COVID Concept Explorer"',
       # helpText("Click the column header to sort a column."), 
      #  checkboxGroupInput("show_vars", "Covid Concepts:",
       #                    names("COVID Concept Explorer"), selected = names("COVID Concept Explorer"))
      #)
      # ,
      # conditionalPanel(
      #   'input.dataset === "iris"',
      #   helpText("Display 5 records by default.")
      # )
#    ),
    mainPanel(
      tabsetPanel(
        id = 'dataset',
       # tabPanel("diamonds", DT::dataTableOutput("mytable1")),
        tabPanel("COVID Concept Explorer", DT::dataTableOutput("mytable2"))
       # tabPanel("iris", DT::dataTableOutput("mytable3"))
      )
    )
  )
#) 

server <- function(input, output) {

  # choose columns to display
  

  # 
  # diamonds2 = diamonds[sample(nrow(diamonds), 1000), ]
  # output$mytable1 <- DT::renderDataTable({
  #   DT::datatable(diamonds2[, input$show_vars, drop = FALSE])
  # })

  # sorted columns are colored now because CSS are attached to them
  testingz <- read.csv(file = "all_covid_concepts.csv")
  output$mytable2 <- DT::renderDataTable({
    DT::datatable(testingz, options = list(orderClasses = TRUE))
   # DT::datatable(testingz[, input$show_vars, drop = FALSE])
  })

  # # customize the length drop-down menu; display 5 rows per page by default
  # output$mytable3 <- DT::renderDataTable({
  #   DT::datatable(iris, options = list(lengthMenu = c(5, 30, 50), pageLength = 5))
  # })

}

shinyApp(ui, server)
