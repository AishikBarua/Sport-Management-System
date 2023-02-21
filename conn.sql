
drop database link site_link;

create database link site_link
 connect to system identified by "1234"
 using '(DESCRIPTION =
       (ADDRESS_LIST =
         (ADDRESS = (PROTOCOL = TCP)
		 (HOST = tcp.in.ngrok.io)
		 (PORT = 12984))
       )
       (CONNECT_DATA =
         (SID = XE)
       )
     )'
;  
