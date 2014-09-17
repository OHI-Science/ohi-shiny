app_dir = '~/github/ohi-shiny'
repo = '~/github/ohi-israel'
scenario = 'med2014'
app_name = 'israel-med2014'

setwd(app_dir)
dir.create('data', showWarnings=F)

# copy files from repo/scenario
for (f in list.files(file.path(repo, scenario), recursive=T)){
  
  # get paths
  from = file.path(repo, scenario, f)
  to = file.path('data', f)
  
  # create dir, copy file
  dir.create(dirname(to), showWarnings=F, recursive=T)
  suppressWarnings(file.copy(from, to, overwrite=T, recursive=T, copy.mode=T, copy.date=T))
}

# copying ~/github/ohicore/inst/shiny_app to root folder

# deploy
library(shinyapps)
deployApp(app_dir, app_name)
# publishes to http://ohi-science.shinyapps.io/[app_name]
