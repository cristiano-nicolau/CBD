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

// 1. Listar todos os artistas

SELECT * FROM artists;

 artist_id          | albums                                                           | genres                                    | name
--------------------+------------------------------------------------------------------+-------------------------------------------+--------------------
         BRUNO_MARS |      ['Doo-Wops & Hooligans', 'Unorthodox Jukebox', '24K Magic'] |                           {'Funk', 'Pop'} |         Bruno Mars
       DAVID_GUETTA |                          ['Listen', 'Nothing but the Beat', '7'] |                          {'EDM', 'House'} |       David Guetta
              BISPO |                                   ['Mais Antigo', 'Fora DHoras'] |                        {'Hip Hop', 'Rap'} |              Bispo
           SEUJORGE |             ['Carolina', 'Cru', 'Músicas para Churrasco Vol. 1'] |            {'Bossa Nova', 'MPB', 'Samba'} |          Seu Jorge
              SLOWJ |      ['The Art of Slowing Down', 'You Are Forgiven', 'Vida Boa'] |                        {'Hip Hop', 'Rap'} |             Slow J
 CHARLOTTE_DE_WITTE |                      ['Selected', 'Closer', 'Return to Nowhere'] |                                {'Techno'} | Charlotte de Witte
         KATY_PERRY |                                    ['Prism', 'Witness', 'Smile'] |                            {'Pop', 'R&B'} |         Katy Perry
              ADELE |                                               ['19', '21', '25'] |            {'Blue-Eyed Soul', 'Pop Soul'} |              Adele
         ED_SHEERAN |                   ['Divide', 'No.6 Collaborations Project', '÷'] |                       {'Folk Pop', 'Pop'} |         Ed Sheeran
             CARLAO |                       ['Quarenta', 'Entretenimento?', 'Os Tais'] |                        {'Hip Hop', 'Rap'} |             Carlao
            BOSS_AC |  ['Ritmo, Amor e Palavras', 'AC para os Amigos', 'Expectativas'] |                        {'Hip Hop', 'Rap'} |            Boss AC
           COLDPLAY |             ['Parachutes', 'A Rush of Blood to the Head', 'X&Y'] | {'Alternative Rock', 'Indie', 'Pop Rock'} |           Coldplay
        AMELIE_LENS |                                 ['Hypnotized', 'Form', 'Recall'] |                                {'Techno'} |        Amelie Lens
      JUSTIN_BIEBER |                           ['My World 2.0', 'Believe', 'Purpose'] |                            {'Pop', 'R&B'} |      Justin Bieber
   AMALIA_RODRIGUES |                    ['Amália Rodrigues e os seus maiores êxitos'] |                                  {'Fado'} |   Amália Rodrigues
          DAMAFARIA |            ['À Procura de Nada', 'Oquelávai', 'Palavras Soltas'] |                        {'Hip Hop', 'Rap'} |               Dama
           DEOLINDA | ['Canção ao Lado', 'Dois Selos e Um Carimbo', 'Mundo Pequenino'] |                         {'Folk', 'Indie'} |           Deolinda
             AVICII |                                       ['True', 'Stories', 'TIM'] |                          {'EDM', 'House'} |             Avicii



// 2. Listar todas as músicas de um determinado artistas

SELECT * FROM songs WHERE artist_id = 'AMELIE_LENS';

 song_id   | album_id   | artist_id   | duration | title
-----------+------------+-------------+----------+-----------
      FORM | HYPNOTIZED | AMELIE_LENS |      324 |      Form
 HYPOCRITE | HYPNOTIZED | AMELIE_LENS |      324 | Hypocrite



// 3. Listar toda a informaçao acerca de um determinado album

SELECT * FROM albums WHERE album_id = 'HYPNOTIZED';

 album_id   | artist_id   | release_date | title      | tracks
------------+-------------+--------------+------------+-----------------------
 HYPNOTIZED | AMELIE_LENS |   2017-09-22 | Hypnotized | ['FORM', 'HYPOCRITE']



// 4. Listar todas as músicas de um determinado album

SELECT * FROM songs WHERE album_id = 'HYPNOTIZED';

 song_id   | album_id   | artist_id   | duration | title
-----------+------------+-------------+----------+-----------
      FORM | HYPNOTIZED | AMELIE_LENS |      324 |      Form
 HYPOCRITE | HYPNOTIZED | AMELIE_LENS |      324 | Hypocrite



// 5. Listar todos os artistas de um determinado género

SELECT * FROM artists WHERE genres CONTAINS 'EDM';

 artist_id    | albums                                  | genres           | name
--------------+-----------------------------------------+------------------+--------------
 DAVID_GUETTA | ['Listen', 'Nothing but the Beat', '7'] | {'EDM', 'House'} | David Guetta
       AVICII |              ['True', 'Stories', 'TIM'] | {'EDM', 'House'} |       Avicii



// 6. Listar todos os usuários e suas playlists

SELECT * FROM users;

 user_id | email                   | playlists                                         | username
---------+-------------------------+---------------------------------------------------+----------
     U11 | cristianonicolau@ua.com | {1: 'Tecno Party', 2: 'bater chinelo noite toda'} |     Nico
      U3 |         user3@email.com |              {1: 'Rock Classics', 2: 'Chill Out'} |    user3
      U9 |         user9@email.com |             {1: 'R&B Hits', 2: 'Soulful Sundays'} |    user9
     U10 |        user10@email.com |            {1: 'Dance Party', 2: 'Road Trip Mix'} |   user10
      U8 |         user8@email.com |        {1: 'Electronic Bliss', 2: 'Gaming Tunes'} |    user8
      U5 |         user5@email.com |               {1: 'Indie Jams', 2: 'Study Beats'} |    user5
      U7 |         user7@email.com |             {1: 'Reggae Vibes', 2: 'Latin Party'} |    user7
      U1 |         user1@email.com |         {1: 'New Playlist', 2: 'Playlist Techno'} |    user1
      U4 |         user4@email.com |            {1: 'Hip Hop Vibes', 2: 'Summer Hits'} |    user4
      U6 |         user6@email.com |    {1: 'Classical Moments', 2: 'Late Night Jazz'} |    user6



// 7. Listar as playlists de um determinado usuário

SELECT playlists FROM users WHERE user_id = 'U11';

 playlists
---------------------------------------------------
 {1: 'Tecno Party', 2: 'bater chinelo noite toda'}



// 8. Listar todas as músicas reproduzidas por um usuário ordenadas por data de reprodução

music_streaming> SELECT * FROM play_history WHERE user_id = 'U11' ORDER BY play_date;

 user_id | play_date                       | song_id
---------+---------------------------------+----------------------
     U11 | 2020-11-01 00:00:00.000000+0000 |              FIX_YOU
     U11 | 2021-01-15 00:00:00.000000+0000 |                 FORM
     U11 | 2021-02-28 00:00:00.000000+0000 |            HYPOCRITE
     U11 | 2021-03-15 00:00:00.000000+0000 |             TITANIUM
     U11 | 2021-04-20 00:00:00.000000+0000 |          WITHOUT_YOU
     U11 | 2021-05-05 00:00:00.000000+0000 | DONTS_LEAVE_ME_ALONE
     U11 | 2021-06-10 00:00:00.000000+0000 |          SAY_MY_NAME
     U11 | 2021-11-15 00:00:00.000000+0000 |              CONTROL
     U11 | 2021-12-01 00:00:00.000000+0000 |                 TRIP



// 9. Listar todas as músicas reproduzidas por um usuário num determinado intervalo de tempo

SELECT * FROM play_history WHERE user_id = 'U11' AND play_date >= '2021-01-01' AND play_date <= '2021-06-30';

 user_id | play_date                       | song_id
---------+---------------------------------+----------------------
     U11 | 2021-01-15 00:00:00.000000+0000 |                 FORM
     U11 | 2021-02-28 00:00:00.000000+0000 |            HYPOCRITE
     U11 | 2021-03-15 00:00:00.000000+0000 |             TITANIUM
     U11 | 2021-04-20 00:00:00.000000+0000 |          WITHOUT_YOU
     U11 | 2021-05-05 00:00:00.000000+0000 | DONTS_LEAVE_ME_ALONE
     U11 | 2021-06-10 00:00:00.000000+0000 |          SAY_MY_NAME



// 10. Listar as musicas das playlists de um determinado usuário

SELECT * FROM playlists WHERE user_id = 'U11';

 playlist_id | songs                                    | title                    | user_id
-------------+------------------------------------------+--------------------------+---------
       U11-1 | ['CONTROL', 'TRIP', 'FORM', 'HYPOCRITE'] |              Tecno Party |     U11
       U11-2 |                    ['FIX_YOU', 'YELLOW'] | bater chinelo noite toda |     U11

