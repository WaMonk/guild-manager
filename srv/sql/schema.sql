-- Schema fop PostgreSQL
-- Users:
create table users (
    id serial primary key,
    name varchar(50),
    email varchar(50),
    role varchar(10),
    points int
);

-- Auth:
create table auth (
    user_id int references users(id),
    pwd varchar(50),
    UNIQUE(user_id)
);

-- Raids
create table raids (
    id serial primary key,
    name varchar(50)
);

-- Points History
create table points_history (
    user_id int references users(id),
    character_id int references characters(id),
    raid_id int references raids(id),
    value int,
    reason varchar(250)
);

-- Characters
create table characters(
    id serial primary key,
    user_id int references users(id),
    nickname varchar(50),
    race varchar(50),
    class varchar(50)
);

-- Bis List's
create table gear (
    id serial primary key,
    character_id int references characters(id),
    raid_id int references raids(id),
    spec varchar(50),
    stats varchar(100),
    gear json
);


