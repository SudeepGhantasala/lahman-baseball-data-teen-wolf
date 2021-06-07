/*Teen_Wolf_Q(*)_githubname*/
SELECT *
FROM people;

--1.
SELECT MIN(span_first), MAX(span_last)
FROM homegames;

SELECT MIN(yearid), MAX(yearid)
FROM teams;

/*3. Find all players in the database who played at Vanderbilt University. Create a list showing each player’s first and last names 
as well as the total salary they earned in the major leagues. Sort this list in descending order by the total salary earned. 
Which Vanderbilt player earned the most money in the majors?*/


SELECT --DISTINCT 
collegeplaying.playerid, people.namefirst, people.namelast, salaries.salary, salaries.yearid AS salary_year, collegeplaying.yearid AS college_year
FROM collegeplaying 
LEFT JOIN people
ON collegeplaying.playerid = people.playerid
LEFT JOIN salaries
ON collegeplaying.playerid = salaries.playerid
WHERE collegeplaying.schoolid = 'vandy'
ORDER BY collegeplaying.playerid, salaries.yearid;


SELECT playerid, SUM(salary) as total_salary
FROM salaries
GROUP BY playerid
ORDER BY total_salary DESC;
