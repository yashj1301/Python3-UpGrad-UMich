
use test;

#creating table without constraints
create table player (
    jersey_no int(3),
    name varchar(30) not null,
    role varchar(10),
    age int(3),
    state varchar(30)
);

desc player;

create table player_roles (
    s_no int unsigned not null,
    role varchar(15) primary key
);

#adding constraints to the table
alter table player 
    add primary key (jersey_no),
    add foreign key (role) references player_roles (role),
    add check(age>=18);

desc player;
    
drop table player;
