drop table draft;
drop sequence draftpicks;
create sequence draftpicks;

create table draft ( 
    owner varchar(50), 
    player varchar(50), 
    picknumber int4 default (nextval('draftpicks')),
    picktime timestamp default current_timestamp,
    constraint fk_draft_player_player_name foreign key (player) references player(name)
);
