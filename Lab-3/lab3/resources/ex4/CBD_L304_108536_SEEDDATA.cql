-- Inserir artistas
INSERT INTO artists (artist_id, name, genres, albums) VALUES ('COLDPLAY', 'Coldplay', {'Alternative Rock', 'Pop Rock'}, ['Parachutes', 'A Rush of Blood to the Head', 'X&Y']);
INSERT INTO artists (artist_id, name, genres, albums) VALUES ('ADELE', 'Adele', {'Pop Soul', 'Blue-Eyed Soul'}, ['19', '21', '25']);
INSERT INTO artists (artist_id, name, genres, albums) VALUES ('ED_SHEERAN', 'Ed Sheeran', {'Pop', 'Folk Pop'}, ['Divide', 'No.6 Collaborations Project', '÷']);
INSERT INTO artists (artist_id, name, genres, albums) VALUES ('BRUNO_MARS', 'Bruno Mars', {'Pop', 'Funk'}, ['Doo-Wops & Hooligans', 'Unorthodox Jukebox', '24K Magic']);
INSERT INTO artists (artist_id, name, genres, albums) VALUES ('JUSTIN_BIEBER', 'Justin Bieber', {'Pop', 'R&B'}, ['My World 2.0', 'Believe', 'Purpose']);
INSERT INTO artists (artist_id, name, genres, albums) VALUES ('KATY_PERRY', 'Katy Perry', {'Pop', 'R&B'}, ['Prism', 'Witness', 'Smile']);
INSERT INTO artists (artist_id, name, genres, albums) VALUES ('AMALIA_RODRIGUES', 'Amália Rodrigues', {'Fado'}, ['Amália Rodrigues e os seus maiores êxitos']);
INSERT INTO artists (artist_id, name, genres, albums) VALUES ('SEUJORGE', 'Seu Jorge', {'MPB', 'Samba', 'Bossa Nova'}, ['Carolina', 'Cru', 'Músicas para Churrasco Vol. 1']);
INSERT INTO artists (artist_id, name, genres, albums) VALUES ('DEOLINDA', 'Deolinda', {'Folk', 'Indie'}, ['Canção ao Lado', 'Dois Selos e Um Carimbo', 'Mundo Pequenino']);
INSERT INTO artists (artist_id, name, genres, albums) VALUES ('DAMAFARIA', 'Dama', {'Hip Hop', 'Rap'}, ['À Procura de Nada', 'Oquelávai', 'Palavras Soltas']);
INSERT INTO artists (artist_id, name, genres, albums) VALUES ('DAVID_GUETTA', 'David Guetta', {'EDM', 'House'}, ['Listen', 'Nothing but the Beat', '7']);
INSERT INTO artists (artist_id, name, genres, albums) VALUES ('AVICII', 'Avicii', {'EDM', 'House'}, ['True', 'Stories', 'TIM']);
INSERT INTO artists (artist_id, name, genres, albums) VALUES ('BISPO','Bispo', {'Rap','Hip Hop'}, ['Mais Antigo','Fora DHoras']);
INSERT INTO artists (artist_id, name, genres, albums) VALUES ('AMELIE_LENS', 'Amelie Lens', {'Techno'}, ['Hypnotized', 'Form', 'Recall']);
INSERT INTO artists (artist_id, name, genres, albums) VALUES ('CHARLOTTE_DE_WITTE', 'Charlotte de Witte', {'Techno'}, ['Selected', 'Closer', 'Return to Nowhere']);
INSERT INTO artists (artist_id, name, genres, albums) VALUES ('SLOWJ', 'Slow J', {'Hip Hop', 'Rap'}, ['The Art of Slowing Down', 'You Are Forgiven', 'Vida Boa']);
INSERT INTO artists (artist_id, name, genres, albums) VALUES ('BOSS_AC', 'Boss AC', {'Hip Hop', 'Rap'}, ['Ritmo, Amor e Palavras', 'AC para os Amigos', 'Expectativas']);
INSERT INTO artists (artist_id, name, genres, albums) VALUES ('CARLAO', 'Carlao', {'Hip Hop', 'Rap'}, ['Quarenta', 'Entretenimento?', 'Os Tais']);
INSERT INTO artists (artist_id, name, genres, albums) VALUES ('REGULA', 'Regula', {'Hip Hop', 'Rap'}, ['Ganja', 'Ouro Sobre Azul', 'Casa']);

 
-- Inserir álbuns
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('PARACHUTES', 'Parachutes', '2000-07-10', 'COLDPLAY', ['FIX_YOU', 'YELLOW']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('A_RUSH_OF_BLOOD_TO_THE_HEAD', 'A Rush of Blood to the Head', '2002-08-26', 'COLDPLAY', ['IN_MY_PLACE', 'THE_SCIENTIST']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('X_Y', 'X&Y', '2005-06-06', 'COLDPLAY', ['SPEED_OF_SOUND', 'TALK']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('19', '19', '2008-01-28', 'ADELE', ['CHASING_PAVEMENTS', 'HOMETOWN_GLORY']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('21', '21', '2011-01-24', 'ADELE', ['ROLLING_IN_THE_DEEP', 'SOMEONE_LIKE_YOU']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('25', '25', '2015-11-20', 'ADELE', ['HELLO', 'SEND_MY_LOVE']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('DIVIDE', 'Divide', '2017-03-03', 'ED_SHEERAN', ['SHAPE_OF_YOU', 'CASTLE_ON_THE_HILL']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('NO_6_COLLABORATIONS_PROJECT', 'No.6 Collaborations Project', '2019-07-12', 'ED_SHEERAN', ['I_DONT_CARE', 'BEAUTIFUL_PEOPLE']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('PRISM', 'Prism', '2013-10-18', 'KATY_PERRY', ['ROAR', 'DARK_HORSE']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('WITNESS', 'Witness', '2017-06-09', 'KATY_PERRY', ['CHAINED_TO_THE_RHYTHM', 'BON_APPETIT']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('SMILE', 'Smile', '2020-08-28', 'KATY_PERRY', ['DAISIES', 'SMILE']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('DOO_WOPS_HOOLIGANS', 'Doo-Wops & Hooligans', '2010-10-05', 'BRUNO_MARS', ['GRENADE', 'JUST_THE_WAY_YOU_ARE']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('UNORTHODOX_JUKEBOX', 'Unorthodox Jukebox', '2012-12-07', 'BRUNO_MARS', ['LOCKED_OUT_OF_HEAVEN', 'WHEN_I_WAS_YOUR_MAN']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('24K_MAGIC', '24K Magic', '2016-11-18', 'BRUNO_MARS', ['24K_MAGIC', 'THATS_WHAT_I_LIKE']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('MY_WORLD_2.0', 'My World 2.0', '2010-03-19', 'JUSTIN_BIEBER', ['BABY', 'NEVER_SAY_NEVER']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('BELIEVE', 'Believe', '2012-06-15', 'JUSTIN_BIEBER', ['BOYFRIEND', 'AS_LONG_AS_YOU_LOVE_ME']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('PURPOSE', 'Purpose', '2015-11-13', 'JUSTIN_BIEBER', ['SORRY', 'LOVE_YOURSELF']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('MAIS_ANTIGO', 'Mais Antigo', '2010-09-13', 'BISPO', ['SEMPRE_ACESSO', 'SEMPRE_TE_ESPERO']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('FORA_D_HORAS', 'Fora DHoras', '2015-09-25', 'BISPO', ['QUERO_FAZER_HAPPY']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('HYPNOTIZED', 'Hypnotized', '2017-09-22', 'AMELIE_LENS', ['FORM', 'HYPOCRITE']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('SELECTED', 'Selected', '2016-09-19', 'CHARLOTTE_DE_WITTE', ['TRIP', 'CONTROL']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('NOTHING_BUT_THE_BEAT', 'Nothing but the Beat', '2011-08-26', 'DAVID_GUETTA', ['TITANIUM', 'WITHOUT_YOU']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('7', '7', '2018-09-14', 'DAVID_GUETTA', ['DONTS_LEAVE_ME_ALONE', 'SAY_MY_NAME']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('TIM', 'TIM', '2019-06-06', 'AVICII', ['TOUGH_LOVE', 'HEAVEN']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('THE_ART_OF_SLOWING_DOWN', 'The Art of Slowing Down', '2017-05-12', 'SLOWJ', ['TEMA', 'BEM-VINDO_AO_JAZZ']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('YOU_ARE_FORGIVEN', 'You Are Forgiven', '2018-04-27', 'SLOWJ', ['HISTORIAS_DA_NOITE']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('VIDA_BOA', 'Vida Boa', '2020-10-30', 'SLOWJ', ['VIDA_BOA', 'LINHAS TORTAS']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('QUARENTA', 'Quarenta', '2015-10-30', 'CARLAO', ['OS_DEZ_MANDAMENTOS', 'DUETOS']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('ENTRETENIMENTO', 'Entretenimento?', '2018-11-23', 'CARLAO', ['CUIDADO', 'DOIS_DEMOS']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('OS_TAIS', 'Os Tais', '2016-03-11', 'CARLAO', ['OS_TAIS', 'BIG_BANG']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('RITMO_AMOR_E_PALAVRAS', 'Ritmo, Amor e Palavras', '2009-11-23', 'BOSS_AC', ['QUE_DIZER_MAIS', 'BITES_AND_SCRATCHES']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('AC_PARA_OS_AMIGOS', 'AC para os Amigos', '2013-04-12', 'BOSS_AC', ['DAS_2_UUM', 'CUIDA_DE_MIM']);
INSERT INTO albums (album_id, title, release_date, artist_id, tracks) VALUES ('EXPECTATIVAS', 'Expectativas', '2018-09-21', 'BOSS_AC', ['QUANDO_DA_SERIO', 'VEM_PRONTO']);


-- Inserir músicas
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('FIX_YOU', 'Fix You', 295, 'COLDPLAY', 'PARACHUTES');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('YELLOW', 'Yellow', 268, 'COLDPLAY', 'PARACHUTES');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('IN_MY_PLACE', 'In My Place', 230, 'COLDPLAY', 'A_RUSH_OF_BLOOD_TO_THE_HEAD');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('THE_SCIENTIST', 'The Scientist', 309, 'COLDPLAY', 'A_RUSH_OF_BLOOD_TO_THE_HEAD');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('SPEED_OF_SOUND', 'Speed of Sound', 455, 'COLDPLAY', 'X_Y');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('TALK', 'Talk', 357, 'COLDPLAY', 'X_Y');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('CHASING_PAVEMENTS', 'Chasing Pavements', 228, 'ADELE', '19');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('HOMETOWN_GLORY', 'Hometown Glory', 285, 'ADELE', '19');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('ROLLING_IN_THE_DEEP', 'Rolling in the Deep', 228, 'ADELE', '21');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('SOMEONE_LIKE_YOU', 'Someone Like You', 285, 'ADELE', '21');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('HELLO', 'Hello', 228, 'ADELE', '25');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('SEND_MY_LOVE', 'Send My Love', 285, 'ADELE', '25');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('SHAPE_OF_YOU', 'Shape of You', 228, 'ED_SHEERAN', 'DIVIDE');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('CASTLE_ON_THE_HILL', 'Castle on the Hill', 285, 'ED_SHEERAN', 'DIVIDE');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('I_DONT_CARE', 'I Dont Care', 228, 'ED_SHEERAN', 'NO_6_COLLABORATIONS_PROJECT');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('BEAUTIFUL_PEOPLE', 'Beautiful People', 285, 'ED_SHEERAN', 'NO_6_COLLABORATIONS_PROJECT');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('ROAR', 'Roar', 228, 'KATY_PERRY', 'PRISM');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('DARK_HORSE', 'Dark Horse', 285, 'KATY_PERRY', 'PRISM');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('CHAINED_TO_THE_RHYTHM', 'Chained to the Rhythm', 228, 'KATY_PERRY', 'WITNESS');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('BON_APPETIT', 'Bon Appetit', 285, 'KATY_PERRY', 'WITNESS');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('DAISIES', 'Daisies', 228, 'KATY_PERRY', 'SMILE');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('SMILE', 'Smile', 285, 'KATY_PERRY', 'SMILE');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('GRENADE', 'Grenade', 228, 'BRUNO_MARS', 'DOO_WOPS_HOOLIGANS');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('JUST_THE_WAY_YOU_ARE', 'Just the Way You Are', 285, 'BRUNO_MARS', 'DOO_WOPS_HOOLIGANS');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('LOCKED_OUT_OF_HEAVEN', 'Locked Out of Heaven', 228, 'BRUNO_MARS', 'UNORTHODOX_JUKEBOX');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('TEMA', 'Tema', 235, 'SLOWJ', 'THE_ART_OF_SLOWING_DOWN');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('VIDA_BOA', 'Vida Boa', 228, 'SLOWJ', 'VIDA_BOA');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('OS_DEZ_MANDAMENTOS', 'Os Dez Mandamentos', 248, 'CARLAO', 'QUARENTA');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('OS_TAIS', 'Os Tais', 215, 'CARLAO', 'OS_TAIS');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('QUE_DIZER_MAIS', 'Que Dizer Mais', 215, 'BOSS_AC', 'RITMO_AMOR_E_PALAVRAS');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('TITANIUM', 'Titanium', 245, 'DAVID_GUETTA', 'NOTHING_BUT_THE_BEAT');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('WITHOUT_YOU', 'Without You', 221, 'DAVID_GUETTA', 'NOTHING_BUT_THE_BEAT');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('DONTS_LEAVE_ME_ALONE', 'Don''t Leave Me Alone', 210, 'DAVID_GUETTA', '7');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('SAY_MY_NAME', 'Say My Name', 210, 'DAVID_GUETTA', '7');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('FORM', 'Form', 324, 'AMELIE_LENS', 'HYPNOTIZED');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('HYPOCRITE', 'Hypocrite', 324, 'AMELIE_LENS', 'HYPNOTIZED');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('TRIP', 'Trip', 310, 'CHARLOTTE_DE_WITTE', 'SELECTED');
INSERT INTO songs (song_id, title, duration, artist_id, album_id) VALUES ('CONTROL', 'Control', 318, 'CHARLOTTE_DE_WITTE', 'SELECTED');


-- Inserir user
INSERT INTO users (user_id, username, email, playlists) VALUES ('U1', 'user1', 'user1@email.com',
  {
    1: 'Playlist 1',
    2: 'Playlist Techno'
  }
);
INSERT INTO users (user_id, username, email, playlists) VALUES ('U2', 'user2', 'user2@email.com',{
  1: 'Playlist Trance',
  2: 'Musicas de Amor'
});
INSERT INTO users (user_id, username, email, playlists) VALUES ('U3', 'user3', 'user3@email.com', {1: 'Rock Classics', 2: 'Chill Out'});
INSERT INTO users (user_id, username, email, playlists) VALUES ('U4', 'user4', 'user4@email.com', {1: 'Hip Hop Vibes', 2: 'Summer Hits'});
INSERT INTO users (user_id, username, email, playlists) VALUES ('U5', 'user5', 'user5@email.com', {1: 'Indie Jams', 2: 'Study Beats'});
INSERT INTO users (user_id, username, email, playlists) VALUES ('U6', 'user6', 'user6@email.com', {1: 'Classical Moments', 2: 'Late Night Jazz'});
INSERT INTO users (user_id, username, email, playlists) VALUES ('U7', 'user7', 'user7@email.com', {1: 'Reggae Vibes', 2: 'Latin Party'});
INSERT INTO users (user_id, username, email, playlists) VALUES ('U8', 'user8', 'user8@email.com', {1: 'Electronic Bliss', 2: 'Gaming Tunes'});
INSERT INTO users (user_id, username, email, playlists) VALUES ('U9', 'user9', 'user9@email.com', {1: 'R&B Hits', 2: 'Soulful Sundays'});
INSERT INTO users (user_id, username, email, playlists) VALUES ('U10', 'user10', 'user10@email.com', {1: 'Dance Party', 2: 'Road Trip Mix'});
INSERT INTO users (user_id, username, email, playlists) VALUES ('U11', 'Nico', 'cristianonicolau@ua.com', {1: 'Tecno Party', 2: 'bater chinelo noite toda'});



-- Inserir histórico de reprodução
INSERT INTO play_history (user_id, song_id, play_date) VALUES ('U11', 'FIX_YOU', '2020-11-01');
INSERT INTO play_history (user_id, song_id, play_date) VALUES ('U2', 'YELLOW', '2021-10-15');
INSERT INTO play_history (user_id, song_id, play_date) VALUES ('U4', 'IN_MY_PLACE', '2020-12-05');
INSERT INTO play_history (user_id, song_id, play_date) VALUES ('U4', 'THE_SCIENTIST', '2021-01-20');
INSERT INTO play_history (user_id, song_id, play_date) VALUES ('U4', 'SPEED_OF_SOUND', '2021-02-10');
INSERT INTO play_history (user_id, song_id, play_date) VALUES ('U10', 'TALK', '2021-03-25');
INSERT INTO play_history (user_id, song_id, play_date) VALUES ('U9', 'CHASING_PAVEMENTS', '2021-04-30');
INSERT INTO play_history (user_id, song_id, play_date) VALUES ('U3', 'HOMETOWN_GLORY', '2021-05-15');
INSERT INTO play_history (user_id, song_id, play_date) VALUES ('U6', 'ROLLING_IN_THE_DEEP', '2021-06-20');
INSERT INTO play_history (user_id, song_id, play_date) VALUES ('U5', 'SOMEONE_LIKE_YOU', '2021-07-05');
INSERT INTO play_history (user_id, song_id, play_date) VALUES ('U7', 'HELLO', '2021-08-10');
INSERT INTO play_history (user_id, song_id, play_date) VALUES ('U8', 'SEND_MY_LOVE', '2021-09-25');
INSERT INTO play_history (user_id, song_id, play_date) VALUES ('U1', 'SHAPE_OF_YOU', '2021-10-30');
INSERT INTO play_history (user_id, song_id, play_date) VALUES ('U11', 'CONTROL', '2021-11-15');
INSERT INTO play_history (user_id, song_id, play_date) VALUES ('U11', 'TRIP', '2021-12-01');
INSERT INTO play_history (user_id, song_id, play_date) VALUES ('U11', 'FORM', '2021-01-15');
INSERT INTO play_history (user_id, song_id, play_date) VALUES ('U11', 'HYPOCRITE', '2021-02-28');
INSERT INTO play_history (user_id, song_id, play_date) VALUES ('U11', 'TITANIUM', '2021-03-15');
INSERT INTO play_history (user_id, song_id, play_date) VALUES ('U11', 'WITHOUT_YOU', '2021-04-20');
INSERT INTO play_history (user_id, song_id, play_date) VALUES ('U11', 'DONTS_LEAVE_ME_ALONE', '2021-05-05');
INSERT INTO play_history (user_id, song_id, play_date) VALUES ('U11', 'SAY_MY_NAME', '2021-06-10');
INSERT INTO play_history (user_id, song_id, play_date) VALUES ('U11', 'I_DONT_CARE', '2021-07-15');
