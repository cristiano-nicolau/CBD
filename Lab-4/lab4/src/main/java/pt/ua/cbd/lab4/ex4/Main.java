package pt.ua.cbd.lab4.ex4;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.PrintStream;
import java.io.PrintWriter;

import org.neo4j.driver.Driver;
import org.neo4j.driver.GraphDatabase;
import org.neo4j.driver.Record;
import org.neo4j.driver.Result;
import org.neo4j.driver.Session;

public class Main {

    public static void main(String... args) {
        try (Driver driver = GraphDatabase.driver("bolt://localhost:7687")) {
            try (Session session = driver.session()) {
                System.out.println("Connected to Neo4...\n");

                String csvFile = "resources/books.csv";

                InsertData(session, csvFile);

                executeQueries(session);

                
                //DeleteData(session);
                
            }
            catch (Exception e) {
                System.err.println("Error: " + e.getMessage());
            }
        }
        catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
        }

    }


    public static void InsertData(Session session, String csvFile) {
        try {
            session.run("LOAD CSV WITH HEADERS FROM 'file:///" + csvFile + "' AS Row " +
            "MERGE (book:Book {bookID: Row.bookID}) " +
            "SET book.title=Row.title, book.average_rating=Row.average_rating, book.isbn=Row.isbn, book.isbn13=Row.isbn13, " +
            "book.ratings_count=Row.ratings_count, book.num_pages=Row.num_pages, " +
            "book.text_reviews_count=Row.text_reviews_count " +
            "MERGE (publisher:Publisher {publisher_name: Row.publisher_name}) " +
            "MERGE (author:Author {authors_name:Row.authors_name}) " +
            "MERGE (bookLanguage:BookLanguage {language_code:Row.language_code})" + 
            "MERGE (book)-[:WRITTEN_BY]->(author) " +  
            "MERGE (book)-[:IN_LANGUAGE]->(bookLanguage)"); 

            System.out.println("Data inserted successfully!");       
        }
        catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
        }

    }

    public static void DeleteData(Session session) {
        try {   
            session.run("MATCH (n) DETACH DELETE n");
            System.out.println("Data deleted successfully!");       
        }
        catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
        }

    }

    public static void executeQueries(Session session) {
        try {
            File outputFile = new File("CBD_L44_108536.TXT");
            FileOutputStream fos = new FileOutputStream(outputFile);
            PrintStream ps = new PrintStream(fos);
            System.setOut(ps);

            System.out.println("Query 1: Apresente o número total de livros existentes na base de dados.");
            Result result = session.run("MATCH (b:Book) RETURN count(b) AS total");
            while (result.hasNext()) {
                Record record = result.next();
                System.out.println(record.get("total"));
            }

            System.out.println("\nQuery 2: Apresente as informaçoes de 20 livros");
            result = session.run("MATCH (b:Book) RETURN b.title, b.average_rating, b.isbn LIMIT 20");
            while (result.hasNext()) {
                Record record = result.next();
                System.out.println(record.get("b.title").asString() + " - " + record.get("b.average_rating").asString() + " - " + record.get("b.isbn").asString());
            }

            System.out.println("\nQuery 3: Apresente as informaçoes dos 10 Livros  com maior ranking médio.");
            result = session.run("MATCH (b:Book) RETURN b.title, b.average_rating ORDER BY b.average_rating DESC LIMIT 10");
            while (result.hasNext()) {
                Record record = result.next();
                System.out.println(record.get("b.title").asString() + " - " + record.get("b.average_rating").asString());
            }

            System.out.println("\nQuery 4: Apresente o número total de autores distintos.");
            result = session.run("MATCH (a:Author) RETURN count(DISTINCT a) AS totalAuthors");
            while (result.hasNext()) {
                Record record = result.next();
                System.out.println(record.get("totalAuthors"));
            }

            System.out.println("\nQuery 5: Apresente as informaçoes dos Livros com ISBN contendo '007'.");
            result = session.run("MATCH (b:Book) WHERE b.isbn CONTAINS '007' RETURN b.title, b.isbn");
            while (result.hasNext()) {
                Record record = result.next();
                System.out.println(record.get("b.title").asString() + " - " + record.get("b.isbn").asString());
            }

            System.out.println("\nQuery 6: Apresente os livros com mais de 1000 páginas e média de avaliação superior a 4.5");
            result = session.run("MATCH (b:Book) WHERE toInteger(b.num_pages) > 1000 AND toFloat(b.average_rating) > 4.5 RETURN b.title, b.num_pages, b.average_rating");
            while (result.hasNext()) {
                Record record = result.next();
                System.out.println(record.get("b.title").asString() + " - " + record.get("b.num_pages").asString() + " - " + record.get("b.average_rating").asString());
            }

            System.out.println("\nQuery 7: Apresente os livros escritos por J.K. Rowling.");
            result = session.run("MATCH (a:Author {authors_name: 'J.K. Rowling'})--(b:Book) RETURN b.title");
            while (result.hasNext()) {
                Record record = result.next();
                System.out.println(record.get("b.title").asString());
            }

            System.out.println("\nQuery 8: Apresente os livros escritos por J.K. Rowling com mais de 400 páginas.");
            result = session.run("MATCH (a:Author {authors_name: 'J.K. Rowling'})--(b:Book) WHERE toInteger(b.num_pages) > 400 RETURN b.title, b.num_pages");
            while (result.hasNext()) {
                Record record = result.next();
                System.out.println(record.get("b.title").asString() + " - " + record.get("b.num_pages").asString());
            }
         

            System.out.println("\nQuery 9: Apresente os livros escritos por Bill Bryson com avaliação média superior a 4.0.");
            result = session.run("MATCH (a:Author {authors_name: 'Bill Bryson'})--(b:Book) WHERE toFloat(b.average_rating) > 4.0 RETURN b.title, b.average_rating");
            while (result.hasNext()) {
                Record record = result.next();
                System.out.println(record.get("b.title").asString() + " - " + record.get("b.average_rating").asString());
            }
            

            System.out.println("\nQuery 10: Apresente os livros com avaliação média entre 4.5 e 5.");
            result = session.run("MATCH (b:Book) WHERE toFloat(b.average_rating) >= 4.5 AND toFloat(b.average_rating) <= 5.0 RETURN b.title, b.average_rating");
            while (result.hasNext()) {
                Record record = result.next();
                System.out.println(record.get("b.title").asString() + " - " + record.get("b.average_rating").asString());
            }

    
            ps.close();        
        }
        catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
        }
    }


}