set serveroutput on;
set verify off;

CREATE or REPLACE PACKAGE trophies AS
	
	FUNCTION tedLinslayAward
	RETURN NUMBER;
	
	PROCEDURE nomination;
	
End trophies;
/

CREATE or REPLACE PACKAGE BODY trophies AS

	PROCEDURE nomination 
	IS
	
	BEGIN
		
		dbms_output.put_line('------------------------------');
		dbms_output.put_line('Ted Linslay Nominees Are: ');
		dbms_output.put_line('------------------------------');
		
		dbms_output.put_line(chr(10));
		
		dbms_output.put_line('Ranks----Player Name------Team Name------Player Score');
		dbms_output.put_line(chr(10));
		
		FOR R IN (select RANKS,player_name,team_name,score from (select RANK() over(ORDER BY score DESC) AS 
		Ranks, player_id, player_name, team_name, score from (select * from ((select * from Hockey_Team natural join 
		Hockey_Player) UNION (select * from hockey_team@site_link natural join Hockey_Player@site_link)))) where RANKS<=5) LOOP
			dbms_output.put_line(R.RANKS || ' ' || R.player_name || '------ ' || R.team_name || ' ------' || R.score);
		End LOOP;
		
	End nomination;
	
	
	
	FUNCTION tedLinslayAward
	RETURN NUMBER
	IS
	
	BEGIN
		--counts int:= 0;
		dbms_output.put_line(chr(10));
		
		dbms_output.put_line('------------------------------');
		dbms_output.put_line('Ted Linslay Award Winner is: ');
		dbms_output.put_line('------------------------------');
		
		dbms_output.put_line(chr(10));
		
		dbms_output.put_line('Ranks--Player ID--Player Name--Team Name--Player Score--Player AssistNumber');	
		
		dbms_output.put_line(chr(10));
		
		for R in (select * from (select RANK() over(ORDER BY score+assist_number DESC) AS TED_RANK, 
		player_id, player_name, team_name, score, assist_number,score+assist_number AS tedLinslayAward 
		from (select RANKS,player_id,player_name,team_name,score,assist_number from(select RANK() 
		over(ORDER BY score DESC) AS Ranks, player_id, player_name, team_name, score, assist_number 
		from (select * from ((select * from Hockey_Team natural join Hockey_Player) UNION 
		(select * from hockey_team@site_link natural join Hockey_Player@site_link)) natural join 
		(select * from Hockey_Assist UNION select * from hockey_assist@site_link))) where Ranks<=5)) where TED_Rank=1) LOOP
			dbms_output.put_line(R.TED_RANK || '------' || R.player_id || '------' || R.player_name || '------ ' || R.team_name || ' ------' || R.score || ' ------' || R.assist_number);	
			
			RETURN R.tedLinslayAward;
			
		END LOOP;
		
	
	END tedLinslayAward;
	
	
End trophies;
/

DECLARE
	num NUMBER;
BEGIN
	trophies.nomination;
	num:= trophies.tedLinslayAward;
	
	dbms_output.put_line(chr(10));
	dbms_output.put_line('Ted Linslay Award Point is :' || num);
End;
/