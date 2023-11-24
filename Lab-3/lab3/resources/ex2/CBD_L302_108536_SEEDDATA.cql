use cbd_ex2;

INSERT INTO cbd_ex2.users (username, name, email, ts) VALUES ('cristianoronaldo', 'Cristiano Ronaldo', 'ronaldo@football.com', toTimestamp(now()));
INSERT INTO cbd_ex2.users (username, name, email, ts) VALUES ('messi10', 'Lionel Messi', 'messi@football.com', toTimestamp(now()));
INSERT INTO cbd_ex2.users (username, name, email, ts) VALUES ('neymar11', 'Neymar Jr.', 'neymar@football.com', toTimestamp(now()));
INSERT INTO cbd_ex2.users (username, name, email, ts) VALUES ('mbappe7', 'Kylian Mbappe', 'mbappe@football.com', toTimestamp(now()));
INSERT INTO cbd_ex2.users (username, name, email, ts) VALUES ('lewandowski9', 'Robert Lewandowski', 'lewandowski@football.com', toTimestamp(now()));
INSERT INTO cbd_ex2.users (username, name, email, ts) VALUES ('salah11', 'Mohamed Salah', 'salah@football.com', toTimestamp(now()));
INSERT INTO cbd_ex2.users (username, name, email, ts) VALUES ('debruyne17', 'Kevin De Bruyne', 'debruyne@football.com', toTimestamp(now()));
INSERT INTO cbd_ex2.users (username, name, email, ts) VALUES ('kane9', 'Harry Kane', 'kane@football.com', toTimestamp(now()));
INSERT INTO cbd_ex2.users (username, name, email, ts) VALUES ('modric10', 'Luka Modric', 'modric@football.com', toTimestamp(now()));
INSERT INTO cbd_ex2.users (username, name, email, ts) VALUES ('ramos4', 'Sergio Ramos', 'ramos@football.com', toTimestamp(now()));
INSERT INTO cbd_ex2.users (username, name, email, ts) VALUES ('diogo99', 'Diogo Costa', 'diogocosta@football.com', toTimestamp(now()));

INSERT INTO cbd_ex2.videos (id, author, name, description, tags, ts) VALUES (1, 'cristianoronaldo', 'Gol de bicicleta incrível', 'Melhores momentos do jogo', {'football', 'highlights'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos (id, author, name, description, tags, ts) VALUES (2, 'messi10', 'Dribles mágicos', 'Magia nos pés de Messi', {'football', 'skills'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos (id, author, name, description, tags, ts) VALUES (3, 'neymar11', 'Gols e assistências', 'Show de Neymar em campo', {'football', 'highlights'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos (id, author, name, description, tags, ts) VALUES (4, 'mbappe7', 'Velocidade e habilidade', 'Mbappe brilha novamente', {'football', 'speed'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos (id, author, name, description, tags, ts) VALUES (5, 'lewandowski9', 'Hat-trick impressionante', 'Lewandowski faz história', {'football', 'goals'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos (id, author, name, description, tags, ts) VALUES (6, 'salah11', 'Gols decisivos', 'Salah lidera o ataque', {'football', 'highlights'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos (id, author, name, description, tags, ts) VALUES (7, 'debruyne17', 'Assistências incríveis', 'De Bruyne, o maestro', {'football', 'assists'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos (id, author, name, description, tags, ts) VALUES (8, 'kane9', 'Artilheiro implacável', 'Kane balanca as redes', {'football', 'goals'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos (id, author, name, description, tags, ts) VALUES (9, 'modric10', 'Controle de jogo', 'Modric, o cérebro da equipa', {'football', 'skills'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos (id, author, name, description, tags, ts) VALUES (10, 'ramos4', 'Defesa sólida', 'Sergio Ramos, o pilar defensivo', {'football', 'defense'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos (id, author, name, description, tags, ts) VALUES (11, 'ramos4', 'Gol de cabeca poderoso', 'Ramos mostra sua forca aérea', {'football', 'highlights'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos (id, author, name, description, tags, ts) VALUES (12, 'cristianoronaldo', 'Treino de habilidades', 'Ronaldo aprimorando suas técnicas', {'football', 'training'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos (id, author, name, description, tags, ts) VALUES (13, 'neymar11', 'Jogadas extravagantes', 'Neymar esbanja criatividade', {'football', 'skills'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos (id, author, name, description, tags, ts) VALUES (14, 'lewandowski9', 'Entrevista pós-jogo', 'Lewandowski comenta a partida', {'football', 'interview'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos (id, author, name, description, tags, ts) VALUES (15, 'diogo99', 'Melhores defesas', 'Noite de champions incrivel', {'football', 'highlights','goalkepar'}, toTimestamp(now()));


INSERT INTO cbd_ex2.videos_by_author (id, author, name, description, tags, ts) VALUES (1, 'cristianoronaldo', 'Gol de bicicleta incrível', 'Melhores momentos do jogo', {'football', 'highlights'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos_by_author (id, author, name, description, tags, ts) VALUES (2, 'messi10', 'Dribles mágicos', 'Magia nos pés de Messi', {'football', 'skills'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos_by_author (id, author, name, description, tags, ts) VALUES (3, 'neymar11', 'Gols e assistências', 'Show de Neymar em campo', {'football', 'highlights'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos_by_author (id, author, name, description, tags, ts) VALUES (4, 'mbappe7', 'Velocidade e habilidade', 'Mbappe brilha novamente', {'football', 'speed'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos_by_author (id, author, name, description, tags, ts) VALUES (5, 'lewandowski9', 'Hat-trick impressionante', 'Lewandowski faz história', {'football', 'goals'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos_by_author (id, author, name, description, tags, ts) VALUES (6, 'salah11', 'Gols decisivos', 'Salah lidera o ataque', {'football', 'highlights'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos_by_author (id, author, name, description, tags, ts) VALUES (7, 'debruyne17', 'Assistências incríveis', 'De Bruyne, o maestro', {'football', 'assists'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos_by_author (id, author, name, description, tags, ts) VALUES (8, 'kane9', 'Artilheiro implacável', 'Kane balanca as redes', {'football', 'goals'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos_by_author (id, author, name, description, tags, ts) VALUES (9, 'modric10', 'Controle de jogo', 'Modric, o cérebro do time', {'football', 'skills'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos_by_author (id, author, name, description, tags, ts) VALUES (10, 'ramos4', 'Defesa sólida', 'Sergio Ramos, o pilar defensivo', {'football', 'defense'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos_by_author (id, author, name, description, tags, ts) VALUES (11, 'ramos4', 'Gol de cabeca poderoso', 'Ramos mostra sua forca aérea', {'football', 'highlights'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos_by_author (id, author, name, description, tags, ts) VALUES (12, 'cristianoronaldo', 'Treino de habilidades', 'Ronaldo aprimorando suas técnicas', {'football', 'training'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos_by_author (id, author, name, description, tags, ts) VALUES (13, 'neymar11', 'Jogadas extravagantes', 'Neymar esbanja criatividade', {'football', 'skills'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos_by_author (id, author, name, description, tags, ts) VALUES (14, 'lewandowski9', 'Entrevista pós-jogo', 'Lewandowski comenta a partida', {'football', 'interview'}, toTimestamp(now()));
INSERT INTO cbd_ex2.videos_by_author (id, author, name, description, tags, ts) VALUES (15, 'diogo99', 'Melhores defesas', 'Noite de champions incrivel', {'football', 'highlights','goalkepar'}, toTimestamp(now()));

INSERT INTO cbd_ex2.comments (id, id_video, author, comment, ts) VALUES (1, 1, 'messi10', 'Que golaco!', toTimestamp(now()));
INSERT INTO cbd_ex2.comments (id, id_video, author, comment, ts) VALUES (2, 1, 'neymar11', 'Golaco mesmo!', toTimestamp(now()));
INSERT INTO cbd_ex2.comments (id, id_video, author, comment, ts) VALUES (3, 10, 'mbappe7', 'Eso meu rei!', toTimestamp(now()));
INSERT INTO cbd_ex2.comments (id, id_video, author, comment, ts) VALUES (4, 6, 'cristianoronaldo', 'Que drible!', toTimestamp(now()));
INSERT INTO cbd_ex2.comments (id, id_video, author, comment, ts) VALUES (5, 2, 'lewandowski9', 'Que habilidade!', toTimestamp(now()));
INSERT INTO cbd_ex2.comments (id, id_video, author, comment, ts) VALUES (6, 9, 'salah11', 'Que drible!', toTimestamp(now()));
INSERT INTO cbd_ex2.comments (id, id_video, author, comment, ts) VALUES (7, 15, 'cristianoronaldo', 'Voa meu menino', toTimestamp(now()));
INSERT INTO cbd_ex2.comments (id, id_video, author, comment, ts) VALUES (8, 7, 'kane9' , 'Jogas tanto', toTimestamp(now()));
INSERT INTO cbd_ex2.comments (id, id_video, author, comment, ts) VALUES (9, 13, 'kane9' , 'Es lindo rei', toTimestamp(now()));
INSERT INTO cbd_ex2.comments (id, id_video, author, comment, ts) VALUES (10, 5, 'diogo99' , 'Mais historia no futebol mundial, lindo', toTimestamp(now()));
INSERT INTO cbd_ex2.comments (id, id_video, author, comment, ts) VALUES (11, 11, 'neymar11', 'Golaco mesmo!', toTimestamp(now()));
INSERT INTO cbd_ex2.comments (id, id_video, author, comment, ts) VALUES (12, 3, 'kane9' , 'jogas tanto com a bola nos pes', toTimestamp(now()));
INSERT INTO cbd_ex2.comments (id, id_video, author, comment, ts) VALUES (13, 12, 'ramos4' , 'Saudades tuas Rei <3', toTimestamp(now()));

INSERT INTO cbd_ex2.followers (id_video, users) VALUES (1, {'messi10','ramos4','diogo99'});
INSERT INTO cbd_ex2.followers (id_video,users) VALUES (2,{'salah11','lewandowski9','kane9'});
INSERT INTO cbd_ex2.followers (id_video,users) VALUES (3,{'neymar11','messi10','cristianoronaldo'});
INSERT INTO cbd_ex2.followers (id_video,users) VALUES (4,{'mbappe7','ramos4','diogo99'});
INSERT INTO cbd_ex2.followers (id_video,users) VALUES (5,{'lewandowski9','ramos4','diogo99'});
INSERT INTO cbd_ex2.followers (id_video,users) VALUES (6,{'salah11','ramos4','diogo99'});
INSERT INTO cbd_ex2.followers (id_video,users) VALUES (7,{'debruyne17','ramos4','diogo99'});
INSERT INTO cbd_ex2.followers (id_video,users) VALUES (8,{'kane9','ramos4','diogo99'});
INSERT INTO cbd_ex2.followers (id_video,users) VALUES (9,{'modric10','ramos4','diogo99'});
INSERT INTO cbd_ex2.followers (id_video,users) VALUES (10,{'ramos4','diogo99'});
INSERT INTO cbd_ex2.followers (id_video,users) VALUES (11,{'ramos4','diogo99'});
INSERT INTO cbd_ex2.followers (id_video,users) VALUES (12,{'cristianoronaldo','ramos4','diogo99'});
INSERT INTO cbd_ex2.followers (id_video,users) VALUES (13,{'neymar11','ramos4','diogo99'});


INSERT INTO cbd_ex2.events (id_video, username, type, ts, instant) VALUES (7, 'cristianoronaldo', 'pause', toTimestamp(now()), toTimestamp(now()));
INSERT INTO cbd_ex2.events (id_video, username, type, ts, instant) VALUES (7, 'cristianoronaldo', 'play', toTimestamp(now()), toTimestamp(now()));
INSERT INTO cbd_ex2.events (id_video, username, type, ts, instant) VALUES (9, 'neymar11', 'pause', toTimestamp(now()), toTimestamp(now()));
INSERT INTO cbd_ex2.events (id_video, username, type, ts, instant) VALUES (9, 'neymar11', 'play', toTimestamp(now()), toTimestamp(now()));
INSERT INTO cbd_ex2.events (id_video, username, type, ts, instant) VALUES (12, 'ramos4', 'pause', toTimestamp(now()), toTimestamp(now()));
INSERT INTO cbd_ex2.events (id_video, username, type, ts, instant) VALUES (2, 'ramos4', 'pause', toTimestamp(now()), toTimestamp(now()));
INSERT INTO cbd_ex2.events (id_video, username, type, ts, instant) VALUES (6, 'messi10', 'pause', toTimestamp(now()), toTimestamp(now()));
INSERT INTO cbd_ex2.events (id_video, username, type, ts, instant) VALUES (1, 'kane9', 'pause', toTimestamp(now()), toTimestamp(now()));
INSERT INTO cbd_ex2.events (id_video, username, type, ts, instant) VALUES (8, 'lewandowski9', 'pause', toTimestamp(now()), toTimestamp(now()));
INSERT INTO cbd_ex2.events (id_video, username, type, ts, instant) VALUES (3, 'salah11', 'pause', toTimestamp(now()), toTimestamp(now()));
INSERT INTO cbd_ex2.events (id_video, username, type, ts, instant) VALUES (8, 'mbappe7', 'pause', toTimestamp(now()), toTimestamp(now()));
INSERT INTO cbd_ex2.events (id_video, username, type, ts, instant) VALUES (4, 'debruyne17', 'pause', toTimestamp(now()), toTimestamp(now()));


INSERT INTO cbd_ex2.ratings (id_video, rate) VALUES (1, 1);
INSERT INTO cbd_ex2.ratings (id_video, rate) VALUES (1, 1);
INSERT INTO cbd_ex2.ratings (id_video, rate) VALUES (1, 5);
INSERT INTO cbd_ex2.ratings (id_video, rate) VALUES (6, 5);
INSERT INTO cbd_ex2.ratings (id_video, rate) VALUES (7, 5);
INSERT INTO cbd_ex2.ratings (id_video, rate) VALUES (2, 4);
INSERT INTO cbd_ex2.ratings (id_video, rate) VALUES (10, 4);
INSERT INTO cbd_ex2.ratings (id_video, rate) VALUES (9, 5);
INSERT INTO cbd_ex2.ratings (id_video, rate) VALUES (8, 2);
INSERT INTO cbd_ex2.ratings (id_video, rate) VALUES (6, 4);


INSERT INTO cbd_ex2.comments_by_user (username, id_video, comment, ts) VALUES ('messi10', 1, 'Que golaco!', toTimestamp(now()));
INSERT INTO cbd_ex2.comments_by_user (username, id_video, comment, ts) VALUES ('neymar11', 1, 'Golaco mesmo!', toTimestamp(now()));
INSERT INTO cbd_ex2.comments_by_user (username, id_video, comment, ts) VALUES ('mbappe7', 10, 'Eso meu rei!', toTimestamp(now()));
INSERT INTO cbd_ex2.comments_by_user (username, id_video, comment, ts) VALUES ('cristianoronaldo', 6, 'Que drible!', toTimestamp(now()));
INSERT INTO cbd_ex2.comments_by_user (username, id_video, comment, ts) VALUES ('lewandowski9', 2, 'Que habilidade!', toTimestamp(now()));
INSERT INTO cbd_ex2.comments_by_user (username, id_video, comment, ts) VALUES ('salah11', 9, 'Que drible!', toTimestamp(now()));
INSERT INTO cbd_ex2.comments_by_user (username, id_video, comment, ts) VALUES ('cristianoronaldo', 15, 'Voa meu menino', toTimestamp(now()));
INSERT INTO cbd_ex2.comments_by_user (username, id_video, comment, ts) VALUES ('kane9', 7, 'Jogas tanto', toTimestamp(now()));
INSERT INTO cbd_ex2.comments_by_user (username, id_video, comment, ts) VALUES ('kane9', 13, 'Es lindo rei', toTimestamp(now()));
INSERT INTO cbd_ex2.comments_by_user (username, id_video, comment, ts) VALUES ('diogo99', 5, 'Mais historia no futebol mundial, lindo', toTimestamp(now()));
INSERT INTO cbd_ex2.comments_by_user (username, id_video, comment, ts) VALUES ('neymar11', 11, 'Golaco mesmo!', toTimestamp(now()));
INSERT INTO cbd_ex2.comments_by_user (username, id_video, comment, ts) VALUES ('kane9', 3, 'jogas tanto com a bola nos pes', toTimestamp(now()));
INSERT INTO cbd_ex2.comments_by_user (username, id_video, comment, ts) VALUES ('ramos4', 12, 'Saudades tuas Rei <3', toTimestamp(now()));


INSERT INTO cbd_ex2.comments_by_video (username, id_video, author, comment, ts) VALUES ('messi10', 1, 'messi10', 'Que golaco!', toTimestamp(now()));
INSERT INTO cbd_ex2.comments_by_video (username, id_video, author, comment, ts) VALUES ('neymar11', 1, 'neymar11', 'Golaco mesmo!', toTimestamp(now()));
INSERT INTO cbd_ex2.comments_by_video (username, id_video, author, comment, ts) VALUES ('mbappe7', 10, 'mbappe7', 'Eso meu rei!', toTimestamp(now()));
INSERT INTO cbd_ex2.comments_by_video (username, id_video, author, comment, ts) VALUES ('cristianoronaldo', 6, 'cristianoronaldo', 'Que drible!', toTimestamp(now()));
INSERT INTO cbd_ex2.comments_by_video (username, id_video, author, comment, ts) VALUES ('lewandowski9', 2, 'lewandowski9', 'Que habilidade!', toTimestamp(now()));
INSERT INTO cbd_ex2.comments_by_video (username, id_video, author, comment, ts) VALUES ('salah11', 9, 'salah11', 'Que drible!', toTimestamp(now()));
INSERT INTO cbd_ex2.comments_by_video (username, id_video, author, comment, ts) VALUES ('cristianoronaldo', 15, 'cristianoronaldo', 'Voa meu menino', toTimestamp(now()));
INSERT INTO cbd_ex2.comments_by_video (username, id_video, author, comment, ts) VALUES ('kane9', 7, 'kane9', 'Jogas tanto', toTimestamp(now()));
INSERT INTO cbd_ex2.comments_by_video (username, id_video, author, comment, ts) VALUES ('kane9', 13, 'kane9', 'Es lindo rei', toTimestamp(now()));
INSERT INTO cbd_ex2.comments_by_video (username, id_video, author, comment, ts) VALUES ('diogo99', 5, 'diogo99', 'Mais historia no futebol mundial, lindo', toTimestamp(now()));
INSERT INTO cbd_ex2.comments_by_video (username, id_video, author, comment, ts) VALUES ('neymar11', 11, 'neymar11', 'Golaco mesmo!', toTimestamp(now()));
INSERT INTO cbd_ex2.comments_by_video (username, id_video, author, comment, ts) VALUES ('kane9', 3, 'kane9', 'jogas tanto com a bola nos pes', toTimestamp(now()));
INSERT INTO cbd_ex2.comments_by_video (username, id_video, author, comment, ts) VALUES ('ramos4', 12, 'ramos4', 'Saudades tuas Rei <3', toTimestamp(now()));











    