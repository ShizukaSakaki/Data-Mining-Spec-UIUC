library(networkD3)
library(igraph)
football <- read.graph("football.gml", format="gml")
V(football)$belonging[V(football)$value == 0] = "Atlantic Coast"
V(football)$belonging[V(football)$value == 1] = "Big East"
V(football)$belonging[V(football)$value == 2] = "Big Ten"
V(football)$belonging[V(football)$value == 3] = "Big Twelve"
V(football)$belonging[V(football)$value == 4] = "Conference USA"
V(football)$belonging[V(football)$value == 5] = "Independents"
V(football)$belonging[V(football)$value == 6] = "Mid-American"
V(football)$belonging[V(football)$value == 7] = "Mountain West"
V(football)$belonging[V(football)$value == 8] = "Pacific Ten"
V(football)$belonging[V(football)$value == 9] = "Southeastern"
V(football)$belonging[V(football)$value == 10] = "Sun Belt"
V(football)$belonging[V(football)$value == 11] = "Western Athletic"
fbVertices = as_data_frame(football, what = "vertices")
fbEdges = as_data_frame(football, what = "edges")
fbEdges$source = fbEdges$from -1 
fbEdges$target = fbEdges$to -1 
forceNetwork(Links = fbEdges, Nodes = fbVertices, Source = "source", Target = "target", NodeID = "label", 
             Group = "belonging",height = 900, width = 1200, fontSize = 20, linkDistance = 50, charge = -400,
             opacity = 4, zoom = TRUE, legend = TRUE)
