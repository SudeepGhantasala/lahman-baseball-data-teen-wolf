-- Analyze all the colleges in the state of Tennessee. 
-- Which college has had the most success in the major leagues. Use whatever metric for success you like 
-- - number of players, number of games, salaries, world series wins, etc.

with removeyear as (
select distinct playerid, schoolid
	from collegeplaying
),
world_series as (
select distinct appearances.teamid,teams.yearid, wswin
from appearances
left join removeyear
	using(playerid)
	
left join salaries
using (playerid, yearid)
	
left join schools
	using (schoolid)
left join teams
on(appearances.teamid = teams.teamid and appearances.yearid = teams.yearid)
where schoolstate = 'TN'

)

select  schoolname, count(distinct playerid) as player_count, 
 sum(g_all) as total_games, avg(salary)::numeric::money as avg_salary, 
 count(case when wswin='Y' then 1 end) as players_ws_wins

--select distinct appearances.teamid,teams.yearid, wswin
from appearances
left join removeyear
	using(playerid)
	
left join salaries
using (playerid, yearid)
	
left join schools
	using (schoolid)
left join teams
on(appearances.teamid = teams.teamid and appearances.yearid = teams.yearid)
where schoolstate = 'TN'


 group by schoolname
 order by count(distinct playerid) desc

