--- 
layout: post
title: Eval em C# com IronRuby
wordpress_id: 1346
wordpress_url: http://viniciusquaiato.com/blog/?p=1346
categories: 
- title: .NET 4.0
  slug: net-4-0
  autoslug: .net-4.0
- title: IronRuby
  slug: ironruby
  autoslug: ironruby
tags: 
- title: dynamic
  slug: dynamic
  autoslug: dynamic
- title: IronRuby
  slug: ironruby
  autoslug: ironruby
- title: ruby
  slug: ruby
  autoslug: ruby
- title: Eval
  slug: eval
  autoslug: eval
---
Fala galera, estava conversando com o [Bruno Kenj](http://www.brunokenj.net/) e ele estava com a necessidade realizar um Eval em C#.Bom, nem preciso dizer que minha resposta foi "Use IronRuby".Bom, segue abaixo o código que criei:<pre lang="csharp" line="1">public static class RubyEngineCreator{    private static ScriptEngine ironRubyEngine = null;    private static ScriptEngine CreateEngine()    {        if (ironRubyEngine == null)            ironRubyEngine = Ruby.CreateEngine();        return ironRubyEngine;    }    public static dynamic GetRubyObject(string script)    {        return CreateEngine().CreateScriptSourceFromString(script).Execute();    }}</pre>Simples não?!Seguem alguns testes e um método Eval que criei pra facilitar:<pre lang="csharp" line="1">[TestClass]public class UnitTest1{    private T Eval<t>(string s)    {        return (T)RubyEngineCreator.GetRubyObject(s);    }    [TestMethod]    public void Deve_Retornar_Somar_2_com_2_Retornar_4()    {        var retorno = Eval<int>("2 + 2");        Assert.AreEqual(4, retorno);    }    [TestMethod]    public void Deve_Retornar_ViniciusQuaiato()    {        var retorno = Eval<string>("'vinicius' + 'quaiato'");        Assert.AreEqual("viniciusquaiato", retorno);    }    [TestMethod]    public  void Deve_Dividir_9_por_3_Retornar_3()    {        var retorno = Eval<int>("9 / 3");        Assert.AreEqual(3,retorno);    }}</int></string></int></t></pre>Não é a melhor biblioteca do mundo para Eval, mas quebra o galho :PAqui está o [download da solution](http://viniciusquaiato.com/files/codesamples/IronRubyEval/IronRubyCsharpEvaluator.zip).Abraços,Vinicius Quaiato.
