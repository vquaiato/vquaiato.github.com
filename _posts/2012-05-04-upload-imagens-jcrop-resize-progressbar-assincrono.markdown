---
layout: post
title: "ASP.NET MVC upload de imagens + JCrop + Resize + progressbar + tudo assíncrono"
tags:
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
- title: Jquery
  slug: jquery
  autoslug: jquery
---
Essa é uma das features que qualquer sistema web público precisa:
> Usuário precisa fazer upload de uma foto para o seu perfil

Até aí tudo bem, tudo simples. O problema é que o layout das aplicações exigem uma foto de perfil quadrada. Até aí tudo bem também. Mas o que acontece quando o usuário faz upload de uma imagem que não é quadrada? Vamos simplesmente redimensionar? Eu não acho essa uma boa solução: as imagens retangulares ficam feias demais se simplesmente redimensionadas para um quadrado. Não dá para simplesmente fazer um resize proporcional, afinal é um retângulo.

Para "complicar" um pouco mais as coisas eu quero que tudo seja feito de forma assíncrona e que tenhamos uma barra de progresso.

#Os plugins
Para fazer esse trabalho sujo, client side, vamos usar alguns plugins para facilitar nossa vida.

Juntar estes plugins para essa solução é algo bastante simples e com pouco código podemos realizar o trabalho. *(por favor atentem que estou blogando isso exatamente em seguida de ter terminado de implementar isso, então nenhum código recebeu refatoração, é preciso melhorá-lo, claro)*

##Jquery.Form
Para *simplificar* tudo quero fazer, quero que todo esse processo seja realizado de forma assíncrona. Ou seja o usuário faz o upload de uma foto inicial, consegue realizar o crop e então submete novamente para que o crop seja salvo.

Pesquisando encontrei o [Jquery.Form][jquery-form].

Este plugin é bastante simples e nos permite trabalhar com formulários de maneira assíncrona. *&lt;sarcasm&gt;É quase um UpdatePanel&lt;/sarcasm&gt;*

É também este o plugin responsável pela barra de progresso :D

[Vamos baixar o Jquery.Form plugin aqua no site do plugin][jquery-form-download]

##JCrop
Acho que é o [JCrop][jcrop] é o plugin [JQuery][jquery] mais famoso para crop de imagens. É bastante simples de utilizar. Esse eu conheço já de longa data, então eu nem pesquisei alternativas.

[Vamos baixar o JCrop aqui][jcrop-download]

#Passo 1 - Realizar o upload da imagem
O primeiro passo então para nosso upload com crop e resize assíncrono lindo de morrer é conseguir uma imagem quadrada que nos possibilite um resize sem deformações medonhas.

Para fazer isso precisamos realizar o upload de uma imagem e permitir que o usuário selecione uma parte quadrada desta imagem. Após o upload precisamos exibir a imagem para que o mesmo possa selecionar uma área dentro dessa e então realizar o *crop*(recorte).

##O HTML inicial
Vamos criar um form e aplicar o jquery-form nele:
{% highlight html linenos %}
<form action='@Url.Action("Upload")' method="post" enctype="multipart/form-data" name="imagem_original">
    <input type="file" name="imagem" />
    <input type="submit" value="upload to server" class="hidden" id="upload" />
</form>
<div class="progress">
    <div class="bar"></div>
    <div class="percent">0%</div>
</div>
<img src="" class="hidden" id="imagem_crop" />
{% endhighlight %}

Esse form por si só não faz nada assíncrono, então vamos adicionar o seguinte em nossa página. Reparem apenas que na ***linha 5*** eu adiciono um div que funcionará como progress bar.
Na ***linha 9*** eu coloquei uma imagem escondida. Será nesta tag %lt;img que exibiremos a imagem após o upload, para realizar o crop.

{% highlight html linenos %}
<script src='@Url.Content("~/Scripts/jquery-1.7.2.min.js")' type="text/javascript"></script>
<script src='@Url.Content("~/Scripts/jquery.form.js")' type="text/javascript"></script>
<script>
(function () {
    var bar = $('.bar');
    var percent = $('.percent');
    var status = $('#status');

    $('input[name=imagem]').live('change', function () {
        $("#upload").click();
    });

    $('form[name=imagem_original]').ajaxForm({
        dataType: 'json',
        beforeSend: function () {
            status.empty();
            var percentVal = '0%';
            bar.width(percentVal);
            percent.html(percentVal);
        },
        uploadProgress: function (event, position, total, percentComplete) {
            var percentVal = percentComplete + '%';
            bar.width(percentVal);
            percent.html(percentVal);
        },
        success: function (data) {
            $('input[name=url]').val(data.url);
            $("#imagem_crop").attr("src", data.url);
            $("#imagem_crop").removeClass("hidden");
        }
    });
})();
</script>
{% endhighlight %}

Esse código não possui nenhum mistério.
Nas ***linhas 5, 6 e 7*** apenas obtenho alguns elementos e coloco em variáveis para reutilizarmos depois.

Nas ***linhas 9, 10 e 11*** disparamos o submit do form automaticamente sempre que um arquivo novo é selecionado, por isso mantive o botão de upload escondido no formulário, mas poderia nem ter o botão lá.

Na sequência, nas ***linhas 13 e 14*** o jquery-form configura nosso formulário como um formulário ajax, utilizando o retorno do servidor como json.

A função ***beforeSend*** na ***linha 15*** é executada antes mesmo que o envio dos dados ocorra (dãr!) e o que ela faz é apenas zerar uma barra de progesso (100% feita em html).

A função ***uploadProgress*** na ***linha 21*** é chamada de tempos em tempos com o status de progresso do upload e com isso conseguimos atualizar a barra de progresso.

Já a função ***success*** na ***linha 26*** é chamada com o retorno do servidor, neste caso um objeto json contendo a url de onde a imagem foi salva.
Nesta função eu já preparo algumas coisas para iniciarmos o crop: na ***linha 27*** eu coloco a url da imagem em um input hidden, pois não faremos o upload da imagem novamente, vamos carregá-la no servidor direto da url. Também coloco a url da imagem no atributo src de uma tag &lt;img e deixo esta imagem visível na tela pois será nela que faremos o crop.

O código server no ASP.NET MVC para isso é algo como:
{% highlight csharp linenos %}
[HttpPost]
public ActionResult Upload() {
    var nomeOriginal = Request.Files[0].FileName;
    var nomeFinal = "../uploads/imagem" + Path.GetExtension(nomeOriginal);
    var pathFinal = Server.MapPath(nomeFinal);

    Request.Files[0].SaveAs(pathFinal);
    return Json(new { url = nomeFinal });
}
{% endhighlight %}

Nada anormal (removi uma série de tratamentos, validações, etc, para manter o código breve e acho que ele ainda está funcionando :P).

Feito tudo isso devemos ter uma página capaz de realizar um upload assíncrono, com barra de progresso e exibindo o resultado do upload em uma tag &lt;img mais ou menos como a imagem abaixo:

<img src="/images_posts/upload-progressbar-assincrono-1.png" class="post_img" alt="ubber elegant"/>
<img src="/images_posts/upload-progressbar-assincrono-2.png" class="post_img" alt="ubber elegant"/>

#Resumindo
No próximo post mostrarei como colocarmos o JCrop para funcionar e realizar o upload das informações para recortar a imagem no server side.

Abraços,

Vinicius Quaiato.

[jquery]:http://jquery.com
[jcrop]:http://deepliquid.com/content/Jcrop.html
[jcrop-download]:http://deepliquid.com/content/Jcrop_Download.html
[jquery-form]:http://jquery.malsup.com/form/
[jquery-form-download]:http://jquery.malsup.com/form/#download
