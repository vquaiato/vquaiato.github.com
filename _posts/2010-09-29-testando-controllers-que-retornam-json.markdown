--- 
layout: post
title: Testando controllers que retornam Json
wordpress_id: 1637
wordpress_url: http://viniciusquaiato.com/blog/?p=1637
categories: 
- title: TDD
  slug: tdd
  autoslug: tdd
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: Json
  slug: json
  autoslug: json
- title: Actions
  slug: actions
  autoslug: actions
- title: JsonResult
  slug: jsonresult
  autoslug: jsonresult
- title: Testes Json
  slug: testes-json
  autoslug: testes-json
- title: MVC Json
  slug: mvc-json
  autoslug: mvc-json
- title: ASP.NET MVC Json
  slug: asp-net-mvc-json
  autoslug: asp.net-mvc-json
- title: Testando Json MVC
  slug: testando-json-mvc
  autoslug: testando-json-mvc
---
Fala galera. Mostrei por alto um teste de controller [ASP.NET MVC](http://asp.net/mvc) que retornava [Json](http://www.json.org/) [aqui neste post](http://viniciusquaiato.com/blog/asp-net-mvc-testando-controllers-parte-ii/). A idéia agora é trabalhar um pouco mais este tipo de teste e deixar claro o que podemos fazer com isso.<blockquote>Quando estamos trabalhando com actions que retornam Json o problema que temos é que elas não retornam Json!</blockquote>O [JsonResult](http://msdn.microsoft.com/en-us/library/system.web.mvc.jsonresult.aspx) retornado possui um método [ExecuteResult](http://msdn.microsoft.com/en-us/library/system.web.mvc.jsonresult.executeresult.aspx), e é este o método responsável por gerar o Json e colocar no response. Se quisermos testar efetivamente o Json precisamos executar este método, ou de alguma maneira fazer o que ele faz.Vamos utilizar o seguinte Controller como exemplo:<pre lang="csharp">public class HomeController : Controller{    public JsonResult DadosJson()    {        return Json(new { Id = 10, Nome = "Vinicius" });    }}</pre>Bastante simples. Estamos apenas retornando 2 valores a serem transformados em Json.Vamos ao nosso teste:<pre lang="csharp" line="1">[TestMethod]public void TestMethod1(){    var controller = new HomeController();    var result = controller.DadosJson();    Assert.AreEqual(@"{""Id"":10,""Nome"":""Vinicius""}", result.Data);}</pre>Isso é o que eu queria fazer, mas infelizmente não é possível.

### JavaScriptSerializer
Uma das alternativas, a mais simples ao meu ver, é adicionar estas duas linhas de código ao teste:<pre lang="csharp" line="1">[TestMethod]public void TestMethod1(){    var controller = new HomeController();    var result = controller.DadosJson();    var serializer = new JavaScriptSerializer();    var output = serializer.Serialize(result.Data);    Assert.AreEqual(@"{""Id"":10,""Nome"":""Vinicius""}", output);}</pre>Com o código das **_linhas 7 e 8_** serializamos os nossos dados em forma Json, e podemos utilizá-los em nosso teste para a verificação.Eu achei que houvesse um problema com esse código. Em um primeiro momento pode parecer que este não é exatamente o código que o [ASP.NET MVC](http://aspnet.codeplex.com/) executa, então pode parecer um pouco falho. no entanto, se formos olhar o código fonte do ASP.NET MVC no CodePlex veremos que é basicamente isso mesmo que ele faz:[http://aspnet.codeplex.com/SourceControl/changeset/view/55373#266491](http://aspnet.codeplex.com/SourceControl/changeset/view/55373#266491)Desta forma fica bem claro que ao menos por enquanto este código pode ser utilizado com segurança para testar actions que retornam dados em formato Json.Podemos melhorar um pouco isso, e criar um extension method para o JsonResult e utilizar em nossos testes:<pre lang="csharp" line="1">public static class JsonResultTestExtensions{    public static string GenerateOutputJson(this JsonResult result)    {        var serializer = new JavaScriptSerializer();        var output = serializer.Serialize(result.Data);        return output;    }}</pre>_Reparem que este extension method será criado no projeto de testes, ou em uma DLL a ser referenciada apenas nos projetos de testes!_E nosso teste ficaria assim:<pre lang="csharp" line="1">[TestMethod]public void TestMethod1(){    var controller = new HomeController();    var result = controller.DadosJson();    Assert.AreEqual(@"{""Id"":10,""Nome"":""Vinicius""}", result.GenerateOutputJson());}</pre>Bem mais limpo!

### Outras formas...
Existem outras formas de realizar esta tarefa, no entanto esta me pareceu a mais simples. Uma outra envolve chamar o método ExecuteResult, porém para isso precisamos mockar 3 objetos e configurar callbacks, o que não fica muito intuitivo, sendo que o que precisamos é apenas executar aquelas duas linhas assim como o ASP.NET MVC fará.Se quiserem ver como seriam estas outras maneiras, podem dar uma olhada neste link [aqui](http://www.heartysoft.com/post/2010/05/25/ASPNET-MVC-Unit-Testing-JsonResult-Returning-Anonymous-Types.aspx).

### Resuminho
Com isto conseguimos mais uma forma de testar nossas actions que retornam dados Json. Se precisamos de fato validar a estrutura Json destas informações, agora já temos uma maneira simples de fazer isso.Se precisarmos validar os dados, sem nos preocupar com o Json, podemos trabalhar conforme mostrado [neste post aqui](http://viniciusquaiato.com/blog/asp-net-mvc-testando-controllers-parte-ii/).O importante é escrevermos os testes, de forma que eles nos ajudem da melhor forma possível, e nos possibilitem deixar o sistema mais "previsível" quando futuras mudanças ocorrerem.Abraços, e espero que seja útil.Vinicius Quaiato.
