--- 
layout: post
title: Primeiros passos com MongoDB
wordpress_id: 3407
wordpress_url: http://viniciusquaiato.com/blog/?p=3407
categories: 
- title: NoSQL
  slug: nosql-2
  autoslug: nosql
tags: 
- title: noSQL
  slug: nosql
  autoslug: nosql
- title: MongoDB
  slug: mongodb
  autoslug: mongodb
---


[![](http://viniciusquaiato.com/images_posts/nosql-300x177.png "nosql")](http://viniciusquaiato.com/images_posts/nosql.png)



Fala galera. Não é bem de hoje que minha "revolta" com bancos de dados relacionais começou. Eu acho sim que os bancos relacionais possuem sua serventia, mas eu comecei a desconfiar que eles não eram a "bala de prata" e solução para todos os problemas do mundo(incluindo a fome e a miséria como pregam os DBAs).Eu também sempre questionei a normalização e des(ou de)normalização. Acho que o ato de des(ou de)normalizar algo em um banco relacional já é um indício de que algo está fora dos padrões.Bom eu não vou tentar envangelizar ninguém sobre soluções não relacionais e [NoSQL](http://en.wikipedia.org/wiki/NoSQL), etc. Apenas quero compartilhar um pouco das minhas aventuranças(pouco mais de 2h de leituras e console applications) com vocês tentando expandir um pouco o batbelt :P[![](http://viniciusquaiato.com/images_posts/logo-mongodb1-300x100.png "MongoDB")](http://viniciusquaiato.com/images_posts/logo-mongodb1.png)

# MongoDB
Decidi começar a brincadeira com o [MongoBD](http://www.mongodb.org/). Não sei exatamente o que me levou a começar com o [Mongo](http://www.mongodb.org/), poderia ter sido [Cassandra](http://cassandra.apache.org/), [Redis](http://code.google.com/p/redis/), [CouchDB](http://couchdb.apache.org/), [RavenDB](http://ravendb.net/).<blockquote>MongoDB (from "humongous") is a scalable, high-performance, open source, document-oriented database. Written in C++.</blockquote>

### Document Oriented


MongoDB é baseado em documentos. Estes documentos são armazenados utilizando [BSON(Binary JSON)](http://bsonspec.org/).Digamos, a grosso modo, que um documento é um grafo de objetos. Desta maneira você armazena grafos de objetos e não linhas de dados.A [normalização no MongoDB](http://www.mongodb.org/display/DOCS/Schema+Design) se dá neste nível. Você deve analisar quais objetos "merecem" ter sua própria collection no database e quais devem apenas estar contidos dentro de outros documentos.Veja esta imagem do próprio site do MongoDB:[![referencias entre documentos no MongoDB](http://viniciusquaiato.com/images_posts/referencias-entre-documentos.png "referencias entre documentos no MongoDB")](http://viniciusquaiato.com/images_posts/referencias-entre-documentos.png)

Nesta imagem podemos ver que o documento _student_ possui dentro dele um documento _address_ e documentos _score_. Isto quer dizer que não há necessidade de _address_ e _score_ terem suas "próprias tabelas".Além disso existe uma collection para os documents _course_.Isto é apenas uma das particularidas do MongoDB. Vocês podem conferir uma série de features e seus detalhamentos no próprio site do MongoDB: - [Indexes](http://www.mongodb.org/display/DOCS/Indexes)
- [Replication & High Availability](http://www.mongodb.org/display/DOCS/Replication)
- [Auto-Sharding](http://www.mongodb.org/display/DOCS/Sharding)
- [Querying](http://www.mongodb.org/display/DOCS/Querying)
- [Fast In-Place Updates](http://www.mongodb.org/display/DOCS/Updating)
- [Map/Reduce](http://www.mongodb.org/display/DOCS/MapReduce)


### Instalando o MongoDB
Bom eu estou usando um Mac mas o processo de instalação para o Windows é bastante simples e possui um tutorial completo no próprio site do Mongo: [http://www.mongodb.org/display/DOCS/Quickstart+Windows](http://www.mongodb.org/display/DOCS/Quickstart+Windows).Não há mistério algum, basta executar o arquivo "mongod.exe" e o servidor Mongo estará rodando.No Mac é o mesmo processo. 

### Executando o MongoDB
Para iniciar o servidor Mongo abra o terminal(ou o cmd) e execute o mongod.Abra então outro terminal(cmd) e execute o mongo. Com isso realizaremos operações no nosso servidor Mongo.# Executando operações no servidor Mongo
Vamos listar os databases existentes no nosso servidor:

### Listando databases no MongoDB

{% highlight csharp %}
show dbs;
    
{% endhighlight %}
A saída deve ser parecida com esta:
{% highlight csharp %}
> show dbs;
    admin(empty)local(empty)
{% endhighlight %}


### Criando um novo database no MongoDB
Para criar um novo database vamos executar simplesmente o comando use:
{% highlight csharp %}
> use meu_novo_database;
    switched to db meu_novo_database
{% endhighlight %}
Pronto! Database criado. 

### Adicionando documentos em uma collection no MongoDB
Vamos então criar alguns documentos em uma collection chamada Pessoas:
{% highlight csharp %}
> db.Pessoas.insert({
ome: "vinicius", idade: 25}
);
    > db.Pessoas.insert({
ome: "willy wonka", idade: 31}
);
    
{% endhighlight %}
Acima inserimos dois documentos na collection Pessoas.

### Recuperando documentos de uma collection no MongoDB
Vamos então selecionar nossos documentos:
{% highlight csharp %}
> db.Pessos.find();
    
{% endhighlight %}
Este comando vai nos retornar um cursor para os elementos da nossa collection. Neste caso veremos a seguinte saída no terminal:
{% highlight csharp %}
> db.Pessoas.find();
    { "_id" : ObjectId("4dcec4b993d74e78121d4312"), "nome" : "vinicius", "idade" : 25 }
{ "_id" : ObjectId("4dcec57e93d74e78121d4313"), "nome" : "willy wonka", "idade" : "?" }

{% endhighlight %}


### Filtrando documentos em uma collection no MongoDB
Para selecionarmos apenas um documento filtrando por alguma de suas propriedades:
{% highlight csharp %}
> db.Pessoas.find({
dade:25}
);
    { "_id" : ObjectId("4dcec4b993d74e78121d4312"), "nome" : "vinicius", "idade" : 25 }

{% endhighlight %}
# Resumo
Bom galera com isso acho que conseguimos instalar e começar a brincar com o MongoDB. Para os próximos posts eu vou mostrar de fato como utilizá-lo em aplicações .NET/Mono.É importante dar uma lida na documentação e principalmente nos conceitos e particularidades de bancos não relacionais.Eu gostaria ainda de deixar uma provocação: não são os devs que precisam convencer os DBAs de que uma solução NoSQL/Não relacional é a ideal, mas os DBAs devem convencer os devs de que a solução relacional é a melhor.Abraços e bons estudos.Vinicius Quaiato.
