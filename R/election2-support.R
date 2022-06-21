# library(shinydashboard)
# library(shiny)
# library(crosstalk)
# library(bs4Dash)
# myapp$load |> purrr::walk(~{eval(.x(), envir = .GlobalEnv)})
ui = function(body=NULL){
  require(shinydashboard)
  require(shiny)
  require(crosstalk)
  require(bs4Dash)
  dashboardPage(
    header = dashboardHeader(
      title = dashboardBrand(
        title = "Smart Election",
        color = "primary",
        href = "https://adminlte.io/themes/v3",
        image = "https://adminlte.io/themes/v3/dist/img/AdminLTELogo.png"
      )
    ),
    sidebar = dashboardSidebar(),
    body = dashboardBody(body),
    controlbar = dashboardControlbar(),
    title = "DashboardPage"
  )
}
plotBox=function(plt2, input){
  bs4Dash::box(
    title=input$dropdown,
    plt2
  )
}
Input = function(){
  input = list()
  input$inputCounty = inputCounty()
  input$updatemenu = updatemenu()
  input$dropdown = dropdown()
  input
}
inputCounty <- function(){
  crosstalk::filter_select(
    id="inputCounty",
    label="地區",
    sharedData = share_electionsByYears$`2012`,
    group=~地區
  )
}
updatemenu <- function(){
  list(
    type="buttons",
    buttons=list(button2012, button2016, button2020)
  )
}
dropdown  <- function(id="dropdown"){
  require(htmltools)
  tagList(
    # tags$style(".updatemenu-container{display:none;}"),
    tags$div(class = "btn-group", id="dropdown",
      tags$button(type = "button",
        class = "btn btn-outline-dark text-secondary dropdown-toggle",
        `data-toggle` = "dropdown",
        `aria-haspopup` = "true",
        `aria-expanded` = "false",
        "2012"),
      tags$div(class = "dropdown-menu",
        tags$a(class = "dropdown-item",
          href = "#",
          "2012"),
        tags$a(class = "dropdown-item",
          href = "#",
          "2016"),
        tags$a(class = "dropdown-item",
          href = "#",
          "2020")))) -> tag_element

  tag_element
}
dropdownMenuTag=function(){
  require(htmltools)
  tagList(
    tags$div(class = "btn-group", id="dropdown",
      tags$button(type = "button",
        class = "btn btn-outline-dark text-secondary dropdown-toggle",
        `data-toggle` = "dropdown",
        `aria-haspopup` = "true",
        `aria-expanded` = "false",
        "2012"),
      tags$div(class = "dropdown-menu",
        tags$a(class = "dropdown-item",
          href = "#",
          "2012"),
        tags$a(class = "dropdown-item",
          href = "#",
          "2016"),
        tags$a(class = "dropdown-item",
          href = "#",
          "2020")))) -> tag_element

  tag_element
}

mainpage = function(p){
  simple_bs4_theme <-
    bslib::bs_theme(version = 4)

  require(htmltools)
  mainpage=
    shiny::fluidPage(
      theme=simple_bs4_theme,
      dashboardHeader(),
      dashboardSidebar(),
      dashboardBody(
        bscols(
          widths = 6,
          div(
            style="position:relative",
            p,
            div(
              style="position:absolute;top:48px;left:91px",
              dropdownMenuTag()
            )
          )
        )
      )
    )
  mainpage
}

pltWithUpdateMenus = function(plt){
  plt |> plotly::layout(
    updatemenus=list(
      list(
        type="buttons",
        buttons=list(
          button2012,
          button2016,
          button2020
        )
      )
    )
  )
}
