/*5. Find the average number of strikeouts per game by decade since 1920. 
	 Round the numbers you report to 2 decimal places. 
	 Do the same for home runs per game. 
	 Do you see any trends?*/
	 
SELECT *
	FROM pitchingpost;
	 
Select 
	   DISTINCT yearid,
	   avg(so) OVER(PARTITION BY yearid) as avg_so
FROM pitchingpost
WHERE yearid>=1920
ORDER BY yearid;

Select
(cast(yearid as varchar(4)), 3) , '0s' as decade
from pitchingpost
group by left(cast(yearid as varchar(4)), 3);
--order by;

select *
from fielding;