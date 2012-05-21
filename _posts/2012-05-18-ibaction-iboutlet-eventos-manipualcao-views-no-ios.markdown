---
layout: post
title: 'IBAction e IBOutlets: eventos e manipulação de views no iOS'
description: 'Aprendendo a usar IBAction e IBOutlets desenvolvendo aplicações iOS. Entenda como conectar controles na interface gráfica com o Controller e como manipular a interface gráfica nos Controllers'
keywords:
- IBAction
- IBOutlet
- UITextField
- UILabel
tags:
- title: iOS
  slug: iOS
  autoslug: iOS
---

Na nossa [aplicação Hello World][post-hello-world], dentre as muitas coisas novas e diferentes que vimos uma das mais estranhas foi a vinculação de um método com o toque do botão.
*[(confira todos os posts sobre iOS)][tag-ios]*

##IBAction e Target-Action
Target-Action é o nome do "padrão" ou mecanismo que o iOS utiliza para lidar com eventos.

Na verdade os eventos são disparados, ou gerados, mas alguém que esteja interessado em receber mensagens destes eventos precisa ser avisado disso. Neste caso quem vai receber a mensagem é o que é chamado de **target**, no nosso projeto [Hello World][post-hello-world] por exemplo a classe ViewController era o target.

**Action** é a mensagem que o controle enviará para o target. Então basicamente um controle dispara uma mensagem, notificando que algo aconteceu.

No nosso [Hello World][post-hello-world] declaramos nosso método action assim:

{% highlight objc linenos %}
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

-(IBAction)showMessage:(id)sender;
@end
{% endhighlight %}

Repare que usamos o tipo [IBAction ao invés de void][ibaction-void]. Isso acontece pois, apesar de uma action não retornar nada o IBAction diz para o Interface Builder que isso é uma action e desta forma conseguimos linkar a mesma com nossos controles.

##IBOutlet
Um outlet nada mais é do que uma conexão entre dois objetos. É uma variável em um objeto que guarda uma referência para outro objeto, simples assim.

Novamente o [IBOutlet serve mais para o INterface Builder][iboutlet-builder], para identificarmos esse tipo de variável de instância e deixarmos o Interface Builder a par disso.

Então usamos um IBOutlet para vincular um controle da nossa view de modo que alguém possa "manipular" este controle.

##Evoluindo nosso Hello World
Como todo bom Hello World precisamos perguntar o nome do nosso "visitante" então vamos alterar a interface da nossa app adicionando um [UITextField][uitext-ref] e um [UILabel][uilabel-ref]:

<img src="/images_posts/mudando-interface-hello-world-ios.png" class="post_img"/>

Feito isso vamos criar dois IBOutlets para manipularmos o label e o textfield de dentro do nosso ViewController. Mude o arquivo ViewController.h assim:

{% highlight objc linenos %}
#import <UIKit/UIKit.h>
@interface ViewController : UIViewController

-(IBAction)showMessage:(id)sender;

@property (nonatomic, retain) IBOutlet UILabel *showName;
@property (nonatomic, retain) IBOutlet UITextField *name;

@end
{% endhighlight %}

*(depois falaremos mais sobre o nonatomic e o retain utilizados ali, por enquanto apenas assuma que isso é o default a ser feito)*

Note que criamos os outlets com o tipo dos controles da nossa view. É desta forma que teremos uma referência para os objetos da view e poderemos manipulá-los.

Vamos mudar nosso ViewController.m, criando as duas propriedades (lembrando que o .h contém apenas a interface).

Devemos alterar o ViewController da seguinte forma:

{% highlight objc linenos %}
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize name;
@synthesize showName;
{% endhighlight %}

Repare que até a ***linha 7*** não fizemos nada. O que fizemos foi adicionar as ***linhas 9 e 10***. Isso é basicamente um gerador de getter e setter para as variáveis de instância que declaramos no .h

Vamos agora mudar o método showMessage para que ele manipule o input e o label:
{% highlight objc linenos %}
-(IBAction)showMessage:(id)sender{
    showName.text = [[NSString alloc] initWithFormat:@"Hello %@", name.text];
}
{% endhighlight %}

Bem simples né? O que estamos fazendo agora é dizendo que a propriedade *text* do nosso outlet showName é uma string formada por Hello + propriedade *text* do nosso outlet name.

##Conectando os outlets
Está quase tudo pronto, agora só precisamos conectar os outlets aos nossos controles.

Uma outra forma de fazer essa conexão é também pressionando a tecla ***ctrl*** mas ao invés de arrastar para o File's Owner, podemos arrastar direto para a declaração do outlet:

<img src="/images_posts/vinculando-outlet-com-codigo.png" class="post_img"/>

*(neste caso repare que cliquei no botão no canto superior direito da imagem, na seção editor, o botão do meio - Show the Assistant Editor)*

Ou se preferir faça como fizemos da primeira vez ([veja aqui][post-hello-world]).

Com isso quando executarmos nossa app, preencher o texto e clicarmos no botão teremos isso:

<img src="/images_posts/digitando-nome-app-ios.png" class="post_img"/>

<img src="/images_posts/exibindo-nome-app-ios.png" class="post_img"/>

##Resumo
Estamos avançando um pouco mais no entendimento de alguns conceitos do iOS. Agora já sabemos como manipular controles e exibir dados nas nossas views.

Se você quiser saber mais sobre os padrões de comunicaçào, delegates, outlets, actions, etc veja aqui: [Cocoa Fundamentals][refs]

Para dar uma lida nos design patterns usados pelo cocoa veja aqui: [Cocoa Design Patterns][patterns]

Bom acho que por hoje é isso. O código dessas alterações já está no github: [https://github.com/vquaiato/ios-blog-samples/tree/master/HelloWorldEvolution][hello-world-evolution]

Abraços, e até a próxima.

Vinicius Quaiato.

[tag-ios]:http://viniciusquaiato.com/tags/ios/
[post-hello-world]:http://viniciusquaiato.com/blog/primeiro-projeto-ios-single-view-application/
[ibaction-void]:http://developer.apple.com/library/ios/#documentation/uikit/reference/UIKitConstantsReference/Reference/reference.html
[iboutlet-builder]:http://developer.apple.com/library/ios/#documentation/uikit/reference/UIKitConstantsReference/Reference/reference.html
[uitext-ref]:https://developer.apple.com/library/ios/#DOCUMENTATION/UIKit/Reference/UITextField_Class/Reference/UITextField.html
[uilabel-ref]:https://developer.apple.com/library/ios/#DOCUMENTATION/UIKit/Reference/UITextField_Class/Reference/UITextField.html
[refs]:https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/CocoaFundamentals/CommunicatingWithObjects/CommunicateWithObjects.html#//apple_ref/doc/uid/TP40002974-CH7-SW14
[patterns]:https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/CocoaFundamentals/CocoaDesignPatterns/CocoaDesignPatterns.html#//apple_ref/doc/uid/TP40002974-CH6-SW6
[hello-world-evolution]:https://github.com/vquaiato/ios-blog-samples/tree/master/HelloWorldEvolution
