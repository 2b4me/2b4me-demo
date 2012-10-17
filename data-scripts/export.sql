\copy (SELECT * FROM email_template ORDER BY ID ASC) to data/email_template.csv csv delimiter E'\t'
\copy (SELECT * FROM user_address ORDER BY ID ASC) to data/user_address.csv csv delimiter E'\t'
\copy (SELECT * FROM "user" ORDER BY ID ASC) to data/user.csv csv delimiter E'\t'
\copy (SELECT * FROM prize ORDER BY ID ASC) to data/prize.csv csv delimiter E'\t'
\copy (SELECT * FROM contestant ORDER BY ID ASC) to data/contestants.csv csv delimiter E'\t'
\copy (SELECT * FROM drawing ORDER BY ID ASC) to data/drawing.csv csv delimiter E'\t'
\copy (SELECT * FROM winners ORDER BY ID ASC) to data/winners.csv csv delimiter E'\t'
\copy (SELECT * FROM drawing_winners ORDER BY DRAWING_WINNERS_ID ASC) to data/drawing_winners.csv csv delimiter E'\t'
\copy (SELECT * FROM winners_contestant ORDER BY WINNERS_WINNERS_ID ASC) to data/winners_contestant.csv csv delimiter E'\t'
\copy (SELECT * FROM contest_result ORDER BY ID ASC) to data/contest_result.csv csv delimiter E'\t'
\copy (SELECT * FROM next_drawing ORDER BY ID ASC) to data/next_drawing.csv csv delimiter E'\t'