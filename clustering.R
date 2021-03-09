library(tidyverse)
library(ggrepel)

load('./data/scores.Rdata')
clusters = kmeans(Scores[,2:3], 10)
ScoresClustered = mutate(Scores, 'Cluster'= as.character(clusters$cluster))
ggplot(ScoresClustered, mapping=aes(x=Defence, y=Attack))+
  geom_point(aes(col=Cluster))+
  geom_text_repel(aes(label=Team, col=League))#+
  #theme(legend.position='none')

wss = c()
for(i in 1:20){
  wss[i] = kmeans(Scores[,2:3],i)$tot.withinss
}
plot(1:20,wss)
clusters

# Choosing Clusters based on League membership
k = 1
stop = FALSE
while(stop==FALSE){
  clusters = kmeans(Scores[,2:3], k)
  ScoresClustered = mutate(Scores, 'Cluster'= as.character(clusters$cluster))
  for(i in 1:k){
    tib = filter(ScoresClustered, Cluster==as.character(i))
    if(length(unique(tib$League))==1){
      stop==TRUE
    }
  }
  if(stop==FALSE){
    k = k+1
  }
}
    
  
