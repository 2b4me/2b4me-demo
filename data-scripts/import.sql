delete from email_template;
delete from "user";
delete from user_address;
delete from drawing_winners;
delete from winners_contestant;
delete from winners;
delete from contest_result;
delete from prize;
delete from contestant;
delete from drawing;
\copy email_template from data/email_template.csv csv delimiter E'\t'
\copy user_address from data/user_address.csv csv delimiter E'\t'
\copy "user" from data/user.csv csv delimiter E'\t'
\copy prize from data/prize.csv csv delimiter E'\t'
\copy contestant from data/contestants.csv csv delimiter E'\t'
\copy drawing from data/drawing.csv csv delimiter E'\t'
\copy winners from data/winners.csv csv delimiter E'\t'
\copy drawing_winners from data/drawing_winners.csv csv delimiter E'\t'
\copy winners_contestant from data/winners_contestant.csv csv delimiter E'\t'
\copy contest_result from data/contest_result.csv csv delimiter E'\t'
select setval('contestant_id_sequence', (select max(id) from contestant));
select setval('drawing_id_sequence', (select max(id) from drawing));
select setval('winners_id_sequence', (select max(id) from winners));
select setval('prize_id_sequence', (select max(id) from prize));
select setval('user_address_id_sequence', (select max(id) from user_address));
select setval('user_id_sequence', (select max(id) from "user"));
select setval('email_template_id_sequence', (select max(id) from email_template));
select setval('contest_result_id_sequence', (select max(id) from contest_result));