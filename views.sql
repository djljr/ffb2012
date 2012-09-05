drop view picked;
drop view available;
drop view consolidated;

create view consolidated as
select p.*, i.status 
from (
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
    select 'DE', name, null, overall, byeweek from defenses
) p
 left join (
    select i.name, group_concat(i.date || ', ' || i.status || ', ' || i.comment, '') as status
    from injuries i
    group by i.name
 ) i on p.name = i.name;

create view available as
select c.*, d.owner, d.picknumber
from consolidated c
 left join draft d on c.name = d.player
where d.picknumber is null;

create view picked as
select c.*, d.owner, d.picknumber
from consolidated c
 join draft d on c.name = d.player;
