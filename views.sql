drop view picked;
drop view available;
drop view consolidated;
create or replace view consolidated as
with players as (
select 'QB' as position, name, team, overall, byeweek from quarterbacks
union
select 'KI', name, team, overall, byeweek from kickers
union
select 'RB', name, team, overall, byeweek from runningbacks
union
select 'TE', name, team, overall, byeweek from tightends
union
select 'WR', name, team, overall, byeweek from widereceivers
union
select 'DE', name, null, overall, byeweek from defenses),
injuries as (
select i.name, string_agg(i.date || ', ' || i.status || ', ' || i.comment, '' order by i.date desc) as status
from injuries i
group by i.name)
select p.*, i.status from players p
 left join injuries i on p.name = i.name;

create or replace view available as
select c.*, d.owner, d.picknumber
from consolidated c
 left join draft d on c.name = d.player
where d.picknumber is null;

create or replace view picked as
select c.*, d.owner, d.picknumber
from consolidated c
 join draft d on c.name = d.player;
