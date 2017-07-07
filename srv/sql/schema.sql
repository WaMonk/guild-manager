-- Schema fop PostgreSQL
-- Users:
create table users (
    id serial primary key,
    name varchar(50),
    email varchar(50),
    role varchar(10),
    points int,
    status varchar(10)
);

-- Auth:
create table auth (
    user_id int references users(id),
    login varchar(50),
    auth_token text,
    UNIQUE(user_id)
);

-- Raids
create table raids (
    id serial primary key,
    name varchar(50)
);

-- Encounters
create table encounters (
    id serial primary key,
    raid_id int references raids(id),
    name varchar(50),
    description text
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

-- Gear history
create table gear_history (
    id serial primary key,
    character_id int references characters(id),
    encounter_id int references encounters(id),
    history_points_id int references points_history(id),
    date timestamp,
    item json
);
