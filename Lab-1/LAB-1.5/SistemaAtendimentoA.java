
import redis.clients.jedis.Jedis;

public class SistemaAtendimentoA {
    private int limit;
    private int timeslot;
    private Jedis jedis;

    public SistemaAtendimentoA(Jedis jedis, int limit, int timeslot) {
        this.jedis = jedis;
        this.limit = limit;
        this.timeslot = timeslot;
    }

    private void registraRequest(String username, String product) {
        String key = username;
        long temporestante = jedis.ttl(key);

        boolean keyexists = jedis.exists(key);

        if (!keyexists || temporestante < 0) {
            jedis.del(key);
            jedis.rpush(key, product);
            jedis.expire(key, timeslot);
            System.out.println("Pedido aceite: " + username + " - " + product + " - Novo pedido");        }

        long quantidadePedidos = jedis.llen(key);

        if (quantidadePedidos < limit && temporestante > 0) {
            jedis.rpush(key, product);
            System.out.println("Pedido aceite: " + username + " - " + product + " - Pedido existente");
        } else {
            if (quantidadePedidos >= limit) {
                System.out.println("Pedido recusado - " + username + " : Limite máximo de pedidos atingido.");
            } 
        }
    }
        
    public static void main(String[] args) {
        Jedis jedis = new Jedis();
        int limit = 10;
        int timeslot = 60 ;

        System.out.println("Sistema de atendimento A:");
        System.out.println("O sistema atende, para cada utilizador, um máximo de  " + limit + " de produtos diferentes a cada " + timeslot + " segundos.");
        System.out.println("*******************\n" );

        int pedido = 0;
        SistemaAtendimentoA sistema = new SistemaAtendimentoA(jedis, limit, timeslot);
        
        while (pedido<8) {
            String username = "Ronaldo"; 
            String product = "Bola de Ouro";

            sistema.registraRequest(username, product);
        
            pedido++;
        }
        pedido=0;
        while (pedido<12) {
            String username = "João"; 
            String product = "Redis";

            sistema.registraRequest(username, product);

        
            pedido++;
        }
        jedis.close();

    }
}
