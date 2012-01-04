--- 
layout: post
title: ASP.NET MVC e Jquery Ajax
wordpress_id: 2372
wordpress_url: http://viniciusquaiato.com/blog/?p=2372
categories: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: JQuery
  slug: jquery
  autoslug: jquery
- title: Ajax
  slug: ajax
  autoslug: ajax
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
- title: Jquery Ajax
  slug: jquery-ajax
  autoslug: jquery-ajax
---
[![](http://viniciusquaiato.com/images_posts/ajax-300x236.jpg "ajax")](http://viniciusquaiato.com/images_posts/ajax.jpg)Atualmente aplicação web é quase sinônimo de Ajax. Não tem como criar uma boa aplicação sem Ajax.Se você acha que é possível é por que provavelmente você é egoísta ao ponto de não pensar em quem usa sua aplicação.E hoje em dia Ajax é sinônimo de [Jquery](http://jquery.com). Alguém discorda disso?A maioria dos desenvolvedores para web hoje nem sabem o que é [XmlHttpRequest](http://www.w3.org/TR/XMLHttpRequest/). Isso não é ruim, estou apenas mostrando que já não imaginamos realizar este tipo de trabalho manualmente.O lema do [Jquer](http://jquery.com)y é: "Write less, do more." ou em bom português: "Escreva menos, faça mais.".

## Jquery
Jquery é uma biblioteca Javascript que tem por objetivo fornecer uma maneira simples, robusta e rápida de trabalhar com Ajax, manipulação do HTML, eventos e animações.É quase um padrão de mercado no que diz respeito a javascript. Se você quiser conhecer mais sobre o Jquery dê uma olhada na vasta documentação e exemplos nos próprio site deles: [http://docs.jquery.com/Main_Page](http://docs.jquery.com/Main_Page)

## ASP.NET MVC
Como muitos sabem o [ASP.NET MVC](http://asp.net/mvc) é o framework web Microsoft que trabalha com o padrão MVC.É muito comum aplicações [ASP.NET MVC](http://viniciusquaiato.com/blog/category/dotnet/asp-net-dotnet/asp-net-mvc/) trabalharem junto com Jquery por temos o controle total do HTML gerado pelo ASP.NET MVC o que facilita sua manipulação via Javascript.

## ASP.NET MVC e Ajax com Jquery
Vamos falar um pouco da [função ajax](http://api.jquery.com/jQuery.ajax/) do Jquery em conjunto com o ASP.NET MVC.Esta função ajax realiza requests http de forma assíncrona. Isso quer dizer que podemos realizar processamentos de partes de nossa aplicação fora do request principal da página, evitando assim requests da página inteira para processa pequenas ações.Vamos imaginar o seguinte cenário: Tela de listagem de produtos. Na mesma tela podemos fazer a inserção de um novo produto.A abordagem sem ajax é que o novo produto seja inserido e então toda a página seja recarregada com a listagem atualizada.Vou omitir algum código aqui para ser breve(todo fonte está disponível [aqui no github](https://github.com/vquaiato/ASP.NET-MVC-Jquery-Ajax).). Vamos ao controller:
{% highlight csharp %}

public class HomeController : Controller{    

public ActionResult Index()    {
if(Session["products"] == null)            Session["products"] = new SomeRepo().AllProducts().ToList();
return View(Session["products"] as List<product>);
    }
    
public ActionResult AddProduct(Product newProduct)    {
var products = Session["products"] as List<product>;
    products.Add(newProduct);
return RedirectToAction("Index");
    }
}
</product></product>
{% endhighlight %}
Este controller está atuando perfeitamente sem Ajax. É importante que tudo funcione sem ajax e então colocamos o novo comportamento com ajax. O código da view é bastante simples:
{% highlight csharp %}
@model IEnumerable<aspnetmvc_jquery_ajax.controllers.product>

## Products

    @using(Html.BeginForm("AddProduct", "Home", FormMethod.Post, new { id = "novo_produto" }
)){        Descrição:        @Html.TextBox("Description")        Preço:        @Html.TextBox("Price")             }

<table>    <tr>        <th>            Description        </th>        <th>            Price        </th>    </tr>    @foreach (var item in Model)    {        <tr>            <td>                @item.Description            </td>            <td>                @String.Format("{
:F}
", item.Price)            </td>        </tr>    }
</table></aspnetmvc_jquery_ajax.controllers.product>
{% endhighlight %}
Tudo está funcionando perfeitamente. Mas cadê o ajax Vinicius?Ok, vamos lá!A primeira coisa a fazer é adicionar uma referência para o jquery na nossa view. O Jquery já vem por padrão na pasta Scripts das aplicações ASP.NET MVC. Arraste o arquivo para a view.Vamos então configurar nosso formulário para utilziar o Jquery submetendo as infromações através de ajax:
{% highlight csharp %}
$(function () {    config_add_products();
    }
);
    function config_add_products() {    $("#novo_produto").submit(function (e) {        e.preventDefault();
    $.ajax({            url: $(this).attr("action"),            data: $(this).serialize(),            success: function (retorno) {                $("#products").append(retorno);
    }
        }
);
    }
);
    }

{% endhighlight %}
O que fazemo é bem simples. Na **_linha 1_** fazemos uma chamada para o Jquery configurar nosso formulário.Na **_linha 5_** estamos definindo o evento de submit do nosso form. Na **_linha 6_** cancelamos o submit padrão, ou seja, a página não será postada inteira para o servidor.Na **_linha 8_** começa a mágica onde fazemos uma chamada para a [função ajax do Jquery](http://api.jquery.com/jQuery.ajax/).Esta função recebe configurações através de chave-valor.A primeira informação que estamos enviando é a url e fazemos isso pegando o atributo action do nosso formulário na **_linha 9_**.Na **_linha 10_** estamos informando os dados que devem ser enviados para o servidor, neste caso os dois campos do nosso formulário serializados em Json.Na **_linha 11_** estamos informando uma função de callback, ou seja, uma função que será executada quando nossa requisição terminar com sucesso. E o que essa função faz é adicionar o resultado do servidor na nossa tabela de produtos.Sério, é tudo muito simples. E por que estamos adicionando o resultado do servidor direto no HTML? Veja você mesmo a alteração que fizemos no nosso controller:
{% highlight csharp %}

public ActionResult AddProduct(Product newProduct){
var products = Session["products"] as List<product>;
    products.Add(newProduct);
if(Request.IsAjaxRequest())
return PartialView("RowSingleProduct", newProduct);
return RedirectToAction("Index");
    }
</product>
{% endhighlight %}
Repare nas **_linhas 6 e 7_** que adicionamos uma verificação para saber se a chamada para a action veio de um contexto ajax. Caso tenha sido uma chamada Ajax não redirecionamos para a action Index, ao invés disso retornamos uma partial view com o resultado do novo produto. Isso nos permite ter uma mesma action atuando [com Ajax e sem Ajax](http://viniciusquaiato.com/blog/asp-net-mvc-submit-com-ou-sem-ajax/).A Partial View retornada e muito simples:
{% highlight csharp %}
@model ASPNETMVC_Jquery_Ajax.Controllers.Product<tr>    <td>        @Model.Description    </td>    <td>        @String.Format("{
:F}
", Model.Price)    </td></tr>
{% endhighlight %}
Apenas cria uma <tr> com os dados do produto, e é essa tr que damos append na nossa table de produtos na Index.

### Tratando os erros
É muito comum que só seja definida a callback para o sucesso da requisição, porém podem ocorrer erros e precisamos tratá-los de maneira adequada também.Para isso vamos definir um callback de erro na função ajax do Jquery:
{% highlight csharp %}
function config_add_products() {    $("#novo_produto").submit(function (e) {        $("#progress").show();
    e.preventDefault();
    $.ajax({            url: $(this).attr("action"),            data: $(this).serialize(),            success: function (retorno) {                $("#products").append(retorno);
    }
,            error: function (erro) {                alert(erro);
    }
        }
);
    }
);
    }

{% endhighlight %}
Desta forma daremos um alert informando o erro ocorrido. É preciso ficar atento ao tipo de erro senão o alert exibirá algo como "[object]" ou "[XmlHttpRequest]".

### Exibindo sinalização de progresso
Podemos melhorar um pouco as coisas exibindo uma sinalização de que a requisição está sendo processada.Vamos criar uma div na nossa view contendo uma imagem de progesso:
{% highlight csharp %}
<div id="progress" style="display: none;
    ">    ![](/images/progress.gif)</div>
{% endhighlight %}
Feito isso vamos alterar nosso código javascript para que fique assim:
{% highlight csharp %}
function config_add_products() {    $("#novo_produto").submit(function (e) {        $("#progress").show();
    e.preventDefault();
    $.ajax({            url: $(this).attr("action"),            data: $(this).serialize(),            success: function (retorno) {                $("#products").append(retorno);
    }
,            error: function (erro) {                alert(erro);
    }
,            complete: function () {                $("#progress").hide();
    }
        }
);
    }
);
    }

{% endhighlight %}
Reparem que na **_linha 3_** estamos exibindo nossa imagem de progresso. E na **_linha 16_** definimos mais uma função de callback para a função ajax do Jquery. Desta vez configuramos uma função para ser executada quando o request terminar, independente de erro ou sucesso, e o que fazemos é esconder a imagem de progresso. Desta forma sempre que a requisição ajax terminar a imagem é escondida.

### Definindo requisição como GET ou POST
É importante ainda poder configurar o request para ser feito via GET ou POST. A ação de incluir um novo produto não deveria ser feita via GET, no entando GET é o type default para as requisições feitas com a função ajax do Jquery.Para alterarmos isso podemos utilizar a configuração type, veja abaixo:
{% highlight csharp %}
type: "POST",
{% endhighlight %}
Adicionando essa configuração no nosso javascript finalizaremos com ele assim:
{% highlight csharp %}
$.ajax({    url: $(this).attr("action"),    data: $(this).serialize(),    type: "POST",    success: function (retorno) {        $("#products").append(retorno);
    }
,    error: function (erro) {        alert(erro);
    }
,    complete: function () {        $("#progress").hide();
    }
}
);
    
{% endhighlight %}
[caption id="attachment_2443" align="aligncenter" width="300" caption="Processando ajax com ASP NET MVC e Jquery"][![Processando ajax com ASP NET MVC e Jquery](http://viniciusquaiato.com/images_posts/Processando-ajax-com-ASP-NET-MVC-e-Jquery-300x197.png "Processando ajax com ASP NET MVC e Jquery")](http://viniciusquaiato.com/images_posts/Processando-ajax-com-ASP-NET-MVC-e-Jquery.png)[/caption][caption id="attachment_2442" align="aligncenter" width="300" caption="Ajax com ASP NET MVC e Jquery"][![Ajax com ASP NET MVC e Jquery](http://viniciusquaiato.com/images_posts/Ajax-com-ASP-NET-MVC-e-Jquery-300x197.png "Ajax com ASP NET MVC e Jquery")](http://viniciusquaiato.com/images_posts/Ajax-com-ASP-NET-MVC-e-Jquery.png)[/caption]

## Resumo
É muito simples trabalhar com Ajax usando Jquery no ASP.NET MVC. É preciso ter um pouco de conhecimento da API do Jquery, mas isto não é problema já que a própria documentação possui exemplos e descrições muito bem feitos.O processo segue basicamente um mesmo script: Faça a página funcionar sem Ajax. Adicione o comportamento Ajax no cliente e no server.Em um próximo post mostrarei alguns atalhos para trabalharmos com Ajax: [$.get](http://api.jquery.com/jQuery.get/) e [$.post](http://api.jquery.com/jQuery.post/).Baixe ou visualize o código fonte no github: [![](http://viniciusquaiato.com/images_posts/icon-github1.png "icon-github")https://github.com/vquaiato/ASP.NET-MVC-Jquery-Ajax](https://github.com/vquaiato/ASP.NET-MVC-Jquery-Ajax)Abraços,Vinicius Quaiato.</tr>
