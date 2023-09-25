
import java.util.List;
import java.util.Map;

import redis.clients.jedis.Jedis;

public class SimplePost {
    public static String USERS_KEY = "users"; // Key set for users' name
    public static String USERS_LIST_KEY = "users_list"; // Key for list
    public static String USERS_HASH_KEY = "users_hash"; // Key for hash

    public static void main(String[] args) {
        Jedis jedis = new Jedis();
        // some users
        String[] users = { "Ana", "Pedro", "Maria", "Luis" };
        jedis.del(USERS_KEY); // remove if exists to avoid wrong type
        jedis.del(USERS_HASH_KEY);
        jedis.del(USERS_LIST_KEY);
        for (String user : users)
            jedis.sadd(USERS_KEY, user);
        jedis.smembers(USERS_KEY).forEach(System.out::println);

        List<String> usersList = List.of("Ana", "Pedro", "Maria", "Luis");
        for (String user : usersList) {
            jedis.rpush(USERS_LIST_KEY, user);
        }

        // Lê dados da lista e imprime
        List<String> userListResult = jedis.lrange(USERS_LIST_KEY, 0, -1);
        System.out.println("\nUtilizadores na lista:");
        for (String user : userListResult) {
            System.out.println(user);
        }

        // Escreve dados em um hash
        Map<String, String> usersMap = Map.of(
                "Ana", "25",
                "Pedro", "30",
                "Maria", "28",
                "Luis", "35");
        jedis.hmset(USERS_HASH_KEY, usersMap);

        // Lê dados do hash e imprime
        Map<String, String> userHashResult = jedis.hgetAll(USERS_HASH_KEY);
        System.out.println("\nUtilizadores no hash:");
        for (Map.Entry<String, String> entry : userHashResult.entrySet()) {
            System.out.println("Nome: " + entry.getKey() + ", Idade: " + entry.getValue());
        }

        jedis.close();
    }
}