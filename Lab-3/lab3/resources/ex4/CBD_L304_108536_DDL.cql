CREATE KEYSPACE IF NOT EXISTS music_streaming WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

USE music_streaming;

CREATE TABLE IF NOT EXISTS artists (
    artist_id text PRIMARY KEY,
    name TEXT,
    genres SET<TEXT>,
    albums LIST<TEXT>
);


CREATE TABLE IF NOT EXISTS albums (
    album_id text PRIMARY KEY,
    title TEXT,
    release_date DATE,
    artist_id text,
    tracks LIST<text>
);

CREATE TABLE IF NOT EXISTS songs (
    song_id text PRIMARY KEY,
    title TEXT,
    duration INT,
    artist_id text,
    album_id text
);


CREATE TABLE IF NOT EXISTS playlists (
    playlist_id text PRIMARY KEY,
    title TEXT,
    user_id text,
    songs LIST<text>
);


CREATE TABLE IF NOT EXISTS users (
    user_id text PRIMARY KEY,
    username TEXT,
    email TEXT,
    playlists MAP<int, TEXT>
);

CREATE TABLE IF NOT EXISTS play_history (
    user_id text,
    song_id text,
    play_date TIMESTAMP,
    PRIMARY KEY (user_id, play_date)
);



CREATE INDEX IF NOT EXISTS idx_artist_id ON songs (artist_id);

CREATE INDEX IF NOT EXISTS idx_album_id ON songs (album_id);

CREATE INDEX IF NOT EXISTS idx_genres ON artists (genres);

CREATE INDEX IF NOT EXISTS idx_user_id ON playlists (user_id);
