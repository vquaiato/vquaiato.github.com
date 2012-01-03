--- 
layout: post
title: ASP.NET MVC + JQuery
wordpress_id: 269
wordpress_url: http://viniciusquaiato.com/blog/?p=269
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
- title: Visual Studio 2010
  slug: visual-studio-2010
  autoslug: visual-studio-2010
- title: ASP.NET
  slug: asp-net-dotnet
  autoslug: asp.net
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: MVC
  slug: mvc
  autoslug: mvc
- title: ASP.NET
  slug: asp-net
  autoslug: asp.net
- title: JQuery
  slug: jquery
  autoslug: jquery
- title: WEB
  slug: web
  autoslug: web
- title: Ajax
  slug: ajax
  autoslug: ajax
---
Neste artigo mostrarei um pouco de como usar o [ASP.NET MVC](http://www.asp.net/mvc/) com o [Jquery](http://www.jquery.com) para criar páginas mais dinâmicas e funcionais.Este não é um artigo introdutório ao ASP.NET MVC, posso escrever sobre isso depois, e você pode encontrar tudo sobre o MVC do asp.net aqui: [http://www.asp.net/mvc/](http://www.asp.net/mvc/).Neste exemplo estou utilizando o VS2010 beta 2, Asp.Net MVC 2 e Jquery 1.3.2. Também utilizarei o plugin DataTables para o Jquery, que você deve baixar aqui: [http://datatables.net/](http://datatables.net/)Primeiramente vamos criar um website do tipo Asp.Net MVC no VS2010. Feito isso eu vou excluir todas as Views e Controllers que são criados por padrão, mantendo apenas os configs e a pasta Scripts.Agora vamos criar um Controller para retornar uma lista de objetos, para que possamos montar um grid e executar algumas ações. Vou criar um Controller chamado HomeController, e adicionar o código abaixo:
{% highlight csharp %}

public ActionResult Index(){
var items = new List<expandoobject>();
    for (int i = 0;
    i < 10;
    i++)    {        dynamic item = new ExpandoObject();
    item.Id = i + 1;
    item.Nome = string.Format("Item {
}
", i + 1);
    item.Valor = 10 + i;
    item.Descricao = string.Format("Descricao do Item {
}
", i + 1);
    items.Add(item);
    }
    ViewData["items"] = items;
    return View();
    }
</expandoobject>
{% endhighlight %}
O código é bastante simples, cria apenas uma lista de ExpandoObjects e manda esta lista para a View([leia mais sobre ExpandoObjects aqui](http://viniciusquaiato.com/blog/expandoobject-dinamismo-dotnet-4/)).Agora crie uma pasta chamada Home dentro da pasta Views e então crie uma View chamada Index dentro da pasta Home, a solution deve ficar assim:[caption id="attachment_413" align="aligncenter" width="252" caption="Solution com View e Controller"]![Solution com View e Controller](http://viniciusquaiato.com/blog/wp-content/uploads/2009/12/Solution-com-View-e-Controller.jpg "Solution com View e Controller")[/caption]Vamos para o código .aspx da nossa View que deve ficar assim:
{% highlight csharp %}
            <thead>                <tr style="background-color:#aabbcc;
    color:#fff;
    ">                    <th style="width: 50px;
    ">                        Id                    </th>                    <th style="width: 100px;
    ">                        Nome                    </th>                    <th style="width: 70px;
    ">                        Preço                    </th>                    <th style="width: 200px;
    ">                        Descrição                    </th>                </tr>            </thead>            <tbody>                <%
var items = ViewData["items"] as List<system.dynamic.expandoobject>;
    foreach (dynamic item in items)                    {                %>                </system.dynamic.expandoobject><tr id="<%=item.Id %>">                    <td>                        <%=item.Id %>                    </td>                    <td>                        <%=item.Nome %>                    </td>                    <td>                        R$                        <%=item.Valor.ToString("N2") %>                    </td>                    <td>                        <%=item.Descricao %>                    </td>                </tr>                <%}
 %>            </tbody>        </table>    </div></body></html>
{% endhighlight %}
Tudo que este código faz é obter nossa lista de items e então desenhá-los na tela em forma de uma tabela.Agora vamos usar o Jquery para ir até o servidor, excluir um item da lista no servidor, e então removê-lo da lista no client utilizando Ajax.Para isso incluiremos uma referência para o Jquery em nossa View. O Jquery já vem junto com os projetos MVC do asp.net em sua versão 2, basta arrastar o arquivo da pasta Scripts para dentro da View que a referência é adicionada:
{% highlight csharp %}
</script></head>
{% endhighlight %}
Agora vamos criar uma function javascript que fará a chamada via Ajax para o Controller:
{% highlight csharp %}
function Remover(controller, action, param) {    $.post(controller + "/" + action + "/" + param,    function (data) {        alert(data);
    $("#" + param).fadeOut("slow");
    }
);
    return false;
    }

{% endhighlight %}
Esta function recebe 2 parâmetros, o primeiro é o nome da Action que executaremos no Controller, e o segundo é o parâmetro que passaremos, nesse caso o id do nosso item.A linha 2 utiliza uma função do Jquery para fazer chamas Ajax usando post. O primeiro parâmetro é a url a ser chamada, no nosso exemplo será algo como "remover/5". O segundo parâmetro é uma function de callback, que será executada depois que a resposta vier do servidor, e o que estamos fazendo é exibindo a resposta, e então removendo da nossa tabela a linha excluída, utilizando uma animação do Jquery chamada fadeOut.No nosso Controller adicionaremos um método para simular a exclusão do item, como pode ser visto abaixo:
{% highlight csharp %}
[AcceptVerbs(HttpVerbs.Post)]
public string Remover(int id){    return string.Format("removeu item: {
}
", id);
    }

{% endhighlight %}
Tudo que esta Action faz é retornar uma string dizendo que o item foi removido.Agora precisamos fazer com que exista um link na nossa tabela para executar esta ação, e para isso incluiremos mais uma coluna, a coluna Ação, e este código será necessário para renderizar os dados:
{% highlight csharp %}
<td>    [        Remover](home/remover/<%=item.Id %>)</td>
{% endhighlight %}
Pronto! Agora já temos uma tabela capaz de excluir itens usando Ajax e ainda ter a linha removida da tabela utilizando um efeito bem bacana.E para deixar as coisas um pouco mais "profissionais" vamos deixar esta tabela com cara e comportamente de grid, usando o plugin DataTables.Para isso inclua o arquivo _jquery.dataTables.js_ que você baixou dentro da pasta Scripts, e então arraste o mesmo até a View, para incluir a referência.Agora coloque o seguinte código javascript dentro do <head></head> da sua view:
{% highlight csharp %}
$(document).ready(function () {    $("#dataTable").dataTable();
    }
);
    
{% endhighlight %}
Este código irá aplicar o plugin na nossa tabela, e o resultado será como mostrado abaixo:[caption id="attachment_421" align="aligncenter" width="554" caption="table usando plugin DataTables"]![table usando plugin DataTables](http://viniciusquaiato.com/blog/wp-content/uploads/2009/12/table-usando-plugin-DataTables.jpg "table usando plugin DataTables")[/caption]Agora podemos filtrar, ordenar e paginar nossos dados, sem nenhum esforço adicional, veja um exemplo de filtro abaixo:[caption id="attachment_422" align="aligncenter" width="537" caption="plugin DataTable filtrando dados"]![plugin DataTable filtrando dados](http://viniciusquaiato.com/blog/wp-content/uploads/2009/12/plugin-DataTable-filtrando-dados.jpg "plugin DataTable filtrando dados")[/caption]Bom galera, é isso!O código fonte desta solução está disponível [aqui](http://viniciusquaiato.com/files/codesamples/MVC/mvcjquerysite.rar).Qualquer dúvida, email ou comentários.

Abraços,
Vinicius Quaiato.
