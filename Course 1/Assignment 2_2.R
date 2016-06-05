library(networkD3)
library(igraph)
word <- read.graph("adjnoun.gml", format="gml")
str(word)

V(word)$belonging[V(word)$value == 0] = "Adjectives"
V(word)$belonging[V(word)$value == 1] = "Nouns"

wordVertices = as_data_frame(word, what = "vertices")
wordEdges = as_data_frame(word, what = "edges")
wordEdges$source = wordEdges$from -1 
wordEdges$target = wordEdges$to -1 
for (i in 1:112){
  if(length(which(wordEdges$source == i-1))==0){
    wordVertices$size[i] = length(which(wordEdges$target == i-1))
  }else{
    wordVertices$size[i] = length(which(wordEdges$source == i-1))
  }
}
forceNetwork(Links = wordEdges, Nodes = wordVertices, Source = "source", Target = "target", NodeID = "label", 
             Group = "belonging",height = 900, width = 1200, fontSize = 50, linkDistance = 100, charge = -900,
             opacity = 4, zoom = TRUE, legend = TRUE,colourScale = JS("d3.scale.category10()"),
             radiusCalculation = JS(" d.nodesize/2+4"),Nodesize = "size")

for (i in 1:112){
  if(length(which(wordEdges$source == i-1))==0){
    wordVertices$size[i] = length(which(wordEdges$target == i-1))
  }else{
    wordVertices$size[i] = length(which(wordEdges$source == i-1))
  }
}

