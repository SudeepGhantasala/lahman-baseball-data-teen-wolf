--question 6
--  Find the player who had the most success stealing bases in 2016, 
--  where success is measured as the percentage of stolen base attempts which are successful. 
--  (A stolen base attempt results either in a stolen base or being caught stealing.) 
--  Consider only players who attempted at least 20 stolen bases.

 select namefirst, namelast,(sb::numeric/(sb::numeric+cs::numeric)) as stolen_success_percentage
 from batting
 left join people
 using(playerid)
 where  yearid=2016 and (sb+cs) >20
 order by (sb::numeric/(sb::numeric+cs::numeric)) desc
 limit 1