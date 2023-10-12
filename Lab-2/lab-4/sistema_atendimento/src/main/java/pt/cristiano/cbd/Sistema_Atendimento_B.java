package pt.cristiano.cbd;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

import java.util.Date;
import java.util.concurrent.TimeUnit;

public class Sistema_Atendimento_B {
    private MongoClient mongoClient;
    private MongoDatabase database;
    private MongoCollection<Document> collection;
    private static final int Quantidade_Limite = 20;
    private static final int TimeSlot = 60;

    public Sistema_Atendimento_B(String databaseName) {
        mongoClient = MongoClients.create();
        database = mongoClient.getDatabase(databaseName);
        collection = database.getCollection("product_quantity_requests");
    }

    public void requestProduct(String username, String product, int quantity) {
        Date currentTime = new Date();
        Date timeAgo = new Date(currentTime.getTime() - TimeUnit.MINUTES.toMillis(TimeSlot));

        int totalQuantity = 0;
        FindIterable<Document> documents = collection.find(
                new Document("username", username)
                        .append("product", product) 
                        .append("timestamp", new Document("$gt", timeAgo))
        );
        for (Document doc : documents) {
            totalQuantity += doc.getInteger("quantity");
        }

        if (totalQuantity + quantity > Quantidade_Limite) {
            System.out.println("Limite excedido. Pedido não atendido para " + username + " - " + product);
        } else {
            Document requestDocument = new Document()
                    .append("username", username)
                    .append("product", product)
                    .append("quantity", quantity)
                    .append("timestamp", currentTime);
            collection.insertOne(requestDocument);
            System.out.println("Pedido atendido para " + username + " - " + product + " (Quantidade: " + quantity + ")");
        }
    }

    public static void main(String[] args) {
        Sistema_Atendimento_B sistema = new Sistema_Atendimento_B("cbd");

        System.out.println("\nLimite maximo de "+ Quantidade_Limite+" unidades de produtos por utilizador por "+ TimeSlot +" minuto(s):\n" );

        String username1 = "user1";
        String product1 = "product1";
        int quantity1 = 10;

        String username2 = "user2";
        String product2 = "product2";
        int quantity2 = 25;

        sistema.requestProduct(username1, product1, quantity1);
        sistema.requestProduct(username2, product2, quantity2);
    }
}
