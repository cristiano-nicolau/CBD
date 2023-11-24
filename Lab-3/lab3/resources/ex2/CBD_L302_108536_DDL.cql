 CREATE KEYSPACE IF NOT EXISTS cbd_ex2 WITH replication = {'class': 'SimpleStrategy','replication_factor': 1};

 use cbd_ex2;

CREATE TABLE users(
    username text primary key,
    name text,
    email text,
    ts timestamp
);

CREATE TABLE videos(
    id int,
    author text,
    name text,
    description text,
    tags set<text>,
    ts timestamp,
    primary key ((id), ts)
);

 CREATE TABLE comments(
    id int primary key,
    id_video int,
    author text,
    comment text,
    ts timestamp
);

CREATE TABLE followers(
    id_video int primary key,
    users set<text>
);


CREATE TABLE videos_by_author(
    id int,
    author text,
    name text,
    description text,
    tags set<text>,
    ts timestamp,
    primary key((author), ts)
);

CREATE TABLE events(
    id_video int,
    username text,
    type text,
    ts timestamp,
    instant timestamp,
    primary key((id_video, username), ts)
);

CREATE TABLE ratings(
    id_video int,
    rate int,
    primary key((id_video), rate)
);

CREATE TABLE comments_by_user(
    username text,
    id_video int,
    comment text,
    ts timestamp,
    primary key(username, ts)) WITH CLUSTERING ORDER BY (ts DESC);



CREATE TABLE comments_by_video(
    username text,
    id_video int,
    author text,
    comment text,
    ts timestamp,
    primary key(id_video, ts)) WITH CLUSTERING ORDER BY (ts DESC);

