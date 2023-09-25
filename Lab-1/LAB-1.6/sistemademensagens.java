import redis.clients.jedis.Jedis;
import redis.clients.jedis.Transaction;

import java.util.*;

public class sistemademensagens {

    private Jedis jedis;

    public sistemademensagens() {
        this.jedis = new Jedis();
    }

    public void adicionarUtilizador(String utilizador) {
        jedis.sadd("utilizadores", utilizador);
    }

    public void associarUtilizador(String utilizadorA, String utilizadorB) {
        jedis.sadd("seguidores:" + utilizadorA, utilizadorB);
        System.out.println(utilizadorA + " adicionou " + utilizadorB + " aos amigos.");
    }

    public void enviarMensagem(String utilizador, String mensagem) {
        Long messageId = jedis.incr("mensagem:id");
        String chaveMensagem = "mensagem:" + messageId;

        jedis.hset(chaveMensagem, "utilizador", utilizador);
        jedis.hset(chaveMensagem, "mensagem", mensagem);
        jedis.lpush("mensagens:" + utilizador, messageId.toString());

        Set<String> seguidores = jedis.smembers("seguidores:" + utilizador);

        Transaction transacao = jedis.multi();
        for (String seguidor : seguidores) {
            transacao.lpush("mensagens:" + seguidor, messageId.toString());
        }
        transacao.exec();
    }

    public List<String> lerMensagens(String utilizador) {
        return jedis.lrange("mensagens:" + utilizador, 0, -1);
    }

    public Set<String> listarUtilizadores() {
        return jedis.smembers("utilizadores");
    }

    public Set<String> listarSeguidores(String utilizador) {
        return jedis.smembers("seguidores:" + utilizador);
    }

    public Map<String, String> detalhesMensagem(String messageId) {
        String chaveMensagem = "mensagem:" + messageId;
        return jedis.hgetAll(chaveMensagem);
    }


    public static void main(String[] args) {
        sistemademensagens sistema = new sistemademensagens();
        Scanner sc = new Scanner(System.in);

        while (true) {
            System.out.print("\n----------- SISTEMA DE MENSAGENS -----------\n" + 
            "1 -> Criar Utilizador \n" +
            "2 -> Enviar Mensagem \n" +
            "3 -> Adicionar Amigo \n" +
            "4 -> Ler Mensagens \n" +
            "5 -> Listar Utilizadores \n" +
            "6 -> SAIR \n" +
            "Escolha a sua opção: ");

            int op = sc.hasNextInt() ? sc.nextInt() : 0;
            sc.nextLine(); 

            switch (op) {
                case 1:
                    System.out.println("Digite o nome do utilizador: ");
                    String novoUtilizador = sc.nextLine();
                    sistema.adicionarUtilizador(novoUtilizador);
                    break;
                case 2:
                    System.out.println("Digite o seu nome de utilizador: ");
                    String remetente = sc.nextLine();
                    System.out.println("Digite a mensagem: ");
                    String mensagem = sc.nextLine();
                    sistema.enviarMensagem(remetente, mensagem);
                    break;
                case 3:
                    System.out.println("Digite o seu nome de utilizador: ");
                    String userA = sc.nextLine();
                    System.out.println("Digite o nome de utilizador do amigo: ");
                    String userB = sc.nextLine();
                    sistema.associarUtilizador(userA, userB);
                    break;
                case 4:
                    System.out.println("Digite o nome do utilizador: ");
                    String leitor = sc.nextLine();
                    List<String> mensagens = sistema.lerMensagens(leitor);
                    System.out.println("Mensagens para " + leitor + ":");
                    for (String msg : mensagens) {
                        Map<String, String> msgDetails = sistema.detalhesMensagem(msg);
                        System.out.println("De: " + msgDetails.get("utilizador") + ", Mensagem: " + msgDetails.get("mensagem"));
                    }
                    break;
                case 5:
                    Set<String> utilizadores = sistema.listarUtilizadores();
                    System.out.println("Lista de Utilizadores:");
                    for (String user : utilizadores) {
                        System.out.println(user);
                    }
                    break;
                case 6:
                    System.out.println("\nObrigado.");
                    sistema.jedis.close();
                    sc.close();
                    System.exit(0);
                    break;
                default:
                    System.out.println("Opção inválida.");
                    break;
            }
        }
    }
}
