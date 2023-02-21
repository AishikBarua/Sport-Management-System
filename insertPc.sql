CLEAR screen;

drop table Hockey_Team;

CREATE TABLE Hockey_Team(team_id int, 
					     team_name VARCHAR2(30),
						 league VARCHAR2(30),
						 PRIMARY KEY(team_id));
/*						 
INSERT INTO Hockey_Team values(1,'Washington Capitals','NHL');
INSERT INTO Hockey_Team values(2,'Pittsburg penguines','NHL');
INSERT INTO Hockey_Team values(3,'Edmonton Oilers','NHL');
INSERT INTO Hockey_Team values(4,'Toronto Maple Leafs','NHL');
INSERT INTO Hockey_Team values(5,'Chicago Blackhawks','NHL');
INSERT INTO Hockey_Team values(6,'Boston Bruins','NHL');
INSERT INTO Hockey_Team values(7,'Columbus Blue Jackets','NHL');
INSERT INTO Hockey_Team values(8,'WinniPeg Jets','NHL');
INSERT INTO Hockey_Team values(9,'Dallas Stars','NHL');
INSERT INTO Hockey_Team values(10,'Black Panthers','NHL');
*/
INSERT INTO Hockey_Team values(11,'India','Mens Pro');
INSERT INTO Hockey_Team values(12,'Canada','Mens Pro');
INSERT INTO Hockey_Team values(13,'Pakistan','Mens Pro');
INSERT INTO Hockey_Team values(14,'Australia','Mens Pro');
INSERT INTO Hockey_Team values(15,'Ireland','Mens Pro');
					 
						 
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

drop table Hockey_Player;

CREATE TABLE Hockey_Player(player_id int,
						   player_name VARCHAR2(30),
						   position VARCHAR2(30),
						   team_id int,
						   score int,
						   country VARCHAR2(30),						   
						   PRIMARY KEY(player_id),
						   FOREIGN Key(team_id) REFERENCES Hockey_Team(team_id));
						   
--INSERT into Hockey_Player VALUES(1,'Alex Ovechkin','Wingers',1,107,'Finland');						   
INSERT into Hockey_Player VALUES(2,'Sidney Crosby','Centers',2,37,'Sweden');						   
INSERT into Hockey_Player VALUES(3,'Connor McDavid','Wingers',3,85,'Australia');						   
--INSERT into Hockey_Player VALUES(4,'Auston Mathews','Defenseman',4,209,'USA');						   
--INSERT into Hockey_Player VALUES(5,'Nathan McKinnon','Wingers',5,512,'Canada');						   
--INSERT into Hockey_Player VALUES(6,'Leon Draisaitl','Forward',6,627,'South Africa');						   
INSERT into Hockey_Player VALUES(7,'Patric Bergeron','Defenseman',7,87,'Ireland');						   
INSERT into Hockey_Player VALUES(8,'Nikira Kucherov','Defenseman',8,70,'Czech');						   
INSERT into Hockey_Player VALUES(9,'Patrick kane','Wingers',9,80,'Iceland');						   
INSERT into Hockey_Player VALUES(10,'David Pastrnak','Centers',10,91,'Poland');	
				   
INSERT into Hockey_Player VALUES(11,'Victor Hedman','Wingers',8,11,'Netherland');						   
INSERT into Hockey_Player VALUES(12,'Steven Smith','Forward',7,22,'Germany');						   
INSERT into Hockey_Player VALUES(13,'Chanderpaul','Defenseman',3,55,'Germany');						   
--INSERT into Hockey_Player VALUES(14,'Viv Richard','Wingers',5,165,'Poland');
						   
INSERT into Hockey_Player VALUES(15,'Warne','Centers',14,83,'Netherland');						   
INSERT into Hockey_Player VALUES(16,'Mustaq','Wingers',12,86,'Pakistan');						   
INSERT into Hockey_Player VALUES(17,'Rod Paul','Forward',13,89,'Scotland');						   
INSERT into Hockey_Player VALUES(18,'Roger Binny','Centers',11,81,'India');						   
INSERT into Hockey_Player VALUES(19,'Hardip Singh','Defenseman',11,74,'India');						   
--INSERT into Hockey_Player VALUES(20,'Matt Lablanc','Centers',15,556,'USA');						   
				
						
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------	


drop table Hockey_Assist;

CREATE TABLE Hockey_Assist(player_id int, assist_number int);

INSERT INTO Hockey_Assist VALUES(1,100);
INSERT INTO Hockey_Assist VALUES(2,90);
INSERT INTO Hockey_Assist VALUES(3,200);
INSERT INTO Hockey_Assist VALUES(4,70);
INSERT INTO Hockey_Assist VALUES(5,82);
INSERT INTO Hockey_Assist VALUES(6,500);
INSERT INTO Hockey_Assist VALUES(7,88);
-----INSERT INTO Hockey_Assist VALUES(8,10);
-----INSERT INTO Hockey_Assist VALUES(9,20);
INSERT INTO Hockey_Assist VALUES(10,110);
INSERT INTO Hockey_Assist VALUES(11,190);
INSERT INTO Hockey_Assist VALUES(12,120);
------INSERT INTO Hockey_Assist VALUES(13,50);
INSERT INTO Hockey_Assist VALUES(14,60);
INSERT INTO Hockey_Assist VALUES(15,77);
-----INSERT INTO Hockey_Assist VALUES(16,40);
-----INSERT INTO Hockey_Assist VALUES(17,30);
-----INSERT INTO Hockey_Assist VALUES(18,10);
-----INSERT INTO Hockey_Assist VALUES(19,10);
-----INSERT INTO Hockey_Assist VALUES(20,40);


						
commit;
						

						 