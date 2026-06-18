
SELECT *
FROM Players2024

ALTER TABLE Players2024
ALTER COLUMN Age SMALLINT; -- or INT
--QUESTIONS 
--Write a query to find the top 10 oldest players in the dataset.

SELECT TOP 10 *
FROM Players2024
ORDER BY Age DESC;


--Write a query to calculate the average height of players for each nationality, returning only nationalities with more than 3 players.

SELECT nationality, AVG(height_cm) AS Average_height
FROM Players2024
GROUP BY nationality
HAVING COUNT(nationality) > 3;

--Write a query to find all pairs of players where one player is taller than the other, and return both player names.
SELECT  a.name AS Player_1, b.name AS player_2 
FROM Players2024 AS a , Players2024 AS b
WHERE a.height_cm > b.height_cm  AND a.name <>b.name




--Write a query to find players who play in more than two positions.
SELECT name , COUNT(positions) AS Position_count
FROM Players2024
GROUP BY name
HAVING COUNT(positions) >= 2 
ORDER BY COUNT(positions) DESC


--Write a query to find the 10 nationality with the highest number of players.
SELECT  TOP 10 nationality , COUNT(*) AS num_of_player
FROM Players2024
GROUP BY nationality
ORDER BY num_of_player DESC

--Write a query to find all players whose height is below the average height of the dataset.

SELECT name 
FROM Players2024
WHERE height_cm < (
              SELECT AVG (height_cm)
			  FROM Players2024 )
			       
--Write a query to find pairs of players with an age difference of exactly 5 years.
SELECT  a.name AS Player_1 , b.name AS player_2 
FROM Players2024 AS a 
JOIN Players2024 AS b  ON
ABS(a.Age - b.Age) = 5 
WHERE a.name <> b.name

--Write a query to find players who are older than the average age of all players.
SELECT name 
FROM Players2024
WHERE Age > (
               SELECT AVG (Age) 
			   FROM Players2024
			    ) 

--Write a query to count the distinct clubs for each nationality in DESC
SELECT nationality, COUNT (DISTINCT Club) AS distinct_club
FROM Players2024
GROUP BY nationality
ORDER BY distinct_club DESC

--Write a query to find all pairs of players whose names start with the same initial.
SELECT a.name AS player_1 , b.name AS player_2
FROM Players2024 AS a 
JOIN players2024 AS b ON
SUBSTRING (a.name,1,1) = SUBSTRING (b.name,1,1) 
WHERE a.name <>b.name

--Write a query to rank players by age within their respective clubs
SELECT 
 name, 
 club,
 Age, 
 RANK() OVER (PARTITION BY Club ORDER BY Age DESC ) AS Age_rank
FROM Players2024

--Write a query to find the nationality with the player Age greather than average age of players.
SELECT  DISTINCT nationality
FROM Players2024
WHERE Age > ( 
               SELECT AVG(Age)
			   FROM Players2024
			 )

--Write a query to find the nationality with the highest average age of players.
SELECT TOP 1  nationality, AVG(Age) AS average_age
FROM Players2024
GROUP BY nationality
ORDER BY average_age DESC