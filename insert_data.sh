#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
CSV_FILE="games.csv"
# Loop para ler cada linha do arquivo CSV
while IFS=',' read -r year round winner opponent winner_goals opponent_goals
 
do
    # Processar as colunas conforme necessário
    winner_name=$($PSQL "SELECT name FROM teams WHERE name = '$winner'")
    if [[ -z $header ]]; then
        header=true
        continue
    fi
    if [[ -z $winner_name ]]
    then
      echo "Não encontrei"
      INSERT_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$winner')")
      echo $INSERT_WINNER
    fi

    echo "Round: $round"
    echo "Winner: $winner"
    




    opponent_name=$($PSQL "SELECT name FROM teams WHERE name = '$opponent'")
    if [[ -z $header ]]; then
        header=true
        continue
    fi
    if [[ -z $opponent_name ]]
    then
      echo "Não encontrei"
      INSERT_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$opponent')")
      echo $INSERT_OPPONENT
    fi

    echo "Round: $round"
    echo "Opponenet: $opponent"

    winner_id=$($PSQL "SELECT team_id FROM teams WHERE name = '$winner'")
    opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name = '$opponent'")
    INSERT_INTO_GAMES=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$year','$round','$winner_id','$opponent_id', '$winner_goals','$opponent_goals')")










done < games.csv




    
    # Outras operações com as colunas...