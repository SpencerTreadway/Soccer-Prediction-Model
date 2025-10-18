setwd('C:\\Users\\spenc\\Coding Projects\\Python\\Soccer Prediction')
dataset <- read.csv('dataset.csv', stringsAsFactors = TRUE)

df <- dataset[c('home_buildUpPlaySpeed',
                'home_buildUpPlaySpeedClass',
                'home_buildUpPlayDribbling',
                'home_buildUpPlayDribblingClass',
                'home_buildUpPlayPassing',
                'home_buildUpPlayPassingClass',
                'home_buildUpPlayPositioningClass',
                'home_chanceCreationPassing',
                'home_chanceCreationPassingClass',
                'home_chanceCreationCrossing',
                'home_chanceCreationCrossingClass',
                'home_chanceCreationShooting',
                'home_chanceCreationShootingClass',
                'home_chanceCreationPositioningClass',
                'home_defencePressure',
                'home_defencePressureClass',
                'home_defenceAggression',
                'home_defenceAggressionClass',
                'home_defenceTeamWidth',
                'home_defenceTeamWidthClass',
                'home_defenceDefenderLineClass',
                'away_buildUpPlaySpeed',
                'away_buildUpPlaySpeedClass',
                'away_buildUpPlayDribbling',
                'away_buildUpPlayDribblingClass',
                'away_buildUpPlayPassing',
                'away_buildUpPlayPassingClass',
                'away_buildUpPlayPositioningClass',
                'away_chanceCreationPassing',
                'away_chanceCreationPassingClass',
                'away_chanceCreationCrossing',
                'away_chanceCreationCrossingClass',
                'away_chanceCreationShooting',
                'away_chanceCreationShootingClass',
                'away_chanceCreationPositioningClass',
                'away_defencePressure',
                'away_defencePressureClass',
                'away_defenceAggression',
                'away_defenceAggressionClass',
                'away_defenceTeamWidth',
                'away_defenceTeamWidthClass',
                'away_defenceDefenderLineClass',
                'result')]

mask <- sapply(df, class) == "factor"

for (name in colnames(df[mask])){
  if (name != 'result') {
  col_factor <- df[[name]]
  levels(col_factor) <- 0:(length(levels(col_factor)) - 1)
  col_factor <- as.integer(col_factor) - 1
  col_factor[col_factor == 0] <- NA
  df[[name]] <- col_factor
  }
}

write.csv(df, 'factored_dataset.csv')