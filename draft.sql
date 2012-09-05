drop table draft;
drop sequence draftpicks;
create sequence draftpicks;

create table draft ( 
    owner varchar(50), 
    player varchar(50), 
    picknumber int4 primary key autoincrement,
    picktime timestamp default date('now'),
    constraint fk_draft_player_player_name foreign key (player) references player(name)
);
