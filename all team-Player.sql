


create or replace view teamView(tid,tname,leg) as (select * from Hockey_Team UNION select * from hockey_team@site_link);
select * from teamView;

create or replace view playerView(pid,pname,pos,tid,scor,cntry) as (select * from Hockey_Player UNION select * from hockey_player@site_link);
select * from playerView;


(select * from Hockey_Team natural join Hockey_Player) 
UNION
(select * from hockey_team@site_link natural join Hockey_Player@site_link);



select * from ((select * from Hockey_Team natural join Hockey_Player) 
UNION 
(select * from hockey_team@site_link natural join Hockey_Player@site_link)) 
ORDER BY 
score DESC;


select RANK() over(ORDER BY score DESC) AS Rank, player_id, player_name, team_name, score from (select * from ((select * from Hockey_Team natural join Hockey_Player) 
UNION 
(select * from hockey_team@site_link natural join Hockey_Player@site_link)));


select RANKS,player_name from (select RANK() over(ORDER BY score DESC) AS Ranks, player_id, player_name, team_name, score from (select * from ((select * from Hockey_Team natural join Hockey_Player) 
UNION 
(select * from hockey_team@site_link natural join Hockey_Player@site_link)))) where RANKS<=5;


select score from (select RANK() over(ORDER BY score DESC) AS Ranks, player_id, player_name, team_name, score from (select * from ((select * from Hockey_Team natural join Hockey_Player) 
UNION 
(select * from hockey_team@site_link natural join Hockey_Player@site_link)))) where player_id=21;



(select * from Hockey_Assist 
UNION 
select * from hockey_assist@site_link);  


select RANK() over(ORDER BY score DESC) AS Rank, player_id, player_name, team_name, score, assist_number from (select * from ((select * from Hockey_Team natural join Hockey_Player) 
UNION 
(select * from hockey_team@site_link natural join Hockey_Player@site_link)) natural join (select * from Hockey_Assist 
UNION 
select * from hockey_assist@site_link));


select RANKS,player_id,player_name,team_name,score,assist_number from(select RANK() over(ORDER BY score DESC) AS Ranks, player_id, player_name, team_name, score, assist_number from (select * from ((select * from Hockey_Team natural join Hockey_Player) 
UNION 
(select * from hockey_team@site_link natural join Hockey_Player@site_link)) natural join (select * from Hockey_Assist 
UNION 
select * from hockey_assist@site_link))) where Ranks<=5;


select * from (select RANK() over(ORDER BY score+assist_number DESC) AS TED_RANK, player_id, player_name, team_name, score, assist_number,score+assist_number AS tedLinslayAward from (select RANKS,player_id,player_name,team_name,score,assist_number from(select RANK() over(ORDER BY score DESC) AS Ranks, player_id, player_name, team_name, score, assist_number from (select * from ((select * from Hockey_Team natural join Hockey_Player) UNION (select * from hockey_team@site_link natural join Hockey_Player@site_link)) natural join (select * from Hockey_Assist UNION select * from hockey_assist@site_link))) where Ranks<=5)) where TED_Rank=1;
