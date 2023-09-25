
import redis.clients.jedis.Jedis;

public class SistemaAtendimentoB {
    private int limiteQuantidade;
    private int timeslot;
    private Jedis jedis;

    public SistemaAtendimentoB(Jedis jedis, int limiteQuantidade, int timeslot) {
        this.jedis = jedis;
        this.limiteQuantidade = limiteQuantidade;
        this.timeslot = timeslot;
    }

    private void registraRequest(String username, String product, int quantity) {
        String key = username;
        long temporestante = jedis.ttl(key);
    
        boolean keyexists = jedis.exists(key);
    
        if (!keyexists || temporestante < 0) {
            jedis.del(key);
            jedis.hset(key, product, String.valueOf(quantity));
            jedis.expire(key, timeslot);
            System.out.println("Pedido aceite: " + username + " - " + product + " - Quantidade: " + quantity + " - Novo pedido");
        } else {            
            String quantidadeAnterior = jedis.hget(key, product);
            
            int quantidadeTotal = quantidadeAnterior != null ? Integer.parseInt(quantidadeAnterior) + quantity : quantity;
    
            if (quantidadeTotal <= limiteQuantidade) {
                jedis.hset(key, product, String.valueOf(quantidadeTotal));
                System.out.println("Pedido aceite: " + username + " - " + product + " - Quantidade: " + quantidadeTotal + " - Pedido existente");
            } else {
                if (quantidadeTotal > limiteQuantidade) {
                    System.out.println("Pedido recusado - " + username + ": Limite máximo de quantidade atingido.");
                } 
        }
    }
}
    

    public static void main(String[] args) {
        Jedis jedis = new Jedis();
        int limiteQuantidade = 12;
        int timeslot = 20;

        int pedido = 0;
        SistemaAtendimentoB sistema = new SistemaAtendimentoB(jedis, limiteQuantidade, timeslot);

        System.out.println("Sistema de atendimento B:");
        System.out.println("O sistema atende, para cada utilizador, um máximo de  " + limiteQuantidade + " unidades de produtos a cada " + timeslot + " segundos.");
        System.out.println("*******************\n" );


        while (pedido < 9) {
            String username = "Ronaldo";
            String product = "Bola de Ouro";
            int quantity = 2; 

            sistema.registraRequest(username, product, quantity);

            pedido++;
        }
        pedido = 0;
        System.out.println("\n O João envia pedidos de 2 em 2  segundos.\n");
        while (pedido < 14) {
            String username = "João";
            String product = "Redis";
            int quantity = 1; 

            sistema.registraRequest(username, product, quantity);

            pedido++;
                       try{
            Thread.sleep(2000); 
            }catch(InterruptedException e){
                System.out.println("Erro: "+ e);
            }
        }
        jedis.close();
    }
}
