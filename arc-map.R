library(leaflet)

reserves <- read.csv("arc-reserves.csv", header = TRUE)

row.names(reserves) <- reserves$slug

html_popup <- function(location){
  # if a grid ref is available, build the html for display
  gridref_link <- if (reserves[location,]$gridref != ""){
    paste0(
      " | <a href=\"https://gridreferencefinder.com/#gr=",
      reserves[location,]$gridref,
      "\">GridReferenceFinder</a>"
    )
  } else {
    ""
  }
  
  # Assemble the HTML for the marker popup
  paste0(
    "<strong><a href=\"https://www.arc-trust.org/",
    reserves[location,]$slug, 
    "\">",
    reserves[location,]$name,
    "</a></strong><br>Access: ",
    reserves[location,]$access,
    "<br><a href=\"https://www.google.co.uk/maps/@",
    reserves[location,]$lat, ",",
    reserves[location,]$lng, 
    ",14z\">Google Maps</a>",
    gridref_link
  )
}

lat <- function(location){
  reserves[location,]$lat
}
lng <- function(location){
  reserves[location,]$lng
}

map <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lat=lat("blackheath"), lng=lng("blackheath"), 
             popup=html_popup("blackheath")) %>%
  addMarkers(lat=lat("broxhead-common"), lng=lng("broxhead-common"), 
             popup=html_popup("broxhead-common")) %>%
  addMarkers(lat=lat("canford-cliffs"), lng=lng("canford-cliffs"), 
             popup=html_popup("canford-cliffs")) %>%
  addMarkers(lat=lat("chatley-heath"), lng=lng("chatley-heath"), 
             popup=html_popup("chatley-heath")) %>%
  addMarkers(lat=lat("churt-valley-and-plateau"), lng=lng("churt-valley-and-plateau"), 
             popup=html_popup("churt-valley-and-plateau")) %>%
  addMarkers(lat=lat("clouds-hill"), lng=lng("clouds-hill"), 
             popup=html_popup("clouds-hill")) %>%
  addMarkers(lat=lat("corfe-bluff"), lng=lng("corfe-bluff"), 
             popup=html_popup("corfe-bluff")) %>%
  addMarkers(lat=lat("corfe-hills-east"), lng=lng("corfe-hills-east"), 
             popup=html_popup("corfe-hills-east")) %>%
  addMarkers(lat=lat("cranes-moor-bog"), lng=lng("cranes-moor-bog"), 
             popup=html_popup("cranes-moor-bog")) %>%
  addMarkers(lat=lat("creech-heath"), lng=lng("creech-heath"), 
             popup=html_popup("creech-heath")) %>%
  addMarkers(lat=lat("crooksbury-common"), lng=lng("crooksbury-common"), 
             popup=html_popup("crooksbury-common")) %>%
  addMarkers(lat=lat("dunyeats"), lng=lng("dunyeats"), 
             popup=html_popup("dunyeats")) %>%
  addMarkers(lat=lat("east-gore"), lng=lng("east-gore"), 
             popup=html_popup("east-gore")) %>%
  addMarkers(lat=lat("east-holme"), lng=lng("east-holme"), 
             popup=html_popup("east-holme")) %>%
  addMarkers(lat=lat("east-ramsdown"), lng=lng("east-ramsdown"), 
             popup=html_popup("east-ramsdown")) %>%
  addMarkers(lat=lat("east-weavers-down"), lng=lng("east-weavers-down"), 
             popup=html_popup("east-weavers-down")) %>%
  addMarkers(lat=lat("east-worgret"), lng=lng("east-worgret"), 
             popup=html_popup("east-worgret")) %>%
  addMarkers(lat=lat("gong-hill"), lng=lng("gong-hill"), 
             popup=html_popup("gong-hill")) %>%
  addMarkers(lat=lat("great-ovens"), lng=lng("great-ovens"), 
             popup=html_popup("great-ovens")) %>%
  addMarkers(lat=lat("green-pool"), lng=lng("green-pool"), 
             popup=html_popup("green-pool")) %>%
  addMarkers(lat=lat("hankley-common"), lng=lng("hankley-common"), 
             popup=html_popup("hankley-common")) %>%
  addMarkers(lat=lat("hankley-gomez"), lng=lng("hankley-gomez"), 
             popup=html_popup("hankley-gomez")) %>%
  addMarkers(lat=lat("holme-mount"), lng=lng("holme-mount"), 
             popup=html_popup("holme-mount")) %>%
  addMarkers(lat=lat("hurtwood"), lng=lng("hurtwood"), 
             popup=html_popup("hurtwood")) %>%
  addMarkers(lat=lat("lions-hill"), lng=lng("lions-hill"), 
             popup=html_popup("lions-hill")) %>%
  addMarkers(lat=lat("lychett-heath"), lng=lng("lychett-heath"), 
             popup=html_popup("lychett-heath")) %>%
  addMarkers(lat=lat("mapperton-ponds"), lng=lng("mapperton-ponds"), 
             popup=html_popup("mapperton-ponds")) %>%
  addMarkers(lat=lat("matchams-slope"), lng=lng("matchams-slope"), 
             popup=html_popup("matchams-slope")) %>%
  addMarkers(lat=lat("norden"), lng=lng("norden"), 
             popup=html_popup("norden")) %>%
  addMarkers(lat=lat("palmers-ball"), lng=lng("palmers-ball"), 
             popup=html_popup("palmers-ball")) %>%
  addMarkers(lat=lat("parley-common"), lng=lng("parley-common"), 
             popup=html_popup("parley-common")) %>%
  addMarkers(lat=lat("south-west-hyde"), lng=lng("south-west-hyde"), 
             popup=html_popup("south-west-hyde")) %>%
  addMarkers(lat=lat("stony-jump"), lng=lng("stony-jump"), 
             popup=html_popup("stony-jump")) %>%
  addMarkers(lat=lat("sunningdale"), lng=lng("sunningdale"), 
             popup=html_popup("sunningdale")) %>%
  addMarkers(lat=lat("town-common"), lng=lng("town-common"), 
             popup=html_popup("town-common")) %>%
  addMarkers(lat=lat("trigon-east"), lng=lng("trigon-east"), 
             popup=html_popup("trigon-east")) %>%
  addMarkers(lat=lat("vitower"), lng=lng("vitower"), 
             popup=html_popup("vitower")) %>%
  addMarkers(lat=lat("west-weavers-down"), lng=lng("west-weavers-down"), 
             popup=html_popup("west-weavers-down")) %>%
  addMarkers(lat=lat("witley-common"), lng=lng("witley-common"), 
             popup=html_popup("witley-common")) %>%
  addMarkers(lat=lat("woolmer-forest"), lng=lng("woolmer-forest"), 
             popup=html_popup("woolmer-forest")) %>%
  addMarkers(lat=lat("ham-arc"), lng=lng("ham-arc"), 
             popup=html_popup("ham-arc"))

map  # Print the map

# Dimention of the map
# map$width <- 1024
# map$height <- 768


# Export as HTML file
library(htmlwidgets)
saveWidget(map, 'arc-reserves.html', selfcontained = TRUE)
