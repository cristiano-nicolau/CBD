// ex b)

SELECT JSON * FROM cbd_ex2.users;
SELECT JSON * FROM cbd_ex2.videos;
SELECT JSON * FROM cbd_ex2.comments;
SELECT JSON * FROM cbd_ex2.followers;
SELECT JSON * FROM cbd_ex2.events;
SELECT JSON * FROM cbd_ex2.ratings;


// 7. Permitir a pesquisa de todos os videos de determinado autor;

CREATE TABLE videos_by_author(
    id int,
    author text,
    name text,
    description text,
    tags set<text>,
    ts timestamp,
    primary key((author), ts)
);

SELECT JSON * FROM cbd_ex2.videos_by_author;



// 8. Permitir a pesquisa de comentarios por utilizador, ordenado inversamente pela data;

CREATE TABLE comments_by_user(
    username text,
    id_video int,
    comment text,
    ts timestamp,
    primary key(username, ts)) WITH CLUSTERING ORDER BY (ts DESC);

SELECT JSON * FROM cbd_ex2.comments_by_user;



// 9. Permitir a pesquisa de comentarios por videos, ordenado inversamente pela data;

CREATE TABLE comments_by_video(
    username text,
    id_video int,
    author text,
    comment text,
    ts timestamp,
    primary key(id_video, ts)) WITH CLUSTERING ORDER BY (ts DESC);

SELECT JSON * FROM cbd_ex2.comments_by_video;




// 10. Permitir a pesquisa do rating medio de um video e quantas vezes foi votado;

select id_video, avg(rate) as media, count(rate) as nr_rates from ratings where id_video=6;

 id_video | media | nr_rates
----------+-------+----------
        6 |     4 |        2







// 1. Os ultimos 3 comentarios introduzidos para um video;

select * from comments_by_video where id_video=1 limit 3;

 id_video | ts                              | author   | comment       | username
----------+---------------------------------+----------+---------------+----------
        1 | 2023-11-16 15:46:21.638000+0000 | neymar11 | Golaco mesmo! | neymar11
        1 | 2023-11-16 15:14:56.791000+0000 | neymar11 | Golaco mesmo! | neymar11
        1 | 2023-11-16 15:14:56.790000+0000 |  messi10 |   Que golaco! |  messi10



// 2. Lista das tags de determinado video;UA.DETI.CBD- 2023/24 15

select id, tags from videos where id=2;

 id | tags
----+------------------------
  2 | {'football', 'skills'}



// 3. Todos os videos com a tag Aveiro; (tag == 'skills')

Devido ao modelo implementado nao aceitar pesquisa por filtros "allow filtering" a query nao pode ser executada, porque nao é possivel filtrar por colunas nao indexadas
Uma forma de ser possivel realizar esta query, seria criar uma tabela sem a necessidade de indexar a coluna tags, mas isso iria criar uma tabela com muitos dados repetidos, o que nao é boa pratica.



// 4. Os ultimos 5 eventos de determinado video realizados por um utilizador;

 select * from events where id_video=9 and username='neymar11' limit 5;

 id_video | username | ts                              | instant                         | type
----------+----------+---------------------------------+---------------------------------+-------
        9 | neymar11 | 2023-11-16 15:14:56.740000+0000 | 2023-11-16 15:14:56.740000+0000 | pause
        9 | neymar11 | 2023-11-16 15:14:56.742000+0000 | 2023-11-16 15:14:56.742000+0000 |  play
...


// 5. Videos partilhados por determinado utilizador (maria1987, por exemplo) num determinado periodo de tempo (Agosto de 2017, por exemplo);

select * from videos_by_author where author='cristianoronaldo' and ts > '2017-08-01' and ts < '2023-12-31';

 author           | ts                              | description                       | id | name                      | tags
------------------+---------------------------------+-----------------------------------+----+---------------------------+----------------------------
 cristianoronaldo | 2023-11-16 15:14:56.669000+0000 |         Melhores momentos do jogo |  1 | Gol de bicicleta incrível | {'football', 'highlights'}
 cristianoronaldo | 2023-11-16 15:14:56.689000+0000 | Ronaldo aprimorando suas técnicas | 12 |     Treino de habilidades |   {'football', 'training'}



// 6. Os ultimos 10 videos, ordenado inversamente pela data da partilhada;

Esta query nao pode ser executada, porque nao é possivel filtrar por colunas nao indexadas
Alem disso, cassandra nao permite pesquisar globlamente


// 7. Todos os seguidores (followers) de determinado video;

select * from followers where id_video=1;

 id_video | users
----------+----------------------------------
        1 | {'diogo99', 'messi10', 'ramos4'}



// 8. Todos os comentarios (dos videos) que determinado utilizador esta a seguir (following);

Para a realização desta query seria necessaria a utilização de "join" para juntar as tabelas comments e followers, mas cassandra nao permite "join" entre tabelas, por isso nao é possivel realizar esta query.



// 9. Os 5 videos com maior rating;

Devido ao modelo implementado nao aceitar pesquisa por filtros "allow filtering" a query nao pode ser executada, porque nao é possivel filtrar por colunas nao indexadas



// 10. Uma query que retorne todos os videos e que mostre claramente a forma pela qual estao ordenados;

select * from videos;

 id | ts                              | author           | description                       | name                      | tags
----+---------------------------------+------------------+-----------------------------------+---------------------------+-----------------------------------------
  5 | 2023-11-16 15:14:56.643000+0000 |     lewandowski9 |          Lewandowski faz história |  Hat-trick impressionante |                   {'football', 'goals'}
 10 | 2023-11-16 15:14:56.655000+0000 |           ramos4 |   Sergio Ramos, o pilar defensivo |             Defesa sólida |                 {'defense', 'football'}
 13 | 2023-11-16 15:14:56.663000+0000 |         neymar11 |       Neymar esbanja criatividade |     Jogadas extravagantes |                  {'football', 'skills'}
 11 | 2023-11-16 15:14:56.658000+0000 |           ramos4 |      Ramos mostra sua forca aérea |    Gol de cabeca poderoso |              {'football', 'highlights'}
  1 | 2023-11-16 15:14:56.634000+0000 | cristianoronaldo |         Melhores momentos do jogo | Gol de bicicleta incrível |              {'football', 'highlights'}
  8 | 2023-11-16 15:14:56.650000+0000 |            kane9 |             Kane balanca as redes |     Artilheiro implacável |                   {'football', 'goals'}
  2 | 2023-11-16 15:14:56.636000+0000 |          messi10 |            Magia nos pés de Messi |           Dribles mágicos |                  {'football', 'skills'}
  4 | 2023-11-16 15:14:56.640000+0000 |          mbappe7 |           Mbappe brilha novamente |   Velocidade e habilidade |                   {'football', 'speed'}
 15 | 2023-11-16 15:14:56.667000+0000 |          diogo99 |       Noite de champions incrivel |          Melhores defesas | {'football', 'goalkepar', 'highlights'}
  7 | 2023-11-16 15:14:56.648000+0000 |       debruyne17 |              De Bruyne, o maestro |    Assistências incríveis |                 {'assists', 'football'}
  6 | 2023-11-16 15:14:56.646000+0000 |          salah11 |             Salah lidera o ataque |            Gols decisivos |              {'football', 'highlights'}
  9 | 2023-11-16 15:14:56.653000+0000 |         modric10 |       Modric, o cérebro da equipa |          Controle de jogo |                  {'football', 'skills'}
 14 | 2023-11-16 15:14:56.665000+0000 |     lewandowski9 |     Lewandowski comenta a partida |       Entrevista pós-jogo |               {'football', 'interview'}
 12 | 2023-11-16 15:14:56.660000+0000 | cristianoronaldo | Ronaldo aprimorando suas técnicas |     Treino de habilidades |                {'football', 'training'}
  3 | 2023-11-16 15:14:56.638000+0000 |         neymar11 |           Show de Neymar em campo |       Gols e assistências |              {'football', 'highlights'}



// 11. Lista com as Tags existentes e o numero de videos catalogados com cada uma delas;

Para ser possivel a realização desta query, seria necessario criar uma tabela com a coluna tags como chave primaria, mas isso iria criar uma tabela com muitos dados repetidos, o que nao é boa pratica.



// 12. Listar todos os comentarios de um utilizador, ordenados inversamente pela data;

select * from comments_by_user where username='kane9';

 username | ts                              | comment                        | id_video
----------+---------------------------------+--------------------------------+----------
    kane9 | 2023-11-16 15:14:56.787000+0000 | jogas tanto com a bola nos pes |        3
    kane9 | 2023-11-16 15:14:56.782000+0000 |                   Es lindo rei |       13
    kane9 | 2023-11-16 15:14:56.780000+0000 |                    Jogas tanto |        7



// 13. Listar a media de rating de cada video;

select id_video, avg(rate) as Average_rating from ratings group by id_video;

 id_video | average_rating
----------+----------------
       10 |              4
        1 |              3
        8 |              2
        2 |              4
        7 |              5
        6 |              4
        9 |              5

