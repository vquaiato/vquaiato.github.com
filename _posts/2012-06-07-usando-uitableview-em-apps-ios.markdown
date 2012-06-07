---
layout: post
title: "Usando UITableView em apps iOS"
description: "Vamos ver como começar a trabalhar com UITableViews em aplicações iOS. Entender o que é necessário ser feito, implementado e como trabalhar com listagens de dados"
keywords:
- UITableView
- ViewController
- presentViewController
- UITableViewDelegate
- UITableViewDataSource
tags:
- title: iOS
  slug: iOS
  autoslug: iOS
---
Muitas aplicações fazem uso de listagens de dados e no iOS vamos usar uma(ou mais) instância de [UITableView][tableview] para realizar este trabalho.

Basicamente quando falamos de iOS e table view estamos falando de um controle com uma única coluna e uma lista de dados (o motivo de haver apenas uma coluna é o tamanho das telas).

Para ilustrarmos um primeiro uso de UITableView vamos incrementar o projeto de *Gastos de rua* para exibir uma listagem dos gastos realizados. Faremos algumas alterações para isso:

1. Criar um novo View Controller e um arquivo nib para nossa listagem
2. Adicionar um UITableView a este nib para exibir os valores
3. Exibir os valores na UITableView

##Criando um novo ViewController
Vamos adicionar um novo ViewController em nossa aplicação, chamado de *ListaDeValoresViewController*, assim como vemos abaixo:

<img src="/images_posts/criando-classe.png" class="post_img" />

<img src="/images_posts/escolhendo-classe-base-como-uiviewcontroller.png" class="post_img" />

Feito isso vamos adicionar um botão à nossa tela para que possamos exibir nossa nova tela:

<img src="/images_posts/adicionando-botao.png" class="post_img" />

Vamos então adicionar um import em nosso ViewController.m para que possamos chamar a nova tela:
{% highlight objc %}
#import "ListaDeValoresViewController.h"
{% endhighlight %}

Agora vamos criar uma [IBAction][post-action] vinculada ao nosso botão que fará a chamada para a nova tela.

ViewController.h:
{% highlight objc %}
- (IBAction)verListaDeValores:(id)sender;
{% endhighlight %}

ViewController.m:
{% highlight objc %}
- (IBAction)verListaDeValores:(id)sender {
    ListaDeValoresViewController* lista = [[ListaDeValoresViewController alloc]
     										initWithNibName:@"ListaDeValoresViewController"
     										bundle:nil];

    [self presentViewController:lista animated:YES];
}
{% endhighlight %}

Feito isso se rodarmos nossa app e clicarmos no botão veremos uma nova tela branca.
A mágica aqui fica por conta da chamada [*presentViewController*][presentViewController] que como podemos imaginar apresenta um view controller e no nosso caso o view controller que carrega a lista de valores. Nada de outro mundo certo?

##Utilizando UITableView
Na nossa view ListaDeValores.xib vamos adicionat um [UITableView][tableview], conforme abaixo:

<img src="/images_posts/adicionando-uitableview.png" class="post_img" />

Basta arrastar e redimensionar o controle.

O segredo aqui é que um UITableView precisa de alguém que implemente dois protocolos: [*UITableViewDelegate*][tableViewDelegate] e [*UITableViewDataSource*][tableViewDataSource]
Basicamente estes caras são responsáveis por gerenciar uma série de aspectos de um UITableView e seus dados. Mas nós começaremos com o básico, suficiente para exibir nossos dados na listagem.

Vamos então adicionar os protocolos em nosso ListaDeValoresViewController.h e além disso vamos criar um construtor que receba nosso objeto gastos, teremos então esse código:
{% highlight objc %}
#import <UIKit/UIKit.h>
#import "Gastos.h"

@interface ListaDeValoresViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    Gastos* gastos;
    Locale* locale;
    NSNumberFormatter* formatter;
}
- (IBAction)voltar:(id)sender;
- (id) initWithNibAndGastos:(NSString*)nib : (Gastos*)passedGastos;
@end
{% endhighlight %}

Tranquilo, certo? Tudo que fazemos aí é criar uma variável de instância do tipo *Gastos*, um [formatter e locale][post-formatter] para exibir tudo bacana e criamos um método que inicializará nossa classe com o nome do arquivo nib e os gastos recebidos: *initWithNibAndGastos*.

Agora vamos implementar alguns métodos no ListaDeValoresViewController.m
{% highlight objc linenos %}
- (id) initWithNibAndGastos:(NSString *)nib :(Gastos *)passedGastos{
    self = [super initWithNibName:nib bundle:nil];
    gastos = passedGastos;

    locale = [[NSLocale alloc] initWithLocaleIdentifier:@"pt_BR"];
    formatter = [[NSNumberFormatter alloc]init];
    [formatter setLocale: locale];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];

    return self;
}

//Métodos para TableView
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Valores gastos";
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [gastos totalDeGastos];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
        								initWithStyle:UITableViewCellStyleDefault
        								reuseIdentifier:CellIdentifier];
    }

    cell.textLabel.text = [formatter stringFromNumber:[gastos gastoAtIndex:indexPath.row]];

    return cell;
}
{% endhighlight %}

Vamos lá: das ***linhas 1 até 11*** o que fazemos é instanciar nosso view controller com o nome do nib informado e o objeto gastos passado. Também inicializamos um formatter para deixar nosso números bacanas na listagem ([já vimos sobre isso aqui][post-formatter]). Este método comporta-se como um construtor retornando a si mesmo após chamar um método da classe base.

Nas ***linhas 14 até 16*** apenas informamos um título para o header da nossa seção (lembre-se que temos apenas uma).

Nas ***linhas 17 até 20*** o que fazemos é informar quantas linhas teremos nesta seção da nossa table. Um UITableView pode possuir diversas seções, por enquanto temos apenas uma então informamos o total de gastos em nosso objeto.

Nas ***linhas 22 até 36*** é onde de fato criamos as células da nossa table view. O que precisamos entender aqui é que esse é um padrão para otimizar o uso de memória. Entenda que se só conseguimos mostrar umas 5 rows de cada vez em uma tela não é preciso criar todas as rows da table. Então as rows são reaproveitadas e teremos apenas 5 ao todo. Assuma que aí apenas a ***linha 33*** é o que muda. Nesta linha formatamos o texto que será exibido na row.

Antes de finalizarmos vamos vincular o datasource e o delegate de nossa table view ao nosso file owner (ou seja o view controller onde implementamos tudo):

<img src="/images_posts/vinculando-datasource-e-delegate-ao-tableview.png" class="post_img" />

Feito! Agora quando adicionarmos alguns valores na nossa tela principal e clicarmos no botão para vermos a listagem teremos algo assim:

<img src="/images_posts/app-ios-usando-uitableview.png" class="post_img" />

##Resumindo
Novamente parece que tivemos um mega trabalho quando na verdade os passos foram bem simples e tranquilos se você ler e tentar fazer o mesmo com calma.

Com isso estamos conseguindo dar uma cara mais interessante para nossa simples aplicação e já começamos a abrir caminho para os próximos passos como por exemplo: navegação.

Sem dúvida alguma essa já é quase uma aplicação que pode nos ajudar: se pensarmos em ao invés de um array de valores criarmos um dicionário com data:[valores] a coisa começa a ficar mais interessante.

Tente ler a documentação dos protocolos relacionados com UITableView([*UITableViewDelegate*][tableViewDelegate] e [*UITableViewDataSource*][tableViewDataSource]) e verá que não é nenhum bicho de outro mundo.

[https://github.com/vquaiato/ios-blog-samples/tree/master/somatorioDeContasTableView][github]

Abração,

Vinicius Quaiato.

[tableview]:http://developer.apple.com/library/ios/#documentation/uikit/reference/UITableView_Class/Reference/Reference.html
[post-action]:http://viniciusquaiato.com/blog/ibaction-iboutlet-eventos-manipualcao-views-no-ios/
[presentViewController]:http://developer.apple.com/library/ios/documentation/uikit/reference/UIViewController_Class/Reference/Reference.html#//apple_ref/doc/uid/TP40006926-CH3-SW75
[tableViewDelegate]:http://developer.apple.com/library/ios/#documentation/UIKit/Reference/UITableViewDelegate_Protocol/Reference/Reference.html
[tableViewDataSource]:http://developer.apple.com/library/ios/#documentation/uikit/reference/UITableViewDataSource_Protocol/Reference/Reference.html
[post-formatter]:http://viniciusquaiato.com/blog/formatacao-de-valores-em-reais-no-ios/
[github]:https://github.com/vquaiato/ios-blog-samples/tree/master/somatorioDeContasTableView
