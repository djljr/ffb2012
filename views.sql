drop view consolidated;
create or replace view consolidated as
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
select 'DE', name, null, overall, byeweek from defenses;
