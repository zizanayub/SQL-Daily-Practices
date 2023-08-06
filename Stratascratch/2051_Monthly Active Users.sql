DROP TABLE IF EXISTS employee;


CREATE TABLE employee 
(
    date	datetime,
    account_id	VARCHAR(512),
    user_id	VARCHAR(512)
);

INSERT INTO employee (date, account_id, user_id) VALUES
	('2021-01-01', 'A1', 'U1'),
	('2021-01-01', 'A1', 'U2'),
	('2021-01-06', 'A1', 'U3'),
	('2021-01-02', 'A1', 'U1'),
	('2020-12-24', 'A1', 'U2'),
	('2020-12-08', 'A1', 'U1'),
	('2020-12-09', 'A1', 'U1'),
	('2021-01-10', 'A2', 'U4'),
	('2021-01-11', 'A2', 'U4'),
	('2021-01-12', 'A2', 'U4'),
	('2021-01-15', 'A2', 'U5'),
	('2020-12-17', 'A2', 'U4'),
	('2020-12-25', 'A3', 'U6'),
	('2020-12-25', 'A3', 'U6'),
	('2020-12-25', 'A3', 'U6'),
	('2020-12-06', 'A3', 'U7'),
	('2020-12-06', 'A3', 'U6'),
	('2021-01-14', 'A3', 'U6'),
	('2021-02-07', 'A1', 'U1'),
	('2021-02-10', 'A1', 'U2'),
	('2021-02-01', 'A2', 'U4'),
	('2021-02-01', 'A2', 'U5'),
	('2020-12-05', 'A1', 'U8');
    
    
    
    
    
SELECT * FROM employee;

/*
Question:
Find the monthly active users for January 2021 for each account. 
Your output should have account_id and the monthly count for that account.
*/



-- Final Answer
SELECT 
   account_id,
   COUNT(user_id) AS "Monthly Active Users"
FROM employee
WHERE MONTH(date) = 1
GROUP BY account_id;



-- After Excel Data Analysis, it is finalized to correct! 
