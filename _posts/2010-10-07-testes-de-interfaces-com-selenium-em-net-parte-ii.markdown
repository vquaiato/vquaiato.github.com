--- 
layout: post
title: Testes de interfaces com Selenium em .NET parte II
wordpress_id: 1721
wordpress_url: http://viniciusquaiato.com/blog/?p=1721
categories: 
- title: TDD
  slug: tdd
  autoslug: tdd
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
tags: 
- title: Selenium
  slug: selenium
  autoslug: selenium
- title: Selenium IDE
  slug: selenium-ide
  autoslug: selenium-ide
- title: "Testes Aceita\xC3\xA7\xC3\xA3o"
  slug: testes-aceitacao
  autoslug: "testes-aceita\xC3\xA7\xC3\xA3o"
- title: ATDD
  slug: atdd
  autoslug: atdd
---
Fala galera, continuando a falar de testes automatizados de interface com Selenium, neste post pretendo mostrar como criar um teste utilizando o Selenium IDE e então utilizar este teste para garantir um comportamento em nossa interface. (para configurar as ferramentas, [veja este post aqui](http://viniciusquaiato.com/blog/testes-de-interfaces-com-selenium-em-net/))Geralmente este tipo de teste costumam funcionar como um teste de aceitação, pois ele interage diretamente com a mesma interface que os utilizadores do sistema, fazendo as mesmas operações de negócio que ele faria.### O exemplo
Neste primeiro exemplo estou trabalhando com uma "calculadora" em ASP.NET MVC.Criei uma view bem simples que pode ser vista na listagem abaixo:<pre lang="xml"><head runat="server">    <title>Calculadora</title></head><body>    <div>        # Calculadora
        <%: Html.TextBox("numero1") %>        <%: Html.TextBox("numero2") %>        <input type="button" value="Calcular" id="calcular" />        <span id="resultado"></span>    </div></body></pre>### Gravando o teste com Selenium IDE
Feito isso vamos gravar nosso teste. Lembrando que a gravação deste teste irá dizer como o sistema deve se comportar, e então ele falhará. Após falhar faremos a implementação da calculadora de forma que o teste passe.Veja no vídeo abaixo como gravar o teste com o Selenium IDE.<iframe src="http://player.vimeo.com/video/15617285" width="400" height="300" frameborder="0"></iframe>
[Gravando test case com Selenium IDE](http://vimeo.com/15617285) from [vinicius quaiato](http://vimeo.com/user2557055) on [Vimeo](http://vimeo.com).
Como pode ser visto no vídeo, eu gravo minha interação com a página(digitando 2, 2 e depois clicando no botão).Insiro uma ação extra, que pode ser traduzida como:"Aguarde o texto no elemento 'resultado' que deve conter o valor 'Resultado: 4".Percebam que o target é definido utilizando XPath.Com isso estou dizendo: 'quando eu digitar 2 em um campo, 2 no outro campo e clicar no botão resultado, o texto 'Resultado: 4' deve aparecer na página".Se quiser, no meu "file" escolha "Save Test Case" e salve o teste em uma pasta de sua escolha, com qualquer nome. Não é necessária nenhuma extensão.### Codificando a calculadora no ASP.NET MVC
Tudo que vou fazer é criar uma action no meu controller, como mostra o código abaixo:<pre lang="csharp">[HttpPost]public JsonResult Somar(int numero1, int numero2){    var resultado = numero1 + numero2;    return Json(new { resultado = resultado });}</pre>Feito isso, vou chamar essa action via Ajax na minha viu, com o seguinte código:<pre lang="javascript"><script>    $(document).ready(function () {        $("#calcular").click(function () {            var num1 = $("#numero1").val();            var num2 = $("#numero2").val();            $.post("Calculadora/Somar/", { numero1: num1, numero2: num2 }, function (data) {                $("#resultado").html("Resultado: " + data.resultado);            }, "json");        });    });</script></pre>### Executando teste com Selenium IDE
Feito isso, vamos iniciar novamente nossa aplicação. Abra o Selenium IDE, e no meu "File" use a opção "Open Test Case" e selecione o teste que você salvou. Agora basta Executar o teste e observar que todos os steps ficarão verdes, como mostra o vídeo abaixo:<iframe src="http://player.vimeo.com/video/15617687" width="400" height="300" frameborder="0"></iframe>
[Executando test case com Selenium IDE](http://vimeo.com/15617687) from [vinicius quaiato](http://vimeo.com/user2557055) on [Vimeo](http://vimeo.com).
### Resumo
Com isso podemos começar a ter uma idéia do poder do Selenium para testes de interface e testes de aceitação de nossas aplicações web.Notem que como este é um teste de aceitação, ele cobre nossa aplicação de ponta a ponta, ou seja, se um clique do botão vai disparar uma ação que vai ao banco de dados, faz processamentos, e retorna um resultado, isso tudo está automatizado e de forma verificável, de acordo com as necessidades e critérios dos utilizadores da aplicação, não estamos falando apenas de testes em nível de código.O Selenium possui uma série de comandos que vocês podem utilizar, veja aqui na documentação:[http://seleniumhq.org/docs/04_selenese_commands.html](http://seleniumhq.org/docs/04_selenese_commands.html)(é MUITO importante lermos a documentação das ferramentas que temos a disposição).No próximo post mostrarei como automatizar este teste em forma de teste unitário e executá-lo dentro da solution ASP.NET MVC com código C#.[Baixe a solution ASP.NET MVC aqui](http://viniciusquaiato.com/files/codesamples/MVC/MvcCalculadoraSelenium.zip).Até a próxima,Vinicius Quaiato.
