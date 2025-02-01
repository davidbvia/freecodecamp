#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE teams, games")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
	# Take the values winner and opponent
	# Search in the teams table if we have the winner name
	WINNER_IF=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
	if [[ $WINNER != "winner" ]]
	then
		if [[ -z $WINNER_IF ]]
		then
			echo $($PSQL "INSERT INTO teams (name) VALUES ('$WINNER')")
		fi
	fi

	# Search in the teams table if we have the opponent name
	OPPONENT_IF=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
	
	if [[ $OPPONENT != "opponent" ]]
	then
		if [[ -z $OPPONENT_IF ]]
		then
			echo $($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT')")
		fi
	fi
	
	# Obtain the id
	WIN_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
	OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

	INSERT_LINE=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)
	VALUES ($YEAR, '$ROUND', $WIN_ID, $OPP_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
	
	if [[ $INSERT_LINE == 'INSERT 0 1' ]]
	then
		echo Entering data...
    fi
done