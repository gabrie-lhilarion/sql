
SELECT matchid, player FROM goal
  WHERE teamid = 'GER'

 

SELECT id,stadium,team1,team2
  FROM game where id = 1012

 
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid) where teamid = 'GER'
 

SELECT team1, team2, player
  FROM game JOIN goal ON (id=matchid) where player LIKE 'Mario%'
 

SELECT player, teamid, coach, gtime
  FROM goal
goal JOIN eteam on teamid=id
 WHERE gtime<=10
 
SELECT mdate, teamname
  FROM game JOIN eteam ON (team1=eteam.id)
 WHERE coach = 'Fernando Santos'



SELECT player
  FROM goal JOIN game ON (id=matchid) where stadium = 'National Stadium, Warsaw'

-- 8.
-- The example query shows all goals scored in the Germany-Greece quarterfinal.
-- Instead show the name of all players who scored a goal against Germany.

SELECT DISTINCT player
FROM game
  JOIN goal ON matchid = id
WHERE ((team1='GER' OR team2='GER') AND teamid != 'GER')

-- 9. Show teamname and the total number of goals scored.
--    COUNT and GROUP BY

SELECT teamname, COUNT(*)
  FROM eteam JOIN goal ON id=teamid
GROUP BY teamname

-- 10. Show the stadium and the number of goals scored in each stadium.

SELECT stadium, COUNT(*)
  FROM game JOIN goal ON id=matchid
GROUP BY stadium

-- 11. For every match involving 'POL', show the matchid, date and the number of goals scored.

SELECT matchid,mdate, COUNT(*)
  FROM game JOIN goal ON matchid = id
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate

-- 12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'

SELECT matchid,mdate, COUNT(*)
  FROM game JOIN goal ON matchid = id
 WHERE (team1 = 'GER'  OR team2 = 'GER' ) AND teamid='GER'
GROUP BY matchid, mdate

-- 13. List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.

SELECT mdate,
  team1,
  sum(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) As score1,
  team2,
  sum(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) As score2
FROM game left join goal ON matchid = id
group by mdate, matchid, team1, team2
