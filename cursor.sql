set serveroutput on;
set verify off;

BEGIN
	for R in (select RANKS,player_id,player_name,team_name,score,assist_number from(select RANK() over(ORDER BY score DESC) AS 
	Ranks, player_id, player_name, team_name, score, assist_number from (select * from ((select * from Hockey_Team natural join Hockey_Player) 
	UNION (select * from hockey_team@site_link natural join Hockey_Player@site_link)) natural join (select * from Hockey_Assist UNION select * from hockey_assist@site_link))) where Ranks<=5) LOOP
		dbms_output.put_line(MAX (R.score + R.assist_number));
	END LOOP;
End;
/