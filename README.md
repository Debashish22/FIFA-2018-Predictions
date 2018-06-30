# FIFA-Challenge-2018
Contains the datasets, code for FIFA 2018 predictions

Predictions:
SF1: Brazil v/s Uruguay
SF2: Spain vs England
Final: Brazil v/s England
Winner Brazil

List of variables decided for the prediction model:

Saves_per_game
Goals_conceded_per_game
Goals_per_game
Shots_per_game
Shot_on_target_per_game
Shots_on_target_per_shot
Fouls_per_game
Fouls_suffered_per_game
Avg_substitution_per_game
Average_half_time_goals
Avg_red_card_per_game
Average_yellow_card_per_game
#_Top_4_finish (till the previous edition for the edition considered in case of past data used for training)
#_Top_2_finish (till the previous edition for the edition considered in case of past data used for training)
#_Winner (till the previous edition for the edition considered in case of past data used for training)
Points_after_group_stage (after 3  matches of the current ongoing edition)

Modelling Steps:
1. After the variables impacting the result were selected, data for each of these variables were obtained from different sources
2. The data was obtained from the FIFA and espn site (sample link for 1 country from the espn site provided in the next site)
3. As the data here was at the player level, the result had to be aggregated  to the country level eg: adding the goals, shots, saves, fouls by each player to get the total for the team. 
4. To verify the correctness of the data, they were tallied from the FIFA site and in case of data not available in the ESPN site, it was searched for in the FIFA site
5. The training data for building the model was based on the past World cup records –2014, 2010, 2006, 2002. Details for the editions before these were  not available in these sites
6. The model created for Random Forest as it does in-sample testing which is helpful in case of samples with lesser records
7. The model was tested on the stats of the team for 1st 3 league stage games and the international friendlies held before the WC, as it provided the most recent trend
8. Based on the probabilities provided by the model and the draws of the next rounds, the winner and semi-finalists were predicted


Sources 
ESPN - http://www.espn.in/football/team/squad/_/id/205?src=com
FIFA - https://www.google.co.in/search?q=FIFA&oq=FIFA&aqs=chrome..69i57j69i60l3j69i59l2.896j0j4&sourceid=chrome&ie=UTF-8#sie=lg;/m/06qjc4;2;/m/030q7;mt;fp;1


