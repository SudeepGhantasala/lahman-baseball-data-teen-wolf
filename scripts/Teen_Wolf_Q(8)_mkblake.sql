SELECT *
FROM homegames
WHERE year = 2016
ORDER BY team;

/*8.Using the attendance figures from the homegames table, find the teams and parks which had the 
top 5 average attendance per game in 2016 (where average attendance is defined as total attendance divided by number of games). 
Only consider parks where there were at least 10 games played. 
Report the park name, team name, and average attendance. 
Repeat for the lowest 5 average attendance.*/

SELECT *
FROM homegames
WHERE year = 2016;

--ANSWER PART ONE
SELECT DISTINCT teams.park, 
		teams.name,
		(homegames.attendance/homegames.games) AS avg_attendance_per_game 
FROM homegames
LEFT JOIN teams 
ON homegames.team = teams.teamid AND homegames.year = teams.yearid
WHERE homegames.year = 2016
AND homegames.games >= 10
	ORDER BY avg_attendance_per_game DESC
	LIMIT 5;

-- ANSWER PART TWO
SELECT DISTINCT teams.park, 
		teams.name,
		(homegames.attendance/homegames.games) AS avg_attendance_per_game 
FROM homegames
LEFT JOIN teams 
ON homegames.team = teams.teamid AND homegames.year = teams.yearid
WHERE homegames.year = 2016
AND homegames.games >= 10
	ORDER BY avg_attendance_per_game 
	LIMIT 5;
