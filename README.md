Shiny-jQuery-mobile Dashboard
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
       </html>
```

* First line says that the app is written in HTML5. 
* Critical part when building this app is the declaration of different libraries. Don't worry, you just need to copy-paste the code then put the appropriate libraries in their respective directories (c ss,js).
* You have to pay attention to these directories when copying files. Notice that when a library is in ```shared``` folder, that means It comes with the shiny package installation then you don't need to change it.

First, go to jQuery mobile website then download ```jquery.mobile-1.4.2.min.css``` and ```jquery.mobile-1.4.2.min.js```
You will also need to install the latest version of rCharts from GitHub then search for ```highcharts.js```, ```highcharts-more.js``` and ```exporting.js``` inside your package installation. 
`
## Embedding an rCharts object in HTML:

Just declare a ```div``` tag with the specified ```class``` in the ```body``` tag of your html:
```html
<div id="your id here" class="shiny-html-output rChart highcharts"></div>
```
Note that you may change ```highcharts``` by the name of your favorite JavaScript Charting library available from rCharts. 
On server (server.R) side, you have to write something like:

```r
output$'your id here' = renderChart ({
#Your R code that produce the chart here
# ...
})
```






