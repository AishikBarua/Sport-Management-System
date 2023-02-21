set serveroutput on;
set verify off;

accept playerID number prompt "Enter PLayer ID: " 

CREATE or REPLACE FUNCTION points (scorePoints IN NUMBER, playersTotal IN NUMBER)
return number
IS

BEGIN

	dbms_output.put_line(chr(10));
	dbms_output.put_line('-----DETAILS OF THE PLAYER-----');
	
	return ((scorePoints/2)+playersTotal);
	
END points;
/


DECLARE
	inputPlayerId Hockey_Player.player_id%TYPE;
	storeScore NUMBER;
	pointsCount NUMBER;
	
	R NUMBER:=0;
	PNAME Hockey_Player.player_name%TYPE;
	TNAME Hockey_Team.team_name%TYPE;
	
	totalPlayer NUMBER:=0;
	

BEGIN
	inputPlayerId:= &playerID;
	
	select RANKS,player_name,team_name,score into R,PNAME,TNAME,storeScore from (select RANK() over(ORDER BY score DESC) 
	AS Ranks, player_id, player_name, team_name, score from (select * from ((select * from Hockey_Team natural join Hockey_Player) 
	UNION 
	(select * from hockey_team@site_link natural join Hockey_Player@site_link)))) where player_id=inputPlayerId;
	
	select count(player_id) into totalPlayer from (select * from Hockey_Player UNION select * from hockey_player@site_link);
	
	pointsCount:= points(storeScore,totalPlayer);
	
	dbms_output.put_line('RANK: ' || R);
	dbms_output.put_line('PLAYER NAME: ' || PNAME);
	dbms_output.put_line('TEAM NAME: ' || TNAME);
	dbms_output.put_line('TOTAL GOAL SCORE: ' || storeScore);
	
	dbms_output.put_line(chr(10));
	
	dbms_output.put_line('PLAYERS POINT IS: ' || pointsCount);
	dbms_output.put_line('-------------------------------');
	
END;
/