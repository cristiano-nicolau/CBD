# Guia dos Comandos MongoDB

## Comandos de gestão de bases de dados

### Criar uma base de dados

```bash
use <nome da base de dados>
```

### Listar as bases de dados existentes

```bash
show dbs
```

### Eliminar uma base de dados

```bash
db.dropDatabase()
```

## Comandos de gestão de coleções

### Criar uma coleção

```bash
db.createCollection(<nome da coleção>)
```

### Listar as coleções existentes

```bash
show collections
```

### Eliminar uma coleção

```bash
db.<nome da coleção>.drop()
```

## Comandos de gestão de documentos

### Inserir um documento

```bash
db.<nome da coleção>.insert(<documento>)
```

### Listar todos os documentos de uma coleção

```bash
db.<nome da coleção>.find()
```

### Listar todos os documentos de uma coleção com um formato mais legível

```bash
db.<nome da coleção>.find().pretty()
```

### Listar todos os documentos de uma coleção que satisfaçam um critério

```bash
db.<nome da coleção>.find(<critério>)
```

### Listar todos os documentos de uma coleção que satisfaçam um critério com um formato mais legível

```bash
db.<nome da coleção>.find(<critério>).pretty()
```

### Listar todos os documentos de uma coleção que satisfaçam um critério e que sejam projetados

```bash
db.<nome da coleção>.find(<critério>, <projeção>)
```

### Listar todos os documentos de uma coleção que satisfaçam um critério e que sejam projetados com um formato mais legível

```bash
db.<nome da coleção>.find(<critério>, <projeção>).pretty()
```

### Listar todos os documentos de uma coleção que satisfaçam um critério e que sejam projetados com um formato mais legível e ordenados

```bash
db.<nome da coleção>.find(<critério>, <projeção>).sort(<ordenação>).pretty()
```

### Listar todos os documentos de uma coleção que satisfaçam um critério e que sejam projetados com um formato mais legível, ordenados e limitados

```bash
db.<nome da coleção>.find(<critério>, <projeção>).sort(<ordenação>).limit(<limite>).pretty()
```

## Comandos de Consulta

$match

O comando $match é usado para filtrar documentos com base em condições especificadas. Por exemplo, para encontrar todos os documentos com o campo "idade" igual a 25:

```bash
db.<nome da coleção>.aggregate([{$match: {idade: 25}}])
```

$group

O comando $group é usado para agrupar documentos por algum campo especificado e pode ser usado para calcular valores agregados. Por exemplo, para agrupar documentos por campo "idade" e calcular a média de "idade" para cada grupo:

```bash
db.<nome da coleção>.aggregate([{$group: {_id: "$idade", media: {$avg: "$idade"}}}])
```

$project

O comando $project é usado para selecionar campos de documentos e também pode ser usado para adicionar novos campos aos documentos. Por exemplo, para selecionar apenas os campos "nome" e "idade" de cada documento:

```bash
db.<nome da coleção>.aggregate([{$project: {nome: 1, idade: 1}}])
```

$sort

O comando $sort é usado para ordenar documentos. Por exemplo, para ordenar documentos por campo "idade" em ordem ascendente:

```bash
db.<nome da coleção>.aggregate([{$sort: {idade: 1}}])
```

$limit

O comando $limit é usado para limitar o número de documentos retornados. Por exemplo, para limitar o número de documentos retornados para 5:

```bash
db.<nome da coleção>.aggregate([{$limit: 5}])
```

$skip

O comando $skip é usado para pular documentos. Por exemplo, para pular os primeiros 5 documentos:

```bash
db.<nome da coleção>.aggregate([{$skip: 5}])
```

$unwind

O comando $unwind é usado para desenrolar campos de array. Por exemplo, para desenrolar o campo "hobbies":

```bash
db.<nome da coleção>.aggregate([{$unwind: "$hobbies"}])
```

$lookup

O comando $lookup é usado para realizar uma junção entre duas coleções. Por exemplo, para realizar uma junção entre as coleções "alunos" e "cursos" com base no campo "curso":

```bash

db.alunos.aggregate([{$lookup: {from: "cursos", localField: "curso", foreignField: "nome", as: "curso"}}])
```

$first

O comando $first é usado para selecionar o primeiro valor de um grupo. Por exemplo, para selecionar o primeiro valor de um grupo:

```bash
db.<nome da coleção>.aggregate([{$group: {_id: "$idade", primeiro: {$first: "$nome"}}}])
```

$last

O comando $last é usado para selecionar o último valor de um grupo. Por exemplo, para selecionar o último valor de um grupo:

```bash
db.<nome da coleção>.aggregate([{$group: {_id: "$idade", ultimo: {$last: "$nome"}}}])
```

$max

O comando $max é usado para selecionar o maior valor de um grupo. Por exemplo, para selecionar o maior valor de um grupo:

```bash
db.<nome da coleção>.aggregate([{$group: {_id: "$idade", maximo: {$max: "$idade"}}}])
```

$min

O comando $min é usado para selecionar o menor valor de um grupo. Por exemplo, para selecionar o menor valor de um grupo:

```bash
db.<nome da coleção>.aggregate([{$group: {_id: "$idade", minimo: {$min: "$idade"}}}])
```

$avg

O comando $avg é usado para calcular a média de um grupo. Por exemplo, para calcular a média de um grupo:

```bash
db.<nome da coleção>.aggregate([{$group: {_id: "$idade", media: {$avg: "$idade"}}}])
```

$sum

O comando $sum é usado para calcular a soma de um grupo. Por exemplo, para calcular a soma de um grupo:

```bash
db.<nome da coleção>.aggregate([{$group: {_id: "$idade", soma: {$sum: "$idade"}}}])
```



## Comandos de Atualização

### Atualizar um documento

```bash
db.<nome da coleção>.update(<critério>, <atualização>)
```

$set

O comando $set é usado para atualizar um campo específico de um documento. Por exemplo, para atualizar o campo "idade" para 25:

```bash
db.<nome da coleção>.update(<critério>, {$set: {idade: 25}})
```

$unset

O comando $unset é usado para remover um campo de um documento. Por exemplo, para remover o campo "idade":

```bash
db.<nome da coleção>.update(<critério>, {$unset: {idade: 1}})
```

$inc

O comando $inc é usado para incrementar um campo numérico de um documento. Por exemplo, para incrementar o campo "idade" em 1:

```bash

db.<nome da coleção>.update(<critério>, {$inc: {idade: 1}})
```

$push

O comando $push é usado para adicionar um elemento a um array. Por exemplo, para adicionar o elemento "futebol" ao array "hobbies":

```bash

db.<nome da coleção>.update(<critério>, {$push: {hobbies: "futebol"}})
```

$elemMatch

O comando $elemMatch é usado para atualizar um elemento de um array que satisfaça um critério. Por exemplo, para atualizar o elemento "futebol" do array "hobbies":

```bash

db.<nome da coleção>.update(<critério>, {$set: {hobbies: {$elemMatch: {$eq: "futebol"}}}})
```
