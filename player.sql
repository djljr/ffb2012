drop table player;
create table player (name varchar(50) primary key);

insert into player
select name from quarterbacks;

insert into player
select name from kickers;

insert into player
select name from runningbacks;

insert into player
select name from tightends;

insert into player
select name from widereceivers;

insert into player
select name from defenses;
