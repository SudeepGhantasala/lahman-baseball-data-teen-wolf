--question 2
select playerid, namefirst ,namelast,(height), g_all, teamid
from people
left join appearances
using( playerid)
where height = (select min(height)
				from people)
				

