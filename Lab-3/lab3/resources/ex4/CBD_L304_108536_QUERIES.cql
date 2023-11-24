-- alinea e)

UPDATE artists SET genres = {'Alternative Rock', 'Pop Rock', 'Indie'} WHERE artist_id = 'COLDPLAY';
UPDATE albums SET title = 'New Title' WHERE album_id = 'PARACHUTES';
UPDATE songs SET duration = 300 WHERE song_id = 'FIX_YOU';
UPDATE users SET playlists[1] = 'New Playlist' WHERE user_id = 'U1';
UPDATE play_history SET song_id = 'HELLO' WHERE user_id = 'U11' AND play_date = '2021-07-15';

DELETE FROM artists WHERE artist_id = 'REGULA';
DELETE FROM albums WHERE album_id = 'DIVIDE';
DELETE FROM songs WHERE song_id = 'YELLOW';
DELETE FROM users WHERE user_id = 'U2';
DELETE FROM play_history WHERE user_id = 'U11' AND play_date = '2021-07-15';


-- alinea f)

