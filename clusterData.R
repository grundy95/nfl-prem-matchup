library(tidyverse)
load('./data/scores.Rdata')

numberClusters = function(scores, seed=1234){
  k = 1
  stop = FALSE
  while(stop==FALSE){
    set.seed(seed)
    clusters = kmeans(scores[,2:3], k)
    scoresClustered = mutate(scores, 'Cluster'= as.factor(clusters$cluster))
    for(i in 1:k){
      tib = filter(scoresClustered, Cluster==as.character(i))
      if(length(unique(tib$League))==1){
        stop = TRUE
      }
    }
    if(stop==FALSE){
      k = k+1
    }
  }
  return(k-1)
}

numCluster = c()
for(seed in 1:1000){
  numCluster[seed] = numberClusters(scores, seed=seed)
}
seed = which.max(numCluster)
k = max(numCluster)
set.seed(seed)
clusters = kmeans(scores[,2:3], k)

scoresClustered = mutate(scores, 'Cluster'=as.factor(clusters$cluster))%>%
  arrange(Cluster)
save(scoresClustered, file='./data/scoresClustered.Rdata')