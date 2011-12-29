--- 
layout: post
title: "ASP.NET MVC: Testando controllers parte III"
wordpress_id: 1556
wordpress_url: http://viniciusquaiato.com/blog/?p=1556
categories: 
- title: TDD
  slug: tdd
  autoslug: tdd
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: Testes upload
  slug: testes-upload
  autoslug: testes-upload
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
- title: "Testes Unit\xC3\xA1rios"
  slug: testes-unitarios
  autoslug: "testes-unit\xC3\xA1rios"
- title: testes
  slug: testes
  autoslug: testes
- title: TDD
  slug: tdd
  autoslug: tdd
- title: Unit Tests
  slug: unit-tests
  autoslug: unit-tests
- title: Mocks
  slug: mocks
  autoslug: mocks
- title: controller upload
  slug: controller-upload
  autoslug: controller-upload
---
[![](http://viniciusquaiato.com/blog/wp-content/uploads/2010/09/CargaPesada-150x150.jpg "Testando Uploads")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/09/CargaPesada.jpg)Fala galera, neste terceiro post sobre ASP.NET MVC e testes([post I](http://viniciusquaiato.com/blog/asp-net-mvc-testando-controllers-parte-i/) e [post II](http://viniciusquaiato.com/blog/asp-net-mvc-testando-controllers-parte-ii/)) vou mostrar como testar a action de um controller que realiza upload de arquivos.# Testar um controller que realiza upload de arquivos
Este não é o teste mais simples, mas também não é complexo. A particularidade aqui é que estou utilizando o Moq, e com ele não consigo dar "bypass" nas propriedades que eu não quero mockar, ou seja, preciso mockar toda a cadeia da chamada (se vocês tiverem uma forma mais simples, é só mandar).### Configurando arquivo Resources
Vamos lá, antes de codificar, eu adiciono um arquivo de recursos no projeto de testes e adiciono uma foto como resource:[![](http://viniciusquaiato.com/blog/wp-content/uploads/2010/09/arquivo-resource-300x193.png "Adicionando arquivo resource")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/09/arquivo-resource.png)[![](http://viniciusquaiato.com/blog/wp-content/uploads/2010/09/adicionando-imagem-como-resource-300x194.png "Adicionando imagem como resource")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/09/adicionando-imagem-como-resource.png)### O código de testes
<pre lang="csharp" line="1">public void Deve_Salvar_Uma_Imagem_Que_Foi_Postada(){    //Arrange    var controllerFotos = new ControllerFotos();            var encoding = new UTF8Encoding();    var memoryStream = new MemoryStream();    ArquivosPostados.ImagemPostada.Save(memoryStream, ImageFormat.Jpeg);    postedFile = new Mock<httppostedfilebase>();    postedFile.Setup(p => p.InputStream).Returns(memoryStream);    var files = new Mock<httpfilecollectionbase>();    files.Setup(f => f[0]).Returns(postedFile.Object);    var request = new Mock<httprequestbase>();    request.Setup(r => r.Files).Returns(files.Object);    var context = new Mock<httpcontextbase>();    context.Setup(c => c.Request).Returns(request.Object);    controllerContext = new ControllerContext(context.Object, new RouteData(), controllerFotos);    controllerFotos.ControllerContext = controllerContext;    //Act    controllerFotos.Upload();    //Assert    postedFile.Verify(p => p.SaveAs(It.IsAny<string>()), Times.Once());}</string></httpcontextbase></httprequestbase></httpfilecollectionbase></httppostedfilebase></pre>### Explicando o teste
O teste em si é bastante simples.Nas **_linhas 6, 7 e 8_** o que fazemos é pegar a imagem do arquivo de resources e jogamos para um MemoryStream. Fazemos isso pois é desta forma que o PostedFile trabalha, com um Stream._ArquivosPostados_ é o nome do meu arquivo de resource, e _ImagemPostada_ é o nome da imagem que adicionei ao arquivo.Nas **_linhas 10 e 11_** criamos um mock para [HttpPostedFileBase](http://msdn.microsoft.com/en-us/library/system.web.httppostedfilebase.aspx), que é o tipo a ser retornado pela lista de PostedFiles no nosso controller. E configuramos ele para retornar nossa imagem que está no memory stream.Nas **_linhas 13 e 14_** configuramos a coleção de arquivos mockando o [HttpFileCollectionBase](http://msdn.microsoft.com/en-us/library/system.web.httpfilecollectionbase.aspx). Dizemos que quando for acessado o índice zero desta coleção deve retornar nosso posted file mockado.Nas **_linhas 16 e 17_** criamos o mock do [HttpRequestBase](http://msdn.microsoft.com/en-us/library/system.web.httprequestbase.aspx), desta forma quando for solicitado a coleção de Files retornaremos nossa lista mockada.Nas **_linhas 19 e 20_** fazemos o mock do [HttpContextBase](http://msdn.microsoft.com/en-us/library/system.web.httpcontextbase.aspx), assim quando solicitarmos o Request retornaremos nosso request mockado.Para finalizar, nas **_linhas 22 e 23_** criamos um [ControllerContext](http://msdn.microsoft.com/en-us/library/system.web.mvc.controllercontext.aspx) usando nosso HttpContext mockado, e então colocamos este contexto no nosso controller.Isso tudo serve para que tenhamos controle total sobre todos os arquivos passados para nosso controller, sem haver nenhuma necessidade do upload manual, tornando assim o teste realmente automatizado.Na **_linha 26_** fazemos a chamada para a action, nesse caso chamada Upload.Na **_linha 29_** fazemos a verificação para saber se nossa action realmente salvou o arquivo que foi enviado.Abaixo temos o código do nosso controller:<pre lang="csharp" line="1">public ViewResult Upload(){    if (Request.Files[0] != null)    {        Request.Files[0].SaveAs(string.Empty);        return View("UploadSucesso");    }    return View();}</pre>### Considerações
O código de testes pode parecer longo, e o código do controller relativamente simples. Mas é claro que este código está bem resumido. O controller provavelmente faz mais coisas do que simplesmente salvar a imagem em disco. Talvez hajam validações quanto ao nome, formato, tamanho do arquivo. Talvez exista uma rotina para realizar crop, resize, rename da imagem. Tudo isso deve ser testado, e sinceramente, esse código é bastante simples e rápido de ser escrito, e não custa nada criar alguns testes como este. Sendo assim, acho que há benefício em manter este teste na sua suíte e no seu projeto.Eu consegui não precisar mockar todos estes objetos utilizando o framework de mock da [Telerik - JustMock](http://www.telerik.com/products/mocking.aspx). Mas como é um produto pago, preferi não basear meu post nele.Com Rhino e Moq eu não consegui o mesmo resultado. Então se vocês tiverem sugestões e conhecimento de como não mockar todos estes objetos, é só enviar e eu divulgo.É isso galera, espero que este tipo de testes também lhes seja útil e ajude a criar aplicações ainda mais robustas com ASP.NET MVC.Abraços,Vinicius Quaiato.
