package ex4;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


import redis.clients.jedis.Jedis;

public class autocompleteB {
    public static void main(String[] args) {
        Jedis jedis = new Jedis();
        String fileName = "redis/src/ex4/nomes-pt-2021.csv"; 
        List<String> namesResult = new ArrayList<>();

        try {
            BufferedReader reader = new BufferedReader(new FileReader(fileName));
            String line;
            while ((line = reader.readLine()) != null) {

                String[] parts = line.split(";");

                if (parts.length == 2){
                
                    String nome = parts[0].trim(); 
                    String popularidade = parts[1].trim();
                     
                    jedis.zadd("autocompleteB", Integer.parseInt(popularidade), nome);
                }  
            }
            reader.close();
        } catch (IOException e){
            System.out.println("Erro ao ler ficheiro: "+ e);
        }

        while (true) {
            System.out.print("Search for ('Enter' for quit): ");
            String prefixo = System.console().readLine();
           
            if (prefixo.isEmpty()) break;

            namesResult = jedis.zrevrange("autocompleteB",0,-1);

            for (String nome : namesResult){
                if (nome.startsWith(prefixo)){
                    System.out.println(nome);
                }
            }
        }

        jedis.close();
    }
}
