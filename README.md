ShinyjQueryMobilePresentation
=============================
This is the source code of a dashboard presentation based on jQuery Mobile framework, Shiny and rCharts packages from R.

# Overview:
This application is born from my needs to write an highly customized user interface. 
Guides to write your UI in pure HTML can be found on [Shiny website](http://shiny.rstudio.com/articles/html-ui.html).

It uses:
* [jQuery mobile](https://github.com/jquery/jquery-mobile) as it is very easy and responsive.
* Shiny
* and [rCharts](https://github.com/ramnathv/rCharts) my favorite R package for visualization.

## Skeleton of your HTML UI:

The presentation teaches you how to integrate all tools that compose a typical dashboard a la Shiny. Your first task is to create an html file from an empty text file by changing its extension then load and edit it into rstudio. Skeleton of your html user interface must look like this: 

```html
<!DOCTYPE html>
        <html lang="en">
              <head>
                 <meta charset="UTF-8">
                    <title>Presentation</title>
                        <meta name="viewport" content="width=device-width, 
                              initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
                              <link href="shared/bootstrap/css/bootstrap.min.css"/>
                              <link href="css/jquery.mobile-1.4.2.min.css"/>
                              <script src="shared/jquery.js" ></script>
                              <script src="js/jquery.mobile-1.4.2.min.js"></script> 
                              <script src="shared/shiny.js"></script>
                              <script src="js/script_quest.js"></script>
                              <script src="shared/datatables/js/jquery.dataTables.min.js"></script>
                              <script src="shared/datatables/js/DT_bootstrap.js"></script>
                              <link href="shared/datatables/css/DT_bootstrap.css"/>
                              <script src="shared/bootstrap/js/bootstrap.min.js"></script> 
                              <script src="js/highcharts.js"></script>
                              <script src="js/highcharts-more.js"></script>
                              <script src="js/exporting.js"></script>
                              <link href="shared/shiny.css" rel="stylesheet"/> 
            </head>
    <body>
      Your content here
    </body>
```




