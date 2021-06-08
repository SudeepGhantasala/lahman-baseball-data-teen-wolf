/*Filename convention = Teen_Wolf_Q(*)_githubname*/

/*Q3. Find all players in the database who played at Vanderbilt University. Create a list showing each player’s first and last names 
as well as the total salary they earned in the major leagues. Sort this list in descending order by the total salary earned. 
Which Vanderbilt player earned the most money in the majors?*/

/*A3. DAVID PRICE*/

SELECT DISTINCT collegeplaying.playerid, 
	people.namefirst, 
	people.namelast, 
	SUM(salaries.salary)
FROM collegeplaying 
LEFT JOIN people
ON collegeplaying.playerid = people.playerid
LEFT JOIN salaries
ON collegeplaying.playerid = salaries.playerid
WHERE collegeplaying.schoolid = 'vandy'
AND salaries.salary IS NOT NULL
GROUP BY collegeplaying.playerid, people.namefirst, people.namelast 
ORDER BY SUM(salaries.salary) DESC;
