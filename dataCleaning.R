library(tidyverse)

# Premier League 19/20 season. 
prem = read_csv('data/prem19_20.csv')%>%
  select(HomeTeam, AwayTeam, FTHG, FTAG)%>%
  group_by(HomeTeam)%>%
  mutate('HomeGoals'=sum(FTHG), 'HomeConceeded'=sum(FTAG))%>%
  ungroup()%>%
  group_by(AwayTeam)%>%
  mutate('AwayGoals'=sum(FTAG), 'AwayConceeded'=sum(FTHG))%>%
  ungroup()
premHome = select(prem, HomeTeam, HomeGoals, HomeConceeded)%>%
  unique()%>%
  rename('Team'=HomeTeam)%>%
  arrange(Team)
  
premAway = select(prem, AwayTeam, AwayGoals, AwayConceeded)%>%
  unique()%>%
  rename('Team'=AwayTeam)%>%
  arrange(Team)

prem19_20 = right_join(premHome, premAway, by=c('Team'='Team'))%>%
  mutate('GF'=HomeGoals+AwayGoals, 'GA'=HomeConceeded+AwayConceeded)%>%
  select(Team, GF, GA)

save(prem19_20, premHome, premAway, file='./data/prem19_20.Rdata')                       

# NFL multiple seasons 
nfl19_20 = read_csv("data/nfl.csv")%>%
  select(season, team, scored, allowed)%>%
  filter(season==2019)%>%
  select(-season)%>%
  rename('Team'=team, 'PF'=scored, 'PA'=allowed)
save(nfl19_20, file='./data/nfl19_20.Rdata')
