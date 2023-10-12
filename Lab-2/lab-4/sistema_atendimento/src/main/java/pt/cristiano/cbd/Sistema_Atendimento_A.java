package pt.cristiano.cbd;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

import java.util.Date;
import java.util.concurrent.TimeUnit;

public class Sistema_Atendimento_A {    
    private static final int LimiteMaximoPedidos = 3;
    private static final int TimeSlot = 1;

    private MongoClient mongoClient;
    private MongoDatabase database;
    private MongoCollection<Document> collection;

    public Sistema_Atendimento_A(String databaseName) {
        mongoClient = MongoClients.create();
        database = mongoClient.getDatabase(databaseName);
        collection = database.getCollection("product_requests");
    }

    public void requestProduct(String username, String product, int limit, int timeSlotMinutes) {
        Date currentTime = new Date();
        Date timeAgo = new Date(currentTime.getTime() - TimeUnit.MINUTES.toMillis(timeSlotMinutes));
        
        long PedidosCount = collection.countDocuments(
            new Document("nome", username)
                .append("produto", product)
                .append("timestamp", new Document("$gt", timeAgo))
        );

        if (PedidosCount >= limit) {
            System.out.println("Limite excedido. Pedido não atendido para " + username + " - " + product);
        } else {
            Document NewRequest = new Document()
                .append("nome", username)
                .append("produto", product)
                .append("timestamp", currentTime);
            collection.insertOne(NewRequest);
            System.out.println("Pedido atendido para " + username + " - " + product);
        }
    }

    public static void main(String[] args) {
        Sistema_Atendimento_A Sistema = new Sistema_Atendimento_A("cbd");

        System.out.println("\nLimite maximo de "+ LimiteMaximoPedidos+"  pedidos por utilizador por "+ TimeSlot +" minuto(s):\n" );

        String username1 = "user1";
        String product1 = "product1";

        String username2 = "user2";
        String product2 = "product2";

        Sistema.requestProduct(username1, product1, LimiteMaximoPedidos, TimeSlot);
        Sistema.requestProduct(username2, product2, LimiteMaximoPedidos, TimeSlot);
        Sistema.requestProduct(username1, product1, LimiteMaximoPedidos, TimeSlot);
        Sistema.requestProduct(username2, product2, LimiteMaximoPedidos, TimeSlot);
        Sistema.requestProduct(username1, product1, LimiteMaximoPedidos, TimeSlot);
        Sistema.requestProduct(username2, product2, LimiteMaximoPedidos, TimeSlot);
        Sistema.requestProduct(username1, product1, LimiteMaximoPedidos, TimeSlot);
        Sistema.requestProduct(username2, product2, LimiteMaximoPedidos, TimeSlot);
    }
}
