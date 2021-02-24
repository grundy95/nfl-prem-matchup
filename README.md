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

