
CREATE DATABASE db;

USE db;
CREATE TABLE tournament (tournament_id INT PRIMARY KEY,tournament_name VARCHAR(100),season YEAR ,start_date DATE, end_date DATE );
ALTER TABLE tournament ADD UNIQUE (season);
INSERT INTO tournament
(tournament_id, tournament_name, season, start_date, end_date)
VALUES
(1, 'IPL 2017', '2017', '2017-04-05', '2017-05-21'),
(2, 'IPL 2018', '2018', '2018-04-07', '2018-05-27'),
(3, 'IPL 2019', '2019', '2019-03-23', '2019-05-12'),
(4, 'IPL 2020', '2020', '2020-09-19', '2020-11-10'),
(5, 'IPL 2021', '2021', '2021-04-09', '2021-10-15'),
(6, 'IPL 2022', '2022', '2022-03-26', '2022-05-29'),
(7, 'IPL 2023', '2023', '2023-03-31', '2023-05-29'),
(8, 'IPL 2024', '2024', '2024-03-22', '2024-05-26'),
(9, 'IPL 2025', '2025', '2025-03-22', '2025-06-03'),
(10, 'IPL 2026', '2026', '2026-03-14', '2026-05-31');


select year("2026-03-14") as year;
select day("2025-03-22") as day;
select month("2025-03-22") as month;

select * from tournaments;
select count(tournament_name) as tournment from tournaments;

SELECT *FROM tournament WHERE season BETWEEN 2022 AND 2025;
select * from tournament where tournament_name in ('IPL 2017' ,'IPL 2026' ,'IPL 2022');

select * from tournament inner join final_winner on tournaments.tournament_id=final_winner.tournament_id;
select final_winner,runner_up from tournament;

select * from tournament inner join teams on tournament.tournament_id=teams.tournament_id;

ALTER TABLE tournament
 ADD COLUMN final_winner VARCHAR(100),
 ADD COLUMN runner_up VARCHAR(100);
 
UPDATE tournaments SET final_winner = 'MI', runner_up = 'RPS'WHERE season = 2017;
UPDATE tournaments SET final_winner = 'CSK', runner_up = 'SRH'WHERE season = 2018;
UPDATE tournaments SET final_winner = 'MI', runner_up = 'CSK'WHERE season = 2019;
UPDATE tournaments SET final_winner = 'MI', runner_up = 'DC'WHERE season = 2020;
UPDATE tournaments SET final_winner = 'CSK', runner_up = 'KKR'WHERE season = 2021;
UPDATE tournaments SET final_winner = 'GT', runner_up = 'RR'WHERE season = 2022;
UPDATE tournaments SET final_winner = 'CSK', runner_up = 'GT'WHERE season = 2023;
UPDATE tournaments SET final_winner = 'KKR', runner_up = 'SRH' WHERE season = 2024;
UPDATE tournaments SET final_winner = 'RCB', runner_up = 'PBKS'WHERE season = 2025;
UPDATE tournaments SET final_winner = 'RCB', runner_up = 'PBKS'WHERE season = 2026;


CREATE TABLE teams (team_id INT PRIMARY KEY,tournament_id INT,captain VARCHAR(100),short_name VARCHAR(100));
ALTER TABLE teams 
ADD UNIQUE (short_name);
ALTER TABLE teams ADD coach_id INT;
UPDATE teams SET coach_id = 1 WHERE coach_id = 1;
UPDATE teams SET coach_id = 2 WHERE coach_id = 2;
UPDATE teams SET coach_id = 3 WHERE coach_id = 3;
UPDATE teams SET coach_id = 4 WHERE coach_id = 4;
UPDATE teams SET coach_id = 5 WHERE coach_id = 5;
UPDATE teams SET coach_id = 6 WHERE coach_id = 6;
UPDATE teams SET coach_id = 7 WHERE coach_id = 7;
UPDATE teams SET coach_id = 8 WHERE coach_id = 8;
UPDATE teams SET coach_id = 9 WHERE coach_id = 9;
UPDATE teams SET coach_id = 10 WHERE coach_id = 10;


INSERT INTO teams VALUES(1,1,'patidar','rcb'),(2,2,'dhoni','csk'),(3,3,'shreyas','pbks'),(4,4,'hardik pandya','MI'),(5,5,'ajinkya rahane','kkr'),(6,6,'riyan parag','rr'),(7,7,'shubman gill','gt'),(8,8,'pat cummins','srh'),(9,9,'axar patel','dc'),(10,10,'rishab pant','lsg');

SELECT * FROM teams WHERE coach_id IS NULL;

select * from teams inner join points_table on teams.short_name=points_table.short_name;

CREATE TABLE coaches(coach_id INT PRIMARY KEY,coach_name VARCHAR(100),experience_years YEAR);
INSERT INTO coaches VALUES(1,'andy flower',17),(2,'stephen fleming',16),(3,'ricky pointing',14);
alter table coaches modify experience_years int;
update coaches set experience_years =
case coach_id
when 1 then 17
when 2 then 16
when 3 then 14
else experience_years
end;
SELECT coach_name,UPPER(coach_name) AS Upper_Name FROM coaches;
SELECT coach_name,LENGTH(coach_name) AS Name_Length FROM coaches;

CREATE TABLE stadiums (stadium_name VARCHAR(100) PRIMARY KEY,city VARCHAR (100),capacity INT);
INSERT INTO stadiums VALUES ("Chinnaswami stadium","Bengaluru",40000),("Wankhede stadium","mumbai",33000),("Narendra modi stadium","Ahmedabad",132000),("Chepauk stadium","chennai",50000),("Eden Gardens stadium","kolkata",68000);

SELECT CONCAT(stadium_name,' - ',city) AS Stadium_City FROM stadiums;
SELECT stadium_name, SUBSTR(stadium_name,1,10) AS First_Ten FROM stadiums;

select max(capacity) as capacity from stadiums;
select min(capacity) as capacity from stadiums;

create view stadium as select stadium_name ,city from Stadiums;
select * from stadiums;

update stadiums set stadium_name= 'Dharmashala stadium' where city='kolkata';


CREATE TABLE sponsors(sponser_id INT PRIMARY KEY,sponser_name VARCHAR(30),Sponsership_amount DECIMAL(12,2),tournament_id INT);
INSERT INTO sponsors VALUES (101, 'TATA', 5000000.00, 1), (102, 'Dream11', 350000.00, 1), (103, 'CEAT', 20000000.00, 2),(104, 'RuPay', 25000000.00, 2), (105, 'My11Circle', 180000.00, 3);

select avg(sponsership_amount) as avg_amount from sponsors;

select sum(sponsership_amount) as sums from sponsors;

SELECT ROUND(Sponsership_amount) FROM sponsors;

SELECT TRIM(sponser_name) AS Sponsor_Name FROM sponsors;

select * from tournaments inner join sponsors on tournaments.tournament_id=sponsors.tournament_id;


CREATE VIEW tournament_sponsors AS SELECT sponser_name, Sponsership_amount, tournament_id FROM sponsors;
select * from tournament_sponsors;

update tournament_sponsors set sponser_name = 'one8' where sponsership_amount=5000000.00;

CREATE TABLE Players (player_id INT PRIMARY KEY,Team_name VARCHAR(20),player_name VARCHAR(100),batting_style VARCHAR(50),bowling_style VARCHAR(50));
INSERT INTO Players
(player_id, Team_name, player_name, batting_style, bowling_style)
VALUES
(18, 'RCB', 'Virat Kohli', 'Right-hand Bat', 'Right-arm Medium'),
(1, 'CSK', 'Ruturaj Gaikwad', 'Right-hand Bat', 'Right-arm Off Break'),
(45, 'MI', 'Rohit Sharma', 'Right-hand Bat', 'Right-arm Off Break'),
(3, 'KKR', 'Ajinkya Rahane', 'Right-hand Bat', 'Right-arm Medium'),
(30, 'SRH', 'Pat Cummins', 'Right-hand Bat', 'Right-arm Fast'),
(27, 'GT', 'Shubman Gill', 'Right-hand Bat', 'Right-arm Off Break'),
(11, 'RR', 'Sanju Samson', 'Right-hand Bat', 'Right-arm Medium'),
(41, 'PBKS', 'Shreyas Iyer', 'Right-hand Bat', 'Right-arm Off Break');

SELECT player_name, INSTR(player_name,'a') AS Position FROM Players;
SELECT REPLACE(player_name,'Virat','King') AS New_Name FROM Players;

select * from Players where Team_name="rcb";
select * from players;
select count(player_name) as countofplayer from players; 
select * from players where Team_name="rcb" or Team_name= "csk";
select * from players where Team_name in ('rcb' ,'csk' ,'mi');
SELECT * FROM Players WHERE player_name LIKE 'V%';

select * from teams inner join players on teams.team_id=players.player_id;

create view Players_details as select Team_name ,player_name ,batting_style ,bowling_style from players;
select * from players_details;

UPDATE Players SET Team_name = 'MI' WHERE player_id = 18;
UPDATE Players SET Team_name = 'RCB' WHERE player_id = 18;


CREATE TABLE Matches (
    match_id INT PRIMARY KEY,
    team1_name VARCHAR(20),
    team2_name VARCHAR(20),
    match_date DATE
);

ALTER TABLE matches ADD umpire_id INT;
ALTER TABLE matches ADD tournament_id INT;
UPDATE Matches SET tournament_id = 1 WHERE tournament_id = 1;
UPDATE Matches SET tournament_id = 2 WHERE tournament_id = 2;
UPDATE Matches SET tournament_id = 3 WHERE tournament_id = 3;
UPDATE Matches SET tournament_id = 4 WHERE tournament_id = 4;
UPDATE Matches SET tournament_id = 5 WHERE tournament_id = 5;
UPDATE Matches SET tournament_id = 6 WHERE tournament_id = 6;
UPDATE Matches SET tournament_id = 7 WHERE tournament_id = 7;
UPDATE Matches SET tournament_id = 8 WHERE tournament_id = 8;

 

INSERT INTO Matches (match_id, team1_name, team2_name, match_date,umpire_id)
VALUES
(1, 'RCB', 'CSK', '2026-03-22'),
(2, 'MI', 'KKR', '2026-03-23'),
(3, 'SRH', 'GT', '2026-03-24'),
(4, 'RR', 'PBKS', '2026-03-25'),
(5, 'RCB', 'MI', '2026-03-27'),
(6, 'CSK', 'KKR', '2026-03-28'),
(7, 'SRH', 'RR', '2026-03-29'),
(8, 'GT', 'PBKS', '2026-03-30');

UPDATE Matches SET umpire_id = 1 WHERE match_id = 1;
UPDATE Matches SET umpire_id = 2 WHERE match_id = 2;
UPDATE Matches SET umpire_id = 3 WHERE match_id = 3;
UPDATE Matches SET umpire_id = 4 WHERE match_id = 4;
UPDATE Matches SET umpire_id = 5 WHERE match_id = 5;
UPDATE Matches SET umpire_id = 6 WHERE match_id = 6;
UPDATE Matches SET umpire_id = 7 WHERE match_id = 7;
UPDATE Matches SET umpire_id = 8 WHERE match_id = 8;


select dayname("2026-03-22") as dayname;
select monthname("2025-03-22") as monthname;

select * from matches inner join umpires on matches.umpire_id=umpires.umpire_id;

CREATE TABLE Umpires (
    umpire_id INT PRIMARY KEY,
    umpire_name VARCHAR(100),
    country VARCHAR(50)
);

INSERT INTO Umpires (umpire_id, umpire_name, country)
VALUES
(1, 'Nitin Menon', 'India'),
(2, 'Anil Chaudhary', 'India'),
(3, 'Chris Gaffaney', 'New Zealand'),
(4, 'Kumar Dharmasena', 'Sri Lanka'),
(5, 'Paul Reiffel', 'Australia'),
(6, 'Richard Illingworth', 'England'),
(7, 'Marais Erasmus', 'South Africa'),
(8, 'Rod Tucker', 'Australia');

SELECT DISTINCT country FROM Umpires;
SELECT * FROM Umpires WHERE umpire_name LIKE '%a';

CREATE TABLE Points_Table (
    points_id INT PRIMARY KEY,
    short_name VARCHAR(20),
    matches_played INT,
    won INT,
    loss INT,
    points INT
);

INSERT INTO Points_Table
(points_id, short_name, matches_played, won, loss, points)
VALUES
(1, 'RCB', 10, 9, 1, 18),
(2, 'CSK', 10, 7, 3, 14),
(3, 'MI', 10, 7, 3, 14),
(4, 'KKR', 10, 8, 2, 16),
(5, 'SRH', 10, 6, 4, 12),
(6, 'GT', 10, 5, 5, 10),
(7, 'RR', 10, 2, 8, 4),
(8, 'PBKS', 10, 1, 9, 2);

select * from points_table;
select max(points) as total_points from points_table;

select min(points) as total_points from points_table;

select * from points_table where points > 12;

SELECT short_name, won + loss AS Total_Matches FROM Points_Table;

SELECT short_name, matches_played - won AS Not_Won FROM Points_Table;

CREATE VIEW team_points AS SELECT short_name, matches_played, won, loss, points FROM Points_Table;
SELECT * FROM team_points;

CREATE TABLE Awards (
    
    award_id INT PRIMARY KEY ,
    season INT,
    award_name VARCHAR(100),
    player_name VARCHAR(100)
);

ALTER TABLE awards MODIFY season YEAR;

INSERT INTO Awards (award_id ,season,award_name, player_name)
VALUES
( 1 ,2024, 'Orange Cap', 'Virat Kohli'),
(2 ,2024, 'Purple Cap', 'Harshal Patel'),
(3 ,2025, 'Orange Cap', 'Sai Sudharsan'),
(4 ,2025, 'Purple Cap', 'Prasidh Krishna'),
(5 ,2026,'Orange Cap', 'Vaibhav Suryavamshi'),
(6 ,2026, 'Purple Cap', 'Kagiso Rabada');

SELECT DISTINCT award_name FROM Awards;

create view Award as select season,award_name, player_name from Awards;
select * from awards;

CREATE TABLE Final_Winner (
    final_id INT PRIMARY KEY,
    tournament_id INT,
    winner_team_id INT,
    runner_team_id INT,
    final_match_date DATE,
    stadium_name VARCHAR(100),
    player_of_match VARCHAR(100),

    FOREIGN KEY (tournament_id)
        REFERENCES tournaments(tournament_id),

    FOREIGN KEY (winner_team_id)
        REFERENCES teams(team_id),

    FOREIGN KEY (runner_team_id)
        REFERENCES teams(team_id),

    FOREIGN KEY (stadium_name)
        REFERENCES stadiums(stadium_name)
);



INSERT INTO Final_Winner
(final_id, tournament_id, winner_team_id, runner_team_id,
final_match_date, stadium_name, player_of_match)
VALUES
(1, 1, 2, 4, '2022-05-29', 'Narendra modi stadium', 'Jos Buttler'),
(2, 2, 2, 7, '2023-05-29', 'Narendra modi stadium', 'Devon Conway'),
(3, 3, 5, 8, '2024-05-26', 'Chepauk stadium', 'Mitchell Starc');

SELECT * from final_winner inner join stadiums on final_winner.stadium_name=stadiums.stadium_name;





ALTER TABLE teams
ADD FOREIGN KEY(tournament_id)REFERENCES tournaments(tournament_id);

ALTER TABLE sponsors
ADD FOREIGN KEY (tournament_id)REFERENCES tournaments(tournament_id);


ALTER TABLE Final_Winner
ADD FOREIGN KEY(tournament_id)REFERENCES tournaments(tournament_id);


ALTER TABLE Final_Winner
ADD FOREIGN KEY (winner_team_id)REFERENCES teams(team_id);


ALTER TABLE Final_Winner
ADD FOREIGN KEY(runner_team_id)REFERENCES teams(team_id);


ALTER TABLE Final_Winner
ADD FOREIGN KEY (stadium_name)REFERENCES stadiums(stadium_name);


ALTER TABLE Players
ADD FOREIGN KEY (Team_name)REFERENCES teams(short_name);


ALTER TABLE Points_Table
ADD FOREIGN KEY (short_name)REFERENCES teams(short_name);

ALTER TABLE matches
 ADD FOREIGN KEY (umpire_id) REFERENCES umpires(umpire_id);
 
 ALTER TABLE awards
ADD FOREIGN KEY (season) REFERENCES tournaments(season);

ALTER TABLE teams
ADD FOREIGN KEY (coach_id) REFERENCES coaches(coach_id);

ALTER TABLE matches
ADD FOREIGN KEY (tournament_id) REFERENCES tournaments(tournament_id);


commit;


-- subqueries

SELECT short_name,points FROM points_table WHERE points = (SELECT points FROM points_table ORDER BY points DESC LIMIT 1);

select captain,short_name from teams where team_id =(select team_id from teams where captain ='patidar');

select sponser_name from sponsors  where tournament_id in(select tournament_id from tournaments);


select capacity,stadium_name from stadiums where capacity=(select max(capacity) from stadiums);



select  Sponsership_amount,sponser_name from sponsors where Sponsership_amount=(select max(Sponsership_amount) from sponsors);


select season from tournaments where season=(select max(season) from tournaments);


select coach_name,experience_years from coaches where experience_years=(select max(experience_years) from coaches);

select final_winner from tournaments where season=(select max(season) from tournaments);

select short_name,points from points_table where points in (select points from points_table where points>(select avg(points) from points_table));

select * from players where team_name = 'rcb';
select team_name, count(*) as total_players from players group by team_name;
select *  from matches order by match_date asc ; 
select short_name, sum(points) as total_points from points_table group by short_name having sum(points) > 10;