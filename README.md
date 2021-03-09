# Choosing an NFL team based upon Stats
Ever wondered which NFL team to support based upon your favourite Premier League team? This project analyzes Premier League and NFL teams and aims to match/group them based upon their respective strengths.

By looking at the number of goals/points scored and conceeded by each time we can assign them a offensive and defensive score. These can be standarized so that we can then compare the Premier League and NFL teams. Based upon these scores we can then utilize clustering to group the teams and see which Premier League and NFL tems are most similar.

Until version 1.0 this project will be private and the README.md file used as a project plan

#Plan
## Data Scraping
Need to find a way of getting the number of goals/points scored and conceeded by each team. This will be easy for the Premier League and should be fairly simple for the NFL.

* Which season or seasons should we look at?
* Do we spend much time on the data scraping or save this for a different project? Might be better for python based project.

## Attacking and Defensive Scores
What is the best way to get an attacking and defensive score for all the teams? Need to look at both leagues seperately first and check that there is enough variation in the teams to make things interessting. Then need to check that the standarizations make the teams from the leagues comparable. Finally, need a nice way to plot these.

Initial plan is to take the number of goals scored and minus the average number of goals scored across all teams in the league and divide through by the standard deviation of the number of goals in the league. This should give us standardized score that are comparable across the leagues (replace goals with points for NFL).

* Are we just going to get a linear relationship with good teams in division having high attacking and defensive numbers and poor teams the opposite?
    + If so we may need to do some scaling in order to get more distinction.

* Is there some way we could factor in league position to help scale the attacking and defensive scores so a successful highly defensive team will have a similar score to a poor highly defensive team?

## Cluserting
This part can be as complex or as simple as we would like. If want to get it finished we could apply some very basic clustering techniques (k-means) or we could spend some time investigating this to get a better clustering algorithm.

* How many clusters will be needed - this should be data but also story driven.
* How appropairate would the most basic clustering be ie cluster the teams into the four quadrants of the attacking and defensive scores?
    + This should fail due disinction between sucesful and poor teams.

## Write-up
Write up our findings (so far) into a nice blog post. Lots of pretty graphs!!! 

# Project log
## Premier League Data Gathering & Cleaning
Downloaded a dataset from <https://www.football-data.co.uk/englandm.php> for the Premier League 19/20 season. Choose the 19/20 season as current season has not yet finished and wanted the most upto date data to make the anlaysis relevent. Will the COVID pandemic have an effect on this - I don't think it will and that is not the purpose of the modelling. Only choosing one season as relegation and promotion makes it difficult to compare over multiple seasons.

Cleaned the data so we are left with a tibble containg each team and the goals scored and conceeded. Might have been able to find this data online without any cleaning required but if want to do any further analysis this raw data has everything I could need. Additionally, created tibble for Home and Away goals for and against in case we want to use that later on.

## NFL Data Gathering & Cleaning 
Downloaded data from <https://github.com/leesharpe/nfldata> and accessed the standings.csv. This has the season stats for each team for multiple seasons. As the NFL has no relegation and promotion this makes it easier to compare over multiple seasons. Additonally, there are less games in NFL regular season (we don't include playoffs in analysis as not all teams compete and bias in terms of opposititon strengths) so maybe using multiple years will be beneficial. For now lets just use the 19/20 season so we match with the Premier League season. This should be easy to alter at a later date to compare findings.

This data set was much easier to clean as contained the standings rather than the all the individual games. Hence, just needed to filter for the appropriate columns; points scored and points against.

## Data Exploration
By rescaling the goals/points scored and conceeded by all the teams in each league this then gives us an attacking and defensive strength of all the teams relative to the others in there division. Obvious problem is that in the Premier LEague we simply get the best teams having a high attack and defense while the lower teams get a bad attack and defense. Some more intressting cases such as Wolves and Sheffield United who are good defensively but not so great offensivley. In the NFL this is less of an issue and there are some more spread out attack and defensive qualities. This is likely due to the completely seperate offensive and defensive units. 

We will probably need to do something more complex to give the teams an attacking and defensive strength that is independent of their position in the league. For now lets just stick with this and see what clustering we can come up with.

## Clustering
Applying simple k-means clustering can yield adequate results for a simple clustering task like this. The issue becomes the choice of the number of clusters. For this project I feel the choice of clusters can be choosen purely subjectively in order to tell the best story. Looking at the elbow plot of the total within-cluster sum of squares we would probably choose 4 or 5 clusters. However, this doesn't give a great story, we basically get all the good teams grouped, all the poor teams grouped and then the middle teams split between those with a better attack than defense and those with a better defense than attack. Not overly intressting! Yet if we get upto 10 clusters we can then group teams and give them a better category and story. Ie for 10 clusters we get Miami and Norwhich grouped together on there own as the really poor teams. We get TB, SEA and Chelsea as great attacking but poor defensive teams. 

A more intressting subjective choice for the number of clusters would be the maximum where we get at least one team from each League in each cluster. Need to finish this off and choose a seed as obviously k-means converges to different solutions!

