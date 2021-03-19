library(tidyverse)
load('./data/prem19_20.Rdata')
load('./data/nfl19_20.Rdata')

premScores = prem19_20%>%
  mutate('Attack'=scale(GF), 'Defence'=-1*scale(GA),
         'League'='Premier League')%>%
  select(Team, Attack, Defence, League)


nflScores = nfl19_20%>%
  mutate('Attack'=scale(GF), 'Defence'= -1*scale(GA),
         'League'='NFL')%>%
  select(Team, Attack, Defence, League)

scores = bind_rows(nflScores, premScores)
save(scores, file='./data/scores.Rdata')


