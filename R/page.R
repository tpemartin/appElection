page_index= function(){
  input=Input()
  plt2 |> plotly::layout(
    updatemenus=list(
      input$updatemenu
    )
  ) -> plt3
  plt3 |> htmlwidgets::onRender("function(e){
    widget=e}
    ")

  plt3 |> plotBox(input=input) |> ui() |> attachAppDep()
}
