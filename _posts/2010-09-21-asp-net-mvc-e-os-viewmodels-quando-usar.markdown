--- 
layout: post
title: ASP. NET MVC e os ViewModels - Quando usar?
wordpress_id: 1583
wordpress_url: http://viniciusquaiato.com/blog/?p=1583
categories: 
- title: Patterns
  slug: patterns
  autoslug: patterns
- title: ASP. NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
tags: 
- title: MVC
  slug: mvc
  autoslug: mvc
- title: ASP. NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
- title: ViewModel
  slug: viewmodel
  autoslug: viewmodel
- title: View
  slug: view
  autoslug: view
- title: Models
  slug: models
  autoslug: models
---
Durante o TechEd (ainda escreverei um post sobre o evento) comecei a desenvolver uma aplicação bem simples: MeuTechEd. A idéia desta aplicação era fornecer uma interface simples, onde fossem informados temas, palestras e palestrantes que você gostaria de ver no evento e não poderia (pois não foram convidados, etc).Algumas pessoas ficam temerosas sobre a utilização de ViewModels: acham desnecessários, duplicação de código, etc, etc. No entanto eu acredito que existem casos onde a utilização é realmente necessária, vejamos.

### O exemplo (real)
Para que tudo fosse simples, os campos seriam campos de texto e então os dados seriam separados por vírgula, algo mais ou menos assim:[caption id="attachment_1584" align="aligncenter" width="300" caption="View de criação"][![View de criação](http://viniciusquaiato.com/images_posts/tela-300x178.png "View de criação")](http://viniciusquaiato.com/images_posts/tela.png)[/caption]Percebam que a idéia é que de forma simples se crie um "TechEd" pessoal. A questão aí é que essa View trabalha com uma forma diferente do model. A forma como um TechEd é representado no sistema é mais ou menos assim:
{% highlight csharp %}

public class MeuTechEd{    

public virtual int Id { get;
    set;
    }
    
public virtual string[] Temas { get;
    set;
    }
    
public virtual string[] Palestrantes { get;
    set;
    }
    
public virtual string[] Palestras { get;
    set;
    }
}

{% endhighlight %}
(tenho alguns métodos aí dentro, mas omiti para ser breve).Notem o fato de que o model não trabalha com strings separadas por vírgula, e sim com arrays de strings. Isso quer dizer que a visualização do meu modelo é diferente do modelo em si.  

### Os ViewModels
Este é o perfeito caso onde cabe a utilização de um ViewModel. Um ViewModel é uma representação de um modelo para um View. Em alguns casos é apenas uma cópia do model decorado com atributos de validação, em outros casos é a junção de dois ou mais partes de models diferentes. Em outros casos é uma representação de computações de um model, etc.

### Não é problema de interface?
Então meu parceiro de código, o [@felipero](http://twitter.com/felipero) questionou: _Não é uma questão de melhorar a interface gráfica? _A resposta _poderia_ ser "sim!", no entanto aquela era a interface que eu queria. Eu não queria que o usuário ficasse adicionando temas, palestras e palestrantes em listas nem nada do tipo. Eu queria algo prático, separado por vírgulas mesmo, como fazemos quando enviamos emails para muitos destinatários por exemplo, ou informamos as tags de um post. Nesta situação não era um caso de "melhorar a interface": ela estava correta! Imaginem ainda que temos no nosso sistema uma entidade "Usuario" que possui os campos login e senha. Na criação de um usuário é necessário informar login, senha, confirmação de senha e captcha. Isso é um ViewModel! No final das contas esse ViewModel de criação de Usuario irá resultar (ou não) em um Usuario, mas não consigo utilizar minha entidade/modelo Usuario para essa View de criação, são coisas bastante diferentes.

### Em resumo...
Nas situações onde você tem uma representação de um modelo/entidade do seu sistema que seja diferente na View este é um forte candidato a ganhar um ViewModel. Não tente fazer malabarismos, forçar uma interface gráfica diferente e nem mudar suas entidades em virtude disso. Trabalhe com este padrão e seja feliz.

Abraços,
Vinicius Quaiato.
