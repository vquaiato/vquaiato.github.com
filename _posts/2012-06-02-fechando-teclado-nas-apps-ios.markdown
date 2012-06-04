---
layout: post
title: "Fechando o teclado nas apps iOS"
description: "Aqui explico três formas de fechar o teclado quando estamos editando um UITextField."
keywords:
- touchesBegan
- UITapGestureRecognizer
- resignFirstResponder
- UITextFieldDelegateProtocol
- Keyboard
- UITextField
tags:
- title: iOS
  slug: iOS
  autoslug: iOS
---

Quando estamos digitando algo em uma app iOS e queremos que o teclado "suma" é realmente chato se não conseguirmos fazer isso na app. Por este motivo explico aqui algumas formas de realizar isso e não frustrar a experiência do usuário.

Existem algumas formas(que eu conheço) para escondermos o teclado quando estamos editando um UITextField.

Voud descrever então cada uma das 3 maneiras que eu conheço (e que pelo que já pesquisei têm sido as mais utilizadas e indicadas).

##UITextFieldDelegateProtocol
Este [protocolo][protocolo] define quais mensagens são enviadas para um UITextField delegate no processo de edição de algum texto.

Utilizando este protocolo nós podemos esconder o teclado pressionando o botão "concluído" do teclado.

Vamos pegar nosso [projeto dos gastos de rua][projeto] e vamos mudá-lo.

Primeiro vamos alterar nossa arquivo ViewController.h adicionando o protocolo:
{% highlight objc linenos %}
@interface ViewController : UIViewController<UITextFieldDelegate>
{
    Gastos* gastos;
}
{% endhighlight %}

Altere apenas este ponto adicionando o *UITextFieldDelegate*

Feito isso vamos implementar o seguinte método no ViewController.m:

{% highlight objc linenos %}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}
{% endhighlight %}

Este método diz que o UITextField deve responder ao click(tap) do botão *concluído*. E o que fazemos nesse código é enviar a mensagem [*resignFirstResponder*][resign] para o nosso UITextField.

Esta mensagem diz para o textField que ele não é mais o firstResponder daquela janela, ou seja, ele não é mais quem está respondendo aos eventos (taps, touches, etc) que ocorrerem. E assim é que o teclado irá "sumir", pois o UITextField já não é mais esse responder.

Como último passo vamos informar que o delegate do nosso UITextField é o nosso view controller. Você pode fazer isso direto na interface:

<img src="/images_posts/vinculando_delegate_uitextfield_com_file_owner.png" class="post_img" />

Feito isso quando rodarmos nossa aplicação e pressionarmos o botão "concluído" o teclado será fechado.

##UITapGestureRecognizer
[UITapGestureRecognizer][tap-recognizer] classe nada mais faz do que fichar "esperando" por eventos do tipo "tap" (single ou multiple taps). Com isso podemos pegar os taps que ocorrerem na nossa view e fechar o teclado aberto, vejamos como fazer isso.

Vamos então alterar nosso ViewController.m da seguinte maneira:
{% highlight objc linenos %}
- (void)viewDidLoad{
    [super viewDidLoad];

    gastos = [[Gastos alloc]init];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(esconderTeclado)];

    [self.view addGestureRecognizer:tap];
}

-(void)esconderTeclado {
    [valorDoGasto resignFirstResponder];
}
{% endhighlight %}

Basicamente o que estamos fazendo é criando um tap recognizer informando para ele que quem vai receber as mensagens quando os taps ocorrerem, nesse caso o próprio viewcontroller como podem ver na ***linha 7***.
Na ***linha 8*** o que fazemos é informar um método que será chamado quando o recognizer reconhecer um tap. Neste caso o método é o *esconderTeclado* que criamos nas ***linhas 13 a 15***.
Na ***linha 10*** novamente enviamos a mensagem de *resignFirstResponder* ao nosso UITextField.

##TouchesBegan
A terceira forma - e ao que parece uma das mais utilizadas - é fazer um *override* do método [*touchesBegan*][began].

Este método informa quando um ou mais toques sào feitos em uma window ou view.

Neste caso o que faremos é simplesmente enviar a mensagem *resignFirstResponder* quando um toque na view for feito:

{% highlight objc linenos %}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [valorDoGasto resignFirstResponder];

    [super touchesBegan:touches withEvent:event];
}
{% endhighlight %}

Bastante simples. A única coisa diferente aqui é repassar o evento para a classe base na ***linha 5*** após fazermos o que precisávamos fazer na ***linha 3***.

##Resumindo
Estas são as três maneiras que eu conheço para fazermos o "teclado sumir" enquanto estivermos trabalhando com UITextFields.

O código do projeto de gastos de rua já está atualizado no [github][github] com essas melhorias.

Abraços,

Vinicius Quaiato.

[protocolo]:http://developer.apple.com/library/ios/#documentation/uikit/reference/UITextFieldDelegate_Protocol/UITextFieldDelegate/UITextFieldDelegate.html
[projeto]:http://viniciusquaiato.com/blog/criando-classes-em-objective-c/
[resign]:http://developer.apple.com/library/ios/DOCUMENTATION/UIKit/Reference/UIResponder_Class/Reference/Reference.html#//apple_ref/doc/uid/TP40006783-CH4-SW7
[tap-recognizer]:http://developer.apple.com/library/ios/#DOCUMENTATION/UIKit/Reference/UIGestureRecognizer_Class/Reference/Reference.html#//apple_ref/occ/cl/UIGestureRecognizer
[began]:http://developer.apple.com/library/ios/DOCUMENTATION/UIKit/Reference/UIResponder_Class/Reference/Reference.html#//apple_ref/doc/uid/TP40006783-CH4-SW1
[github]:https://github.com/vquaiato/ios-blog-samples
