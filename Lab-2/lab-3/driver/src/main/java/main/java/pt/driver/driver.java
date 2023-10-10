package main.java.pt.driver;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import org.bson.Document;
import org.bson.conversions.Bson;

import com.mongodb.client.AggregateIterable;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Accumulators;
import com.mongodb.client.model.Aggregates;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Indexes;
import com.mongodb.client.model.Projections;


public class driver {
    public static void main(String[] args) {
        MongoClient mongoClient = MongoClients.create();
        MongoDatabase database = mongoClient.getDatabase("cbd");
        MongoCollection<Document> collection = database.getCollection("restaurants");
        
        System.out.println("*************\n Alinea a)\n*************\n");
        
        Document document = criarDocumentoRestaurante();
        inserir(collection, document);
        
        System.out.println("\nAddres.Rua: 'Wyckoff Avenue' -> 'Rua XYZ'");
        editar(collection, "address.rua", "Wyckoff Avenue", "Rua XYZ");

        System.out.println("\nRestaurantes pertencentes a rua XYZ:");
        listar(collection, new Document("address.rua", "Rua XYZ"));
        
        System.out.println("\n\n*************\n Alinea b)\n*************\n");
        criarIndices(collection);
        
        System.out.println("\n Pesquisa Gastronomia -> Continental with index");
        Document query = new Document("gastronomia", "Continental");
        Document projection = new Document("nome", 1).append("localidade", 1).append("gastronomia", 1).append("_id", 0);
        
        MongoCursor<Document> cursor = collection.find(query).projection(projection).iterator();
        while (cursor.hasNext()) {
            System.out.println(cursor.next().toJson());
        }
        
        System.out.println("\n Pesquisa Nome -> Domino'S Pizza with index");
        Document query2 = new Document("nome", "Domino'S Pizza");
        Document projection2 = new Document("nome", 1).append("localidade", 1).append("gastronomia", 1).append("_id", 0);
        
        MongoCursor<Document> cursor2 = collection.find(query2).projection(projection2).iterator();
        while (cursor2.hasNext()) {
            System.out.println(cursor2.next().toJson());
        }

        
        System.out.println("\n\n*************\n Alinea c)\n*************\n");

        System.out.println("1. \tListe o restaurant_id, o nome, a localidade e gastronomia dos restaurantes cujo nome começam por 'Wil': \n");
        Document questao1 = new Document("nome", new Document("$regex", "^Wil"));
        Document projection3 = new Document("restaurant_id", 1).append("nome", 1).append("localidade", 1).append("gastronomia", 1);
        MongoCursor<Document> cursor3 = collection.find(questao1).projection(projection3).iterator();
        while (cursor3.hasNext()) {
            System.out.println(cursor3.next().toJson());
        }
        

        System.out.println("\n2. \tListe o nome, a localidade e a gastronomia dos restaurantes que pertencem ao Bronx" + //
                "e cuja gastronomia é do tipo \"American\" ou \"Chinese\".\n");
        Document questao2 = new Document("localidade", "Bronx").append("gastronomia", new Document("$in", Arrays.asList("American", "Chinese")));
        Document projection4 = new Document("nome", 1).append("localidade", 1).append("gastronomia", 1).append("_id", 0);
        MongoCursor<Document> cursor4 = collection.find(questao2).projection(projection4).iterator();
        while (cursor4.hasNext()) {
            System.out.println(cursor4.next().toJson());
        }


        System.out.println("\n3. \tIndique os restaurantes com latitude inferior a -95,7: \n");
        Document questao3 = new Document("address.coord.0", new Document("$lt", -95.7));
        Document projection5 = new Document("nome", 1).append("localidade", 1).append("gastronomia", 1).append("_id", 0);
        MongoCursor<Document> cursor5 = collection.find(questao3).projection(projection5).iterator();
        while (cursor5.hasNext()) {
            System.out.println(cursor5.next().toJson());
        }


        System.out.println("\n4. \tIndique o número total de avaliações (numGrades) na coleção: ");
        int totalGrades = collection.aggregate(
            Arrays.asList(
                new Document("$unwind", "$grades"), 
                new Document("$group", new Document("_id", null).append("count", new Document("$sum", 1))) // Soma o número de documentos (avaliações)
            )
        ).first().getInteger("count"); 

        System.out.println("Número total de avaliações (numGrades) na coleção: " + totalGrades);

        System.out.println("\n5. \tApresente o nome e número de avaliações (numGrades) dos 3 restaurante com" + //
                "mais avaliações. \n");
        Document questao5 = new Document();
        Document projection7 = new Document("nome", 1).append("numGrades", new Document("$size", "$grades")).append("_id", 0);
        MongoCursor<Document> cursor7 = collection.find(questao5).projection(projection7).sort(new Document("numGrades", -1)).limit(3).iterator();
        while (cursor7.hasNext()) {
            System.out.println(cursor7.next().toJson());
        }

        System.out.println("\n\n*************\n Alinea d)\n*************\n");
        System.out.println("Número de localidades distintas: " + new driver().countLocalidades(collection));

        System.out.println("\nNúmero de restaurantes por localidade: ");
        Map<String, Integer> restaurantCountMap = countRestByLocalidade(collection);
        for (Map.Entry<String, Integer> entry : restaurantCountMap.entrySet()) {
            System.out.println("-> " + entry.getKey() + " - " + entry.getValue());
        }

        String searchName = "Park"; 
        List<String> restaurantNames = getRestWithNameCloserTo(collection, searchName);

        System.out.println("\nNome de restaurantes contendo '" + searchName + "' no nome:");
        for (String name : restaurantNames) {
            System.out.println("-> " + name);
        }



        mongoClient.close();
    }
// alinea a)
    private static Document criarDocumentoRestaurante() {
        return new Document("address",
                new Document("building", "0420").append("coord", Arrays.asList(40.63970210386568, -8.653264655559203))
                        .append("rua", "Rua XYZ")
                        .append("zipcode", "3810"))
                .append("localidade", "Viana do Castelo")
                .append("gastronomia", "Tradicional Portuguese")
                .append("grades",
                        Arrays.asList(
                                new Document("date", "2022-10-31T01:13:54Z").append("grade", "B").append("score", 8)))
                .append("nome", "Restaurante Camelo")
                .append("restaurant_id", "43042096");}

    private static void inserir(MongoCollection<Document> collection, Document document) {
        collection.insertOne(document);
        System.out.println("Restaurante inserido com sucesso. Informações: " + document.toJson());
    }

    private static void editar(MongoCollection<Document> collection, String param, String oldvalue, String newvalue) {
        collection.updateMany(Filters.eq(param, oldvalue), new Document("$set", new Document(param, newvalue)));
        System.out.println("Restaurante editado com sucesso.");
    }

    private static void listar(MongoCollection<Document> collection, Document filter) {
        for (Document cur : collection.find(filter)) {
            System.out.println(cur.toJson());
        }
    }
    // alinea b)
    private static void criarIndices(MongoCollection<Document> collection) {
        collection.createIndex(Indexes.ascending("localidade"));
        System.out.println("-> created index for 'localidade'");
        collection.createIndex(Indexes.ascending("gastronomia"));
        System.out.println("-> created index for 'gastronomia'");
        collection.createIndex(Indexes.text("nome"));
        System.out.println("-> created text index for 'nome'");
    }

    // alinea d)
    public int countLocalidades(MongoCollection<Document> collection){
        return collection.distinct("localidade", String.class).into(new ArrayList<>()).size();
    }
    public static Map<String, Integer> countRestByLocalidade(MongoCollection<Document> collection) {
        Map<String, Integer> restaurantCountMap = new HashMap<>();

        AggregateIterable<Document> result = collection.aggregate(Arrays.asList(
                Aggregates.group("$localidade", Accumulators.sum("count", 1))
        ));

        for (Document document : result) {
            String localidade = document.getString("_id");
            int count = document.getInteger("count");
            restaurantCountMap.put(localidade, count);
        }

        return restaurantCountMap;
    }

    public static List<String> getRestWithNameCloserTo(MongoCollection<Document> collection, String name) {
        List<String> restaurantNames = new ArrayList<>();
        
        Pattern regexPattern = Pattern.compile(name, Pattern.CASE_INSENSITIVE);
        Bson filter = Filters.regex("nome", regexPattern);

        FindIterable<Document> result = collection.find(filter).projection(Projections.include("nome"));

        for (Document document : result) {
            String restaurantName = document.getString("nome");
            restaurantNames.add(restaurantName);
        }

        return restaurantNames;
    }

        
}
