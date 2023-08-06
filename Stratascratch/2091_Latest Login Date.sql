USE exercises;



DROP TABLE IF EXISTS players_logins;

CREATE TABLE players_logins 
(
    player_id	INT,
    login_date	datetime
);

INSERT INTO players_logins (player_id, login_date) VALUES
	('101', '2021-12-14'),
	('101', '2021-12-18'),
	('101', '2021-12-15'),
	('101', '2021-12-19'),
	('102', '2021-12-31'),
	('102', '2022-01-01'),
	('102', '2022-01-15'),
	('102', '2022-01-15'),
	('103', '2020-12-22'),
	('103', '2021-12-23'),
	('103', '2021-12-15'),
	('104', '2022-01-14'),
	('105', '2022-01-08'),
	('105', '2022-01-06'),
	('105', '2022-01-10'),
	('106', '2022-01-24'),
	('106', '2022-01-25'),
	('106', '2022-01-24'),
	('106', '2022-01-25'),
	('106', '2022-01-26'),
	('106', '2022-01-26');
    
    


SELECT * FROM players_logins;





/*
Question:
For each video game player, find the latest date when they logged in.
*/


SELECT 
   player_id,
   MAX(DATE(login_date)) AS "Latest Login"
FROM players_logins
GROUP BY player_id;