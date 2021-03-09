# Here we will perfrom simple data analysis and exploration.
library(tidyverse)
library(ggrepel)

load('./data/nfl19_20.Rdata')
load('./data/prem19_20.Rdata')

## Premier League
premGFmean = mean(prem19_20$GF)
premGFvar = var(prem19_20$GF)

premGAmean = mean(prem19_20$GA)
premGAvar = var(prem19_20$GA)

premScores = prem19_20%>%
  mutate('Attack'=(GF-premGFmean)/sqrt(premGFvar), 'Defence'= -1*(GA-premGAmean)/sqrt(premGAvar),'League'='Premier League')%>%
  select(Team, Attack, Defence, League)

ggplot(premScores, mapping=aes(x=Defence, y=Attack))+
         geom_point(aes(col=Team))+
         geom_text_repel(aes(label=Team, col=Team))+
         theme(legend.position='none')

## Try MAD rescaling instead of standard
premGFmed = median(prem19_20$GF)
premGFmad = mad(prem19_20$GF)

premGAmed = median(prem19_20$GA)
premGAmad = mad(prem19_20$GA)

premScoresMad = prem19_20%>%
  mutate('Attack'=(GF-premGFmed)/premGFmad, 'Defence'= -1*(GA-premGAmed)/premGAmad)

ggplot(premScoresMad, mapping=aes(x=Defence, y=Attack))+
         geom_point(aes(col=Team))+
         geom_text_repel(aes(label=Team, col=Team))+
         theme(legend.position='none')

# NFL
nflPFmean = mean(nfl19_20$PF)
nflPFvar = var(nfl19_20$PF)

nflPAmean = mean(nfl19_20$PA)
nflPAvar = var(nfl19_20$PA)

nflScores = nfl19_20%>%
  mutate('Attack'=(PF-nflPFmean)/sqrt(nflPFvar), 'Defence'= -1*(PA-nflPAmean)/sqrt(nflPAvar), 'League'='NFL')%>%
  select(Team, Attack, Defence, League)

ggplot(nflScores, mapping=aes(x=Defence, y=Attack))+
         geom_point(aes(col=Team))+
         geom_text_repel(aes(label=Team, col=Team))+
         theme(legend.position='none')

# Combine
Scores = bind_rows(nflScores, premScores)
save(Scores, file='./data/scores.Rdata')
ggplot(Scores, mapping=aes(x=Defence, y=Attack))+
  geom_point(aes(col=League))+
  geom_text_repel(aes(label=Team, col=League))+
  theme(legend.position='none')
