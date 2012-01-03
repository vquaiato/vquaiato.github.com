--- 
layout: post
title: "EF4 POCO: Mapping and metadata information could not be found"
wordpress_id: 992
wordpress_url: http://viniciusquaiato.com/blog/?p=992
categories: 
- title: Visual Studio 2010
  slug: visual-studio-2010
  autoslug: visual-studio-2010
- title: .NET 4.0
  slug: net-4-0
  autoslug: .net-4.0
- title: Entity Framework
  slug: entity-framework
  autoslug: entity-framework
tags: 
- title: Entity Framework
  slug: entity-framework
  autoslug: entity-framework
- title: POCO
  slug: poco
  autoslug: poco
- title: ef 4.0
  slug: ef-4-0
  autoslug: ef-4.0
---
Fala galera, finalizando a edição de um artigo para a .Net Magazine o [Guinther Pauli](http://guintherpauli.blogspot.com/) me pediu para verificar um erro com um exemplo de utilização de [POCO ](http://viniciusquaiato.com/blog/entity-framework-4-model-first-com-pocos/)com o [EF4](http://viniciusquaiato.com/blog/category/entity-framework/).Quando o ObjectSet ia ser criado a seguinte exceção era disparada:<blockquote>Unhandled Exception: System.InvalidOperationException: Mapping and metadata information could not be found for EntityType 'POCO.Cliente'.</blockquote>Analisando o projeto, tudo estava certo. O EDMX, a classe POCO, o container. Vasculhei de cabo a rabo todos os arquivos XML de mapeamento gerados.Gerei novamente o banco de dados, os arquivos de mapeamento, e nada.Troquei todos os namespaces do projeto, e ainda assim o erro persistia.Às vezes estamos atrás de algo completamente "mirabolante" e não nos atentamos aos detalhes mais simples.

### Solução
Analisando tudo com muito cuidado e lendo 10.000 links no google finalmente encontrei o problema: No EDMX minha entidade Cliente estava definida com as propriedades _Id_ e _Nome_.A minha classe Cliente estava definida com as propriedades _ID_ e _Nome_. Perceberam? Pois é, o simples fato do <b><i>D</i></b> estava fazendo disparar esta exception, que não é nada descritiva.Fica aí a dica: Olhem com bastante atenção o nome das propriedades do Modelo e da Entidade.

Att,
Vinicius Quaiato.
