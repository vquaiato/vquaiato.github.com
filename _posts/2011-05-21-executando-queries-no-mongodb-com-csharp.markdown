--- 
layout: post
title: Executando queries no MongoDB com C#
wordpress_id: 3472
wordpress_url: http://viniciusquaiato.com/blog/?p=3472
categories: 
- title: NoSQL
  slug: nosql-2
  autoslug: nosql
tags: 
- title: MongoDB
  slug: mongodb
  autoslug: mongodb
- title: Queries
  slug: queries
  autoslug: queries
- title: Select MongoDB C#
  slug: select-mongodb-c
  autoslug: select-mongodb-c#
- title: Consultas no MongoDB com C#
  slug: consultas-no-mongodb-com-c
  autoslug: consultas-no-mongodb-com-c#
---
[![](http://viniciusquaiato.com/blog/wp-content/uploads/2011/05/trees-567-300x225.jpg "trees-567")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/05/trees-567.jpg)Agora que já vimos como [instalar e executar o MongoDB](http://viniciusquaiato.com/blog/primeiros-passos-com-mongodb/) e [interagir com o MongoDB no C#](http://viniciusquaiato.com/blog/mongodb-com-csharp/) está na hora de começar a executar algumas consultas, afinal de nada adianta ter documentos(grafos de objetos) armazenados se não vamos consulta-los.Nós estamos trabalhando com o [driver oficial do MongoDB para C#](https://github.com/mongodb/mongo-csharp-driver) então por enquanto vamos nos limitar aos tipos de query que podemos executar e a forma de executa-las com este driver. [Outros drivers](http://www.mongodb.org/display/DOCS/CSharp+Community+Projects) podem fornecer outras maneiras de executar suas consultas.Vamos usar estas classes para nossos exemplos:<pre lang="csharp">class Post{public ObjectId Id {get;set;}public Autor Autor {get;set;}public string Titulo {get;set;}public string Body {get;set;}public DateTime DataPublicacao {get;set;}public List<comentario> Comentarios {get;set;}}class Autor{public ObjectId Id {get;set;}public string Email {get;set;}public string Nome {get;set;}}class Comentario{public ObjectId Id {get;set;}public string Conteudo {get;set;}public string Email {get;set;}public string Nome {get;set;}}</comentario></pre>

## Recuperando todos os documentos de uma coleção do MongoDB
Uma das formas de recuperarmos todos os documentos de uma collection no MongoDB é utilizando o método FindAll da collection:<pre lang="csharp">var db = server.GetDatabase("blog");var posts = db.GetCollection<post>("posts");var todosPosts = posts.FindAll();foreach(var post in todosPosts)Console.WriteLine("Titulo: {0} - por: {1}({2}) \r\n{3} \r\n\r\n",  post.Titulo, post.Autor.Nome, post.Autor.Email, post.Body);</post></pre>Abaixo podemos conferir o resultado deste programa:[caption id="attachment_3477" align="aligncenter" width="300" caption="saida execucao FindAll com MongoDB"][![saida execucao FindAll com MongoDB](http://viniciusquaiato.com/blog/wp-content/uploads/2011/05/saida-execucao-FindAll-com-MongoDB-300x119.png "saida execucao FindAll com MongoDB")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/05/saida-execucao-FindAll-com-MongoDB.png)[/caption]Tudo o que fizemos foi executar o método FindAll e todos os nossos documentos totalmente hidratados foram retornados, ou seja não precisamos realizar joins entre uma tabela de posts, a tabela de autores e a tabela de comentários. Os documentos completos foram retornados em uma requisição só.Ok mas como fazemos um filtro para pegar um post com um determinado título?

## Utilizando Query.EQ no MongoDB com C#
Para realizarmos este tipo de query vamos utilizar a classe Query que é um builder para montar uma query do tipo IMongoQuery.Para filtrarmos os posts com um determinado titulo vamos fazer como abaixo:<pre lang="csharp">var query = Query.EQ("Titulo", "Mais um post sobre MongoDB");var todosPosts = posts.Find(query);</pre>O que estamos fazendo é criando uma query onde o queremos os documentos onde o Titulo é igual(EQ) a "Mais um post sobre MongoDB". O resultado pode ser visto abaixo:[caption id="attachment_3478" align="aligncenter" width="300" caption="saida execucao Find com Query.EQ"][![saida execucao Find com Query.EQ](http://viniciusquaiato.com/blog/wp-content/uploads/2011/05/saida-execucao-Find-com-Query.EQ--300x105.png "saida execucao Find com Query.EQ")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/05/saida-execucao-Find-com-Query.EQ-.png)[/caption]Ok agora vamos ver como executar queries do tipo and.

## Executando queries and com Query.And no MongoDB com C#
Para executarmos uma query com mais de um critério, ou seja utilizando uma cláusula and vamos utilizar o build Query.And passando as queries que queremos executar.Vejamos como selecionar posts que tenham um determinado título e o autor um determinado email:<pre lang="csharp">var query = Query.And(                      Query.EQ("Titulo", "Mais um post sobre MongoDB"),                      Query.EQ("Autor.Email", "vquaiato@provedor.com"));var todosPosts = posts.Find(query);</pre>Notem que criamos uma query do tipo and informando duas queries do tipo igual(EQ). Isso quer dizer que os documentos a serem retornados deverão satisfazer as duas igualdades(email and titulo).Com isso já vimos também como selecionar documentos baseado em propriedades dos agregados, neste caso uma propriedade do objeto autor que está contido em post.

## Executando queries do tipo or com Query.Or no MongoDB com C#
Consultas deste tipo são bastante similares às anteriores, bastando mudar o método no nosso builder para Query.Or:<pre lang="csharp">var query = Query.Or(                      Query.EQ("Titulo","Mais um post sobre MongoDB"),                      Query.EQ("Autor.Email","email2@provedor.com"));var todosPosts = posts.Find(query);</pre>O que fazemos neste caso é trazer os documentos que possuam o Titulo informado ou(Or) o autor possua o email informado.O resultado pode ser conferido abaixo:[caption id="attachment_3482" align="aligncenter" width="300" caption="saida execucao Find com Query.Or"][![saida execucao Find com Query.Or](http://viniciusquaiato.com/blog/wp-content/uploads/2011/05/saida-execucao-Find-com-Query.Or_-300x118.png "saida execucao Find com Query.Or")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/05/saida-execucao-Find-com-Query.Or_.png)[/caption]

## Executando queries do tipo In(range) com Query.In no MongoDB com C#
É comum precisarmos obter informações dado um conjunto de valores. Por exemplo "obter os clientes que residam nas cidades A, B ou C".Vamos então criar uma query utilziando o builder Query.In informando um BsonArray:<pre lang="csharp">var query = Query.In("Titulo", new BsonArray {"FindAll no MongoDB", "Um terceiro post sobre MongoDB"});var todosPosts = posts.Find(query);</pre>O resultado disto são 2 posts retornados, um para cada Titulo informado em nossa consulta:[caption id="attachment_3486" align="aligncenter" width="300" caption="saida execucao Find com Query.In"][![saida execucao Find com Query.In](http://viniciusquaiato.com/blog/wp-content/uploads/2011/05/saida-execucao-Find-com-Query.In_-300x113.png "saida execucao Find com Query.In")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/05/saida-execucao-Find-com-Query.In_.png)[/caption]

## Resumo
Não há como fugir de consultas, afinal se armazenamos dados, informações, documentos, objetos, etc, é por que em algum momento precisaremos obter estes novamente e trabalhar com eles. Vimos alguns exemplos de como fazer isso utilizando o driver do MongoDB para C#. Existem ainda uma série de outras possibilidades que não foram detalhadas aqui, você pode então conferir mais na documentação aqui: [http://api.mongodb.org/csharp/1.0/](http://api.mongodb.org/csharp/1.0/).Estou ficando bem impressionado com o MongoDB e a cada teste que faço começo a considerar mais utilizá-lo para um série de casos, e muitos deles são os mais comuns (CRUDs, LOBs etc).Abraços,Vinicius Quaiato.
