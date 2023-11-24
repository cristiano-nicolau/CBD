package lab3.cbd.ex3;

import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;

public class App {
    static Session session;

    public static void main(String[] args) {
        try {
            Cluster cluster = Cluster.builder().addContactPoint("127.0.0.1").build();
            session = cluster.connect("cbd_ex2");
            
            System.out.println(">> Connected to Cassandra (127.19.0.2:9042)");

            alinea_a();
            
            alinea_b();

        } catch (Exception e) {
            System.err.println("Couldn't connect to Cassandra at 127.0.0.1:9042");
            System.exit(1);
        }
    }

    private static void alinea_a() {
                    System.out.println("Alinea A:\n");

        // data insertion
        try {
            session.execute("INSERT INTO ratings (id_video, rate) VALUES (10, 5);");
            session.execute("INSERT INTO videos (id, author, name, description, tags, ts) VALUES (15, 'kane9', 'Goleada Magnifica ao Dortmund','Show de Kane, liga alema', {'football', 'highlights','goals'}, toTimestamp(now()));");
            session.execute("INSERT INTO  videos_by_author (id, author, name, description, tags, ts) VALUES (15, 'kane9', 'Goleada Magnifica ao Dortmund','Show de Kane, liga alema', {'football', 'highlights','goals'}, toTimestamp(now()));");
            session.execute("INSERT INTO  followers (id_video, users) VALUES (15, {'kane9', 'cristianoronaldo'});");

            System.out.println("Inserts done.\n");
        } catch (Exception e) {
            System.err.println("Inserts failed. Exiting.\n" + e.getMessage());
            System.exit(1);
        }

        // data updating
        try {
            System.out.println("Update name to 'MELHOR_MUNDO_CR7' where username is 'cristianoronaldo'. ");
            session.execute("UPDATE users SET name='MELHOR_MUNDO_CR7' WHERE username='cristianoronaldo';");
            for (Row r : session.execute("SELECT * FROM users WHERE username='cristianoronaldo';")) {
                System.out.println(r.toString());
            }

            System.out.println("Update name to 'NEYMARZETE' where username is 'neymar11'. ");
            session.execute("UPDATE users SET name='NEYMARZETE' WHERE username='neymar11';");
            for (Row r : session.execute("SELECT * FROM users WHERE username='neymar11';")) {
                System.out.println(r.toString());
            }

            System.out.println("Updates done.\n");
        } catch (Exception e) {
            System.err.println("Updates failed. Exiting.\n" + e.getMessage());
            System.exit(1);
        }


        // data searching
        try {
            System.out.println("Get all videos posted by username 'neymar11'.");
            for (Row r : session.execute("SELECT * FROM videos_by_author WHERE author='neymar11';")) {
                System.out.println(r.toString());
            }

            System.out.println("Get all followers of video with id 7.");
            for (Row r : session.execute("SELECT * FROM followers WHERE id_video=7;")) {
                System.out.println(r.toString());
            }

            System.out.println("Get 5 most recent videos.");
            for (Row r : session.execute("SELECT * FROM videos LIMIT 5;")) {
                System.out.println(r.toString());
            }

            System.out.println("Get tags of video with id 4'.");
            for (Row r : session.execute("SELECT tags FROM videos WHERE id=4;")) {
                System.out.println(r.toString());
            }

            System.out.println("Searches done.\n");
                        
            System.out.println("\n *************************************\n");

        } catch (Exception e) {
            System.err.println("Search failed. Exiting.\n" + e.getMessage());
            System.exit(1);
        }
    }

    private static void alinea_b() {
        try {
            System.out.println("Alinea B:\n");

            System.out.println("2. Lista das tags de determinado vídeo");
            for (Row r : session.execute("select id, tags from videos where id=5;")) {
                System.out.println(r.toString());
            }

            System.out.println("7. Todos os seguidores (followers) de determinado vídeo");
            for (Row r : session.execute("select users from followers where id_video=1;")) {
                System.out.println(r.toString());
            }

            System.out.println("10. Uma query que retorne todos os videos e que mostre claramente a forma pela qual estao ordenados");
            for (Row r : session.execute("select * from videos;")) {
                System.out.println(r.toString());
            }

            System.out.println("12. Listar todos os comentarios de um utilizador, ordenados inversamente pela data");
            for (Row r : session.execute("select * from comments_by_user where username='kane9';")) {
                System.out.println(r.toString());
            }

            System.out.println("13. Listar a media de rating de cada video");
            for (Row r : session.execute("select id_video, avg(rate) as Media from ratings group by id_video;")) {
                System.out.println(r.toString());
            }

            System.out.println("\n *************************************\n");

        } catch (Exception e) {
            System.err.println("Queries failed. Exiting.\n" + e.getMessage());
            System.exit(1);
        }
    }
}
