set serveroutput on;
set verify off;

accept x number prompt "Enter Player ID: " 
accept y char prompt "Enter PLayer Name: " 
accept z char prompt "Enter Position: " 
accept p number prompt "Enter Team ID: "
accept q number prompt "Enter Score: " 
accept r char prompt "Enter Country: "  


CREATE or REPLACE procedure insertPlayerinPc(p_id in Hockey_Player.player_id%TYPE, 
											 p_name in Hockey_Player.player_name%TYPE, 
											 pos in Hockey_Player.position%TYPE, 
											 t_id in Hockey_Player.team_id%TYPE, 
											 scor in Hockey_Player.score%TYPE, 
											 cntry in Hockey_Player.country%TYPE)
IS

BEGIN

	dbms_output.put_line('---------------------------------------');
	INSERT into Hockey_Player values(p_id,p_name,pos,t_id,scor,cntry);
	dbms_output.put_line(p_id || ' ' || p_name || ' ' || pos || ' ' || t_id || ' ' || ' ' || scor || ' ' || cntry);
		
End insertPlayerinPc;
/

DECLARE
	A Hockey_Player.player_id%TYPE;
	B Hockey_Player.player_name%TYPE;
	C Hockey_Player.position%TYPE;
	D Hockey_Player.team_id%TYPE;
	E Hockey_Player.score%TYPE;
	F Hockey_Player.country%TYPE;
	
	num1 NUMBER:=0;
	num2 NUMBER:=0;
	
	Total NUMBER:=0;
	
	--check1 NUMBER:=0;
	--check2 NUMBER:=0;
	
	--TotalCheck NUMBER:=0;
	
	I Hockey_Player.player_id%TYPE;
	J Hockey_Player.player_name%TYPE;
	K Hockey_Player.position%TYPE;
	L Hockey_Player.team_id%TYPE;
	M Hockey_Player.score%TYPE;
	N Hockey_Player.country%TYPE;
	
	invalid_playerId EXCEPTION;
	--invalid_teamId EXCEPTION;
	
BEGIN
	A:= &x;
	B:= '&y';
	C:= '&z';
	D:= &p;
	E:= &q;
	F:= '&r';
	
	select count(player_id) into num1 from Hockey_Player;
	select count(player_id) into num2 from hockey_player@site_link;
	
	Total:=num1+num2;
	
	--select count(team_id) into check1 from Hockey_Team;
	--select count(teamid) into check2 from hockey_team@site_link;
	
	--TotalCheck:= check1+check2;
	
	--dbms_output.put_line(Total);
	
	IF Total<A THEN
		--IF TotalCheck<D THEN
		insertPlayerinPc(A,B,C,D,E,F);
		--ELSE
			--RAISE invalid_teamId;
		--END IF;
		FOR R IN (SELECT player_id, player_name, position, team_id, score, country from Hockey_Player) LOOP
			I:= R.player_id;
			J:= R.player_name;
			K:= R.position;
			L:= R.team_id;
			M:= R.score;
			N:= R.country;
			
			dbms_output.put_line(I ||'   ' || J || '   '|| K ||'   ' || L || '   '|| M ||'   ' || N);
		END LOOP;
	ELSE
		RAISE invalid_playerId;
	End IF;
	
	
	
EXCEPTION
	WHEN invalid_playerId THEN
		dbms_output.put_line('This Player Id Already Exist. Insert value greater than ' || Total);
		
	--WHEN invalid_teamId THEN
		--dbms_output.put_line('This Team Id Already Exist. Insert value greater than ' || TotalCheck);
		
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE('MANY ROWS DETECTED');
		
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
	
	WHEN ZERO_DIVIDE THEN
		DBMS_OUTPUT.PUT_LINE('CANNOT DIVIDE BY ZERO');
	
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('OTHER ERRORS FOUND');	
	
	
end;
/