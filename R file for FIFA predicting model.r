########Loading the required packages
library(MASS)
library(car)
library(caret)
library(ggplot2)
library(cowplot)
library(caTools)
library(e1071)

###Loading the train dataset

fifa_train<- read.csv("Final Train.csv", stringsAsFactors = F);
View(fifa_train);

#Extracting the required average columns in a dataframe for model building
fifa_train_v1 <- fifa_train[ ,c(1, 6,8,10,11,13,15,16,18,20,22,24,26,27,28,29,30,31,32)];
View(fifa_train);

###Creating the Random Forest model

library(randomForest);
set.seed(71);
fifa.rf <- randomForest(Top_4_finish ~ ., data=fifa_train_v1, proximity=FALSE,
                        ntree=1000, mtry=3, do.trace=TRUE, na.action=na.omit);
						
fifa.rf;			

##Loading the Predicting data

fifa_pred<- read.csv("Final Predicting data FIFA.csv", stringsAsFactors = F);			

#Applying the Random Forest Model on the Predicting data
fifaPred_rf <- predict(fifa.rf, newdata=fifa_pred, type = "response");

fifaPred_rf;

fifa_pred$predicted_prod <- fifaPred_rf;

########## Analysis of the Results #################

##Checking the probabilities among the different set of 4 teams from which 1 would qualify for the Semis

teams_for_sf1 <- subset(fifa_pred, fifa_pred$Country == 'Uruguay' |
								   fifa_pred$Country == 'Portugal' |	
								   fifa_pred$Country == 'Argentina' |	
								   fifa_pred$Country == 'France' );
								   
teams_for_sf2 <- subset(fifa_pred, fifa_pred$Country == 'Brazil' |
								   fifa_pred$Country == 'Mexico' |	
								   fifa_pred$Country == 'Belgium' |	
								   fifa_pred$Country == 'Japan' );

teams_for_sf3 <- subset(fifa_pred, fifa_pred$Country == 'Spain' |
								   fifa_pred$Country == 'Russia' |	
								   fifa_pred$Country == 'Croatia' |	
								   fifa_pred$Country == 'Denmark' );

teams_for_sf4 <- subset(fifa_pred, fifa_pred$Country == 'Sweden' |
								   fifa_pred$Country == 'Switzerland' |	
								   fifa_pred$Country == 'Colombia' |	
								   fifa_pred$Country == 'England' );
								   
barplot(teams_for_sf1$predicted_prod, names.arg = teams_for_sf1$Country, main = "Probabilities for reaching Top 4", xlab = "Country", ylab = "Probability");
barplot(teams_for_sf2$predicted_prod, names.arg = teams_for_sf2$Country, main = "Probabilities for reaching Top 4", xlab = "Country", ylab = "Probability");
barplot(teams_for_sf3$predicted_prod, names.arg = teams_for_sf3$Country, main = "Probabilities for reaching Top 4", xlab = "Country", ylab = "Probability");
barplot(teams_for_sf4$predicted_prod, names.arg = teams_for_sf4$Country, main = "Probabilities for reaching Top 4", xlab = "Country", ylab = "Probability");

###############################--------------------------------Results-------------------------------------------------
##Based on the above charts, picking up the team with the highest probility from each set, the Semifinal draw obtained is :

# Uruguay v/s Brazil
# Spain   v/s England

##Comparing the Probabilities of these 2 set of teams separately

teams_for_F1 <- subset(fifa_pred, fifa_pred$Country == 'Uruguay' |
								   fifa_pred$Country == 'Brazil');
								   
teams_for_F2 <- subset(fifa_pred, fifa_pred$Country == 'Spain' |
								   fifa_pred$Country == 'England');
								   
barplot(teams_for_F1$predicted_prod, names.arg = teams_for_F1$Country, main = "Probabilities for reaching Top 4", xlab = "Country", ylab = "Probability");								   
barplot(teams_for_F2$predicted_prod, names.arg = teams_for_F2$Country, main = "Probabilities for reaching Top 4", xlab = "Country", ylab = "Probability");								   
								   
# Final:
#Brazil v/s England

##Comparing the probabilities of the 2 finalists

team_Winner <- subset(fifa_pred, fifa_pred$Country == 'England' |
								   fifa_pred$Country == 'Brazil');
								   
barplot(team_Winner$predicted_prod, names.arg = team_Winner$Country, main = "Probabilities for reaching Top 4", xlab = "Country", ylab = "Probability");									   

### Winner:  Brazil

-----------------------------------------------------#########################################------------------------------------------------------------