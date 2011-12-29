--- 
layout: post
title: "QuickTip: Testando m\xC3\xA9todos que geram XML"
wordpress_id: 1615
wordpress_url: http://viniciusquaiato.com/blog/?p=1615
categories: 
- title: TDD
  slug: tdd
  autoslug: tdd
tags: 
- title: testes
  slug: testes
  autoslug: testes
- title: XML
  slug: xml
  autoslug: xml
- title: Testes com XML
  slug: testes-com-xml
  autoslug: testes-com-xml
---
O problema de métodos que geram XML é que para testá-los precisamos ou formatar a string XML corretamente, ou deixar tudo em uma única linha, etc.Uma forma simples de evitar esse problema é trabalhando com objetos XML mesmo, como o XmlDocument e XmlElement, vejamos:<pre lang="csharp" line="1">[TestMethod]public void TestMethod1(){    var esperado = new XmlDocument();    esperado.LoadXml(@"<produto><id>10</id>            <descricao>Produto muito bom</descricao>        <valor>10.00</valor>        </produto>");    var xmlGerado = ExportarParaXml(new {Id = 10, Descricao = "Produto muito bom", Valor = 10m});    Assert.AreEqual(esperado.InnerXml, xmlGerado.InnerXml);}</pre>Desta forma simples eu consigo comparar o XML retornado com um XML que eu tenho em formato string, sem me preocupar com as tabulações, espaçamentos, etc.É uma dica simples, mas que pode ajudar e facilitar bastante.Abraços,Vinicius Quaiato.
