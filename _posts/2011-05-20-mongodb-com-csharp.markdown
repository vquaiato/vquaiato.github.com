--- 
layout: post
title: Usando MongoDB com C#
wordpress_id: 3441
wordpress_url: http://viniciusquaiato.com/blog/?p=3441
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


[![](http://viniciusquaiato.com/images_posts/mongodb_logo.png "mongodb_logo")](http://viniciusquaiato.com/images_posts/mongodb_logo.png)

Fala galera! [Depois de termos visto alguns conceitos e uso do MongoDB](http://viniciusquaiato.com/blog/primeiros-passos-com-mongodb/) vamos começar a programar. A idéia aqui vai ser mostrar um pouco do uso do [MongoDB](http://www.mongodb.org/) com C# (teremos mais posts aprofundando no uso, então take it easy). # Usando MongoDB com C#
Para começar a usar o Mongo com o C# precisamos fazer uso de um driver. O driver vai possibilitar uma comunicação com o MongoDB diretamente do nosso código C#. É o mesmo que acontece quando precisamos nos conectar no MSSQL Server, MySQL, etc, etc.Existem [vários drivers para MongoDB em diversas linguagens](http://www.mongodb.org/display/DOCS/Drivers), e também existe mais de um para C# e MongoDB e neste primeiro post vamos ver o driver padrão.

### Instalando o Mongo C# driver
Você pode baixar o Mongo C# driver usando o git, pois o mesmo está no GitHub: [https://github.com/mongodb/mongo-csharp-driver](https://github.com/mongodb/mongo-csharp-driver).Se você ainda não é dos que se rendeu ao Git e ao Github, faça o download do zip: [https://github.com/mongodb/mongo-csharp-driver/downloads](https://github.com/mongodb/mongo-csharp-driver/downloads)A "instalação" é bastante simples, basta extrair o zip :D

### Referenciando o Mongo C# driver no projeto


Vamos então referenciar as dlls do driver e começar a trabalhar. Adicione referências ao projeto para as duas dlls do mongodb csharp driver:[![adicionando referencia mongo csharp driver](http://viniciusquaiato.com/images_posts/adicionando-referencia-mongo-csharp-driver-300x280.png "adicionando referencia mongo csharp driver")](http://viniciusquaiato.com/images_posts/adicionando-referencia-mongo-csharp-driver.png)

(este processo é exatamente igual no Visual Studio)

##

## Se preferir com o NuGet

{% highlight csharp %}
Install-Package MongoDB.Driver
{% endhighlight %}
TODOS COMEMORA \o/

## Conectando no MongoDB com C#
Vamos então conectar no nosso servidor MongoDB e acessar um banco de dados. (Para informações sobre [como instalar e executar o servidor MongoDB veja este post aqui](http://viniciusquaiato.com/blog/primeiros-passos-com-mongodb/))Após executar o servidor e ter as referências adicionadas ao nosso projeto vamos utilizar uma classe chamada MongoServer para nos conectarmos ao servidor MongoDB:
{% highlight csharp %}
var server = MongoServer.Create("mongodb://localhost");
    server.Connect();
    server.Disconnect();
    
{% endhighlight %}
A classe MongoServer é a conexão com os servidores mongo que teremos. Por debaixo dos panos um pool de conexões é utilizado.Na **_linha 1_** informamos uma connection string para realizar a conexão com o server. A connection string possuirá um formato parecido com este:
{% highlight csharp %}
mongodb://[username:password@]hostname[:port][/[database][?options]]
{% endhighlight %}
Reparem que obrigatório mesmo é o hostname, no nosso caso "localhost".Na **_linha 3_** temos o método Connect, que como se pode imaginar conecta ao server ;
    )

## Acessando um database MongoDB com C#
Para acessarmos um database temos algumas opções de utilização do método GetDatabase. A mais simples é como segue:
{% highlight csharp %}
var database = server.GetDatabase("nome_database");
    
{% endhighlight %}
A classe MongoDatabase, como podemos "adivinhar", representa um database no servidor mongo \o/É no database que teremos nossas collections com as quais vamos interagir para adicionar e recuperar grafos de objetos(documentos). 

## Acessando uma collection MongoDB com C#
Para acessar uma collection vamos utilizar o método GetCollection<t> da classe MongoDatabase:
{% highlight csharp %}
var collection = database.GetCollection<usuario>("usuarios");
    </usuario>
{% endhighlight %}
Isso quer dizer que a collection "usuarios" vai nos retornar uma collection contendo documentos Usuario. Este é apenas o documento padrão para esta collection, que pode ter diversos tipos diferentes de documentos, que podem ser solicitados futuramente.Vamos então ver um código mais completo de conexão ao server do MongoDB, acesso a um database e então seleção de uma collection:
{% highlight csharp %}
var server = MongoServer.Create ("mongodb://localhost");
    try {
erver.Connect ();
    Console.WriteLine ("Server Conectado");
var db = server.GetDatabase ("my_first_mongodb_db");
var usuarios = db.GetCollection<usuario> ("usuarios");
var total_usuarios = usuarios.Count ();
    Console.WriteLine ("existem {
}
 usuarios", total_usuarios);
    }
 catch (Exception ex) {
onsole.WriteLine ("Fuuuu\r\n{
}
", ex.Message);
    }
 finally {
erver.Disconnect ();
    Console.WriteLine ("Desconectando");
    }
</usuario>
{% endhighlight %}
Quando executarmos este código veremos que não temos nenhum usuário na collection usuarios. Precisamos então inserir algum usuário, vamos então adicionar o seguinte código dentro do try:
{% highlight csharp %}
var usuario = new Usuario { Id = 10, Nome = "Vinicius no MongoDB", Email = "vinicius@blog" }
;
    usuarios.Insert<usuario> (usuario);
    total_usuarios = usuarios.Count ();
    Console.WriteLine ("e agora existem {
}
 usuarios", total_usuarios);


    </usuario>
{% endhighlight %}
O que estamos fazendo acima é criando um objeto da classe Usuario e então chamando o método Insert<t> estamos passando este objeto para a collection do MongoDB. Este T genérico no método Insert é para especificar o tipo do documento que estamos inserindo, pois sabemos uma collection pode possuir diferentes tipos de documento.Com isso deveremos ter uma saída parecida com esta:[![executando aplicacao csharp usando mongodb](http://viniciusquaiato.com/images_posts/executando-aplicacao-csharp-usando-mongodb-300x201.png "executando aplicacao csharp usando mongodb")](http://viniciusquaiato.com/images_posts/executando-aplicacao-csharp-usando-mongodb.png)



## Resumo
O trabalho de conexão com o MongoDB utilizando o driver para C# é bastante simples. Existem muitas informações sobre as principais classes a serem utilizadas na própria página do MongoDB: [http://www.mongodb.org/display/DOCS/CSharp+Driver+Tutorial](http://www.mongodb.org/display/DOCS/CSharp+Driver+Tutorial).Até o momento não trabalhamos de uma maneira tão diferente da que estamos acostumados com outros bancos de dados. A diferença principal até este momento é a total ausência de esquema. Ou seja não precisamos previamente definir um banco, uma tabela, suas colunas, tipos, etc. Essa liberdade, essa ausência de esquema é algo que realmente me agrada, e muito.Entendo que em alguns cenários isso pode causar "medo". Mas vamos tentar abordar cenários onde isso acontece e o que devemos fazer. Mas vamos aos poucos ;
    )Abraços galera e até a próxima,Vinicius Quaiato.</t></t>
