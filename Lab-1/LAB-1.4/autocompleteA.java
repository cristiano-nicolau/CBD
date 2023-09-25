
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;

import redis.clients.jedis.Jedis;

public class autocompleteA {
    public static void main(String[] args) {
        Jedis jedis = new Jedis();
        String fileName = "LAB-1.4/names.txt"; 
        List<String> ResultadosAutoComplete;

        try {
            BufferedReader reader = new BufferedReader(new FileReader(fileName));
            String line;
            while ((line = reader.readLine()) != null) {
                jedis.zadd("autocomplete", 0, line); 
            }
            reader.close();
        } catch (IOException e){
            System.out.println("Erro ao ler ficheiro: "+ e);
        }

        while (true) {
            System.out.print("Search for ('Enter' for quit): ");
            String prefixo = System.console().readLine();
           
            if (prefixo.isEmpty()) break;

            ResultadosAutoComplete = jedis.zrangeByLex("autocomplete", "[" + prefixo, "[" + prefixo + "~");
             // o "~" tem maior ASCII value que qualquer caracter do alfabeto, garantindo assim que todos os  nomes sao adicionados a lista, se começarem pelo prefixo escolhido pelo utilizador

            for (String resultados : ResultadosAutoComplete) {
               System.out.println(resultados);
           }
        }

        jedis.close();
    }
}
