--Reference:-  https://drive.google.com/file/d/17s-ulxIpngVyawCaWKaSwre5B-JA4yiK/view
1)
SELECT AuthName
FROM Author NATURAL JOIN Writes
GROUP BY AuthCode
HAVING COUNT(AuthCode)>1;


2)
SELECT BookName
FROM Book NATURAL JOIN Writes
GROUP BY BookCode
HAVING COUNT(BookCode)>1;


3)
select BookCode,PubCode
from Publishes
order by PubCode;


4)
create table tmp as select PubCity  from Publisher group by PubCity order by count(*) desc limit 1;
select BookName  from Book  where BookCode in (Select BookCode from Publishes natural join Publisher where PubCity in(select * from tmp));
drop table tmp;


5)
select distinct AuthName from Author natural join Writes natural join Publishes where PubCode in (select PubCode from Publisher where PubName LIKE 'S%');



6)
select distinct A.AuthName from (select * from (Sends Natural Join Publishes) Natural join Author) as A, (select * from (Sends Natural Join Publishes) Natural join Author) as B where A.AuthName=B.AuthName and A.PubCode!=B.PubCode;



7)
CREATE VIEW BombayBooks AS
select AuthName, BookName, PubName from (((Writes natural join Book) natural join Author) natural join Publishes) natural join  Publisher where PubCity='Mumbai';

8) 
delimiter //
create procedure FindBooks(IN name varchar(80)) begin select BookName from Publishes natural join Publisher natural join Book where PubName = name; end//
delimiter ;
call FindBooks('Kejriwal Publications');


9)
delimiter //
create procedure CityPubsh(IN city varchar(80)) begin select PubName from Publisher where PubCity = city; end//
call CityPubsh('Mumbai')//




10.)

select BookName from Writes natural join Book where AuthCode in (select AuthCode from Writes Natural join Book where BookName='Philosophers Stone') and BookName !='Philosophers Stone' ; 


11.)
select AuthName from Author where AuthName LIKE '%ll%';

