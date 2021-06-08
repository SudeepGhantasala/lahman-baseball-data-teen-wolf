
--Find the name and height of the shortest player in the database. 
--How many games did he play in? What is the name of the team for which he played?

--question 2
select distinct namefirst ,namelast, height, g_all, name
from people
left join appearances
using( playerid)
left join teams
using( teamid)
where height = (select min(height)
				from people)
				

