football <- read.graph("football.gml", format="gml")
conf = c("Atlantic Coast", "Big East", "Big Ten", "Big Twelve", "Conference USA", 
         "Independents", "Mid-American", "Mountain West","Pacific Ten", 
         "Southeastern", "Sun Belt", "Western Athletic")
V(football)$belonging = conf[V(football)$value + 1]
fbVertices = as_data_frame(football, what = "vertices")
fbEdges = as_data_frame(football, what = "edges")
fbEdges$source = fbEdges$from -1 
fbEdges$target = fbEdges$to -1 
forceNetwork(Links = fbEdges, Nodes = fbVertices, Source = "source", Target = "target", NodeID = "label", 
             Group = "belonging",height = 900, width = 1200, fontSize = 20, linkDistance = 50, charge = -400,
             opacity = 4, zoom = TRUE, legend = TRUE)
