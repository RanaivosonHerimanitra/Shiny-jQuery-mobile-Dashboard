# setwd('D:/INSTAT 2/TRAVAIL DE PONDERATION COMPTANAT/presentation')
# packages needed for this app to work:
library(shiny)
require(rCharts)
# data used to illustrate charts
# USArrests from base package shows crimes in U.S that
# lead to arrests
# iris dataset illustrates different Species with their characteristics
# sepal, petal (length and width)
data(USArrests)
data(iris)
data(EuStockMarkets)

shinyServer(function(input, output) {
  # reactive dataset that returns a distribution specified by user
  # default paramters are assumed
  data <- reactive({
    dist <- switch(input$dist,
                   norm = rnorm,
                   unif = runif,
                   lnorm = rlnorm,
                   exp = rexp,
                   cauch=rcauchy
                   )
    
    dist(input$n)
    
    
  })
  # return a pie chart using rCharts package and highcharts.js library
  output$piechart <- renderChart({
    x=unique(as.character(iris$Species))
    y=as.numeric(table(iris$Species))
    a <- Highcharts$new()
    a$title(text = "Number of Species in Iris dataset")
    a$data(type='pie',x=x,y=y  )
    a
    a$addParams(dom = 'piechart')
    return(a)
  })
  # return a scatter plot when input$iris_variable on
  # x-axis and input$iris_variable on y-axis are specified by user
  output$plotiris = renderChart ({
    a <- Highcharts$new()
    a$chart(type="scatter")
    a$title(text = paste(input$iris_variable,"vs" ,input$iris_variable2,sep=" "))
    a$xAxis(title=list(enabled=TRUE,text=input$iris_variable))
    a$yAxis(title=list(enabled=TRUE,text=input$iris_variable2))
    a$data(color= 'rgba(223, 83, 83,.5)',name=input$iris_variable, x= iris[,input$iris_variable],
             y=iris[,input$iris_variable2])    
    a$addParams(dom = 'plotiris')
    a
  })
  # Summary of iris dataset:
  output$summary_iris = renderPrint ({
    summary(iris)
  })
  # Summary of the distribution specified by user:
  output$summary <- renderPrint({
    summary(data())
  })
  # Summary of USArrests dataset:
  output$summaryOfData <- renderPrint({
    summary(USArrests)
  })
  
  # Histogram of the distribution specified by user
  # using rCharts :
  output$idmyplot <- renderChart ({
    tmp= as.data.frame(table(round(data(),1)))
    colnames(tmp)=c('value','Freq')
    a <- Highcharts$new()
    a$chart(type = "column")
    a$title(text = "Distribution")
    a$yAxis(title=list(text='Frequency'))
    a$xAxis(title=list(text='generated values') ,categories = tmp$value )
    a$data(name="generated numbers", tmp$Freq ) 
    a$addParams(dom = 'idmyplot')
    a
    
  })
 
  # summary of USArrests dataset after scaling
   output$summarypca= renderPrint ({
     scaled_data=prcomp(USArrests,scale=TRUE)
     summary(scaled_data)
  })
  
  # proximity among observations and correlation between variables
  # using biplot function
  output$idpca = renderPlot ({
    biplot(prcomp(USArrests,scale=TRUE),scale=0)
  })
  # DataTable representation of iris dataset:
#   output$tab_iris=renderChart2 ({
#     dTable(iris)
#   })
   output$tab_iris = renderDataTable ({
     iris
   })
  # skeleton of the html user interface 
  output$html_skeleton = renderText ({
    print('<!DOCTYPE html>
        <html lang="en">
              <head>
                 <meta charset="UTF-8">
                    <title>Presentation</title>
                        <meta name="viewport" content="width=device-width, 
                              initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
                              <link href="shared/bootstrap/css/bootstrap.min.css"/>
                              <link href="css/jquery.mobile-1.4.2.min.css"/>
                              <script src="shared/jquery.js" ></script>
                              <script src="js/jquery.mobile-1.4.2.min.js"> 
                              </script> 
                              <script src="shared/shiny.js"></script>
                              <script src="js/script_quest.js"></script>
                              <script src="shared/datatables/js/jquery.dataTables.min.js">
                              </script>
                              <script src="shared/datatables/js/DT_bootstrap.js">
                              </script>
                              <link href="shared/datatables/css/DT_bootstrap.css"/>
                              <script src="shared/bootstrap/js/bootstrap.min.js">
                              </script> 
                              <script src="js/highcharts.js"></script>
                              <script src="js/highcharts-more.js"></script>
                              <script src="js/exporting.js"></script>
                              <link href="shared/shiny.css" rel="stylesheet" /> 
                              <link href="css/mycss.css" rel="stylesheet" > 
            </head>
    <body>
      ...
    </body>
    ')
  })
  # div tag of the histogram generated using rCharts
  output$mydiv = renderText ({
    print('<div id="idmyplot" class="shiny-html-output rChart highcharts"></div>')
  })
  # on the ui side when embedding datatable representation of iris dataset
  output$mydatatable = renderText ({
    print('<div id="your id here" class="shiny-datatable-output"></div>')
  })
  # what's going on server side when embedding a datatable in html
  output$mydatatable_serverside = renderText ({
    print("output$'your id here' <- renderDataTable({
        iris
      })")
  })
  # Summary of Daily Closing Prices of Major European Stock Indices:
  # EuStockMarkets
  output$eustock = renderPrint ({
    
    tmp=data.frame(EuStockMarkets)
    summary(tmp)
  }) 
  #
  output$multiline_eustock <- renderChart ({
    tmp=data.frame(EuStockMarkets)
    a <- Highcharts$new()
    a$chart(type='line')
    a$title(text = "04 E.U Stock indices")
    a$xAxis(title=list(text="Day") )
    a$series(name=names(tmp)[1], data= tmp[,1] )
    a$series(name=names(tmp)[2], data= tmp[,2] ) 
    a$series(name=names(tmp)[3], data= tmp[,3] )
    a$series(name=names(tmp)[4], data= tmp[,4] )
    a$addParams(dom = 'multiline_eustock')
    a
  })
})
