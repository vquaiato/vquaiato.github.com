---
layout: post
title: "ASP.NET MVC upload de imagens + JCrop + Resize + progressbar + tudo assíncrono 2"
description: "Neste post veremos como habilitar o JCrop e realizar o recorte da imagem de forma assíncrona no servidor."
keywords:
- Jquery
- ASP.NET MVC
- JCrop
- Upload
- Assíncrono
tags:
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
- title: Jquery
  slug: jquery
  autoslug: jquery
---
#Colocando o JCrop para funcionar
Dando continuidado ao post de [Upload + Progressbar + JCrop assíncrono][post1] agora nós
vamos fazer o download do [JCrop][jcrop] e referenciá-lo em nossa view.
Descompacte o zip e referencie estes arquivos um javascript:
{% highlight html %}
<script src='@Url.Content("~/Scripts/jquery.Jcrop.min.js")' type="text/javascript"></script>
{% endhighlight %}

E um stylesheet:
{% highlight html %}
<link rel="stylesheet" href='@Url.Content("~/Content/jcrop/jquery.Jcrop.min.css")' type="text/css" />
{% endhighlight %}

Feito isso vamos adicionar um novo formulário em nossa página. Eu optei por um novo formulário para deixar as coisas bem separadas, vejam abaixo:

{% highlight html %}
@using (Html.BeginForm("Crop", "Upload", null, FormMethod.Post, new { enctype = "multipart/form-data", name = "crop" })) {
    <input type="hidden" name="url" />
    <input type="hidden" name="x1" id="x1" />
    <input type="hidden" name="x2" id="x2" />
    <input type="hidden" name="y1" id="y1" />
    <input type="hidden" name="y2" id="y2" />
    <input type="submit" value="Recortar" class="hidden" id="recortar" />
}
<img src="" class="hidden" id="imagem_final"></img>
{% endhighlight %}

Reparem que tudo que temos aí são campos hidden. O primeiro deles irá guardar a URL da imagem que queremos recortar e com isso eu não farei o upload de uma nova imagem para o servidor. Os outros campos são as coordenadas para o recorte.

Todas estas informações serão alimentadas pelo javascript e pelo próprio JCrop. Vejam como configuraremos o JCrop:

{% highlight html linenos %}
function showCoords(c) {
    $("#x1").val(c.x);
    $("#x2").val(c.x2);
    $("#y1").val(c.y);
    $("#y2").val(c.y2);

    $("#recortar").removeClass("hidden");
}
function ativarJCrop() {
    $('#imagem_crop').Jcrop({
        bgColor: 'black',
        bgOpacity: .4,
        aspectRatio: 1,
        onSelect: showCoords
    });
}
{% endhighlight %}

Estas duas funções são tudo o que precisamos. E eu vou chamar a função _ativarJCrop_ dentro do _success_ do upload da imagem ([confira aqui no artigo anterior][post1]).

#Realizando o crop no servidor
Para realizarmos o crop no servidor teremos algo parecido com isso:

{% highlight csharp linenos %}
[HttpPost]
public ActionResult Crop() {
    var imagem_url = Request.Form["url"];
    var x1 = int.Parse(Request.Form["x1"]);
    var x2 = int.Parse(Request.Form["x2"]);
    var y1 = int.Parse(Request.Form["y1"]);
    var y2 = int.Parse(Request.Form["y2"]);
    var nomeFinal = "../uploads/imagem_crop" + Path.GetExtension(imagem_url);

    using (var response = new StreamReader(Server.MapPath(imagem_url))) {
        Bitmap imagem = new Bitmap(response.BaseStream);

        int largura = x2 - x1;
        int altura = y2 - y1;

        Bitmap target = new Bitmap(largura, altura);
        Rectangle cropRect = new Rectangle(x1, y1, largura, altura);

        using (Graphics g = Graphics.FromImage(target)) {
            g.DrawImage(imagem, new Rectangle(0, 0, largura, altura), cropRect, GraphicsUnit.Pixel);
            using (var fileStream = new FileStream(Server.MapPath(nomeFinal), FileMode.OpenOrCreate)) {
                target.Save(fileStream, imagem.RawFormat);
                fileStream.Flush();
            }
        }
    }

    return Json(new { imagem_recortada = nomeFinal });
}
{% endhighlight %}
Basicamente o que esse código faz é recortar uma imagem. É um _código padrão_ então vou vou explicá-lo. Reparem apenas que ao final retornamos um json. É com isto que exibiremos a imagem recortada após o trabalho do server.

Para isso vamos adicionar o _ajaxForm_ ao nosso formulário de crop:
{% highlight html linenos %}
	$('form[name=crop]').ajaxForm({
		dataType: 'json',
		success: function (data) {
		    jcrop.destroy();
		    $(".progress").addClass("hidden");
		    $("#imagem_crop").addClass("hidden");
		    $("#imagem_crop").removeAttr("style");
		    $("#recortar").addClass("hidden");

		    $("#imagem_final").attr("src", data.imagem_recortada);
		    $("#imagem_final").removeClass("hidden");
		}
	});
{% endhighlight %}

Pronto! Agora tudo está feito e funcionando:

<img src="/images_posts/upload-progressbar-assincrono-3.png" class="post_img"/>
<img src="/images_posts/upload-progressbar-assincrono-4.png" class="post_img"/>

#Resumindo
Com isso terminamos nosso upload e crop assíncrono com Jquery, JCrop e ASP.NET MVC.
Até que é uma tarefa simples depois de ter entendido tudo que é necessário. Eu fiz algumas firulas para esconder e exibir uma série de componentes na tela e tudo o mais, mas pode ser que vocês não precisem disso.

O código completo está no github [https://github.com/vquaiato/upload-crop-async-sample][github]

[jcrop]:http://deepliquid.com/content/Jcrop_Download.html
[post1]:http://viniciusquaiato.com/blog/upload-imagens-jcrop-resize-progressbar-assincrono/
[github]:https://github.com/vquaiato/upload-crop-async-sample
