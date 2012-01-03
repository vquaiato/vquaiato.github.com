--- 
layout: post
title: Efeito Borboleta e o Software
wordpress_id: 1307
wordpress_url: http://viniciusquaiato.com/blog/?p=1307
categories: 
- title: TDD
  slug: tdd
  autoslug: tdd
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
tags: 
- title: Teoria do Caos
  slug: teoria-do-caos
  autoslug: teoria-do-caos
- title: Caos
  slug: caos
  autoslug: caos
- title: "Testes Unit\xC3\xA1rios"
  slug: testes-unitarios
  autoslug: "testes-unit\xC3\xA1rios"
- title: testes
  slug: testes
  autoslug: testes
- title: Unit Tests
  slug: unit-tests
  autoslug: unit-tests
- title: Arquitetura
  slug: arquitetura
  autoslug: arquitetura
- title: Tests
  slug: tests
  autoslug: tests
- title: side effects
  slug: side-effects
  autoslug: side-effects
---
[![](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/dn10006-1_400-150x150.jpg "Efeito Borboleta")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/dn10006-1_400.jpg)Não há como dizer que software não é algo complexo. Por mais simples que seja, é complexo.É de sua natureza, consigamos enxergar isso ou não. Se estamos falando de um software construído sob o paradigma Orientado a Objetos estamos falando de algumas dezenas, centenas e às vezes milhares de objetos relacionando-se das mais diversas formas. Enviando mensagens, disparando ações, alterando estados, e fazendo as coisas acontecerem.É então neste caso que devemos nos atentar aos "side effects", ou como eu carinhosamente chamei "[Efeito Borboleta](http://pt.wikipedia.org/wiki/Efeito_borboleta)".<blockquote>"O bater de asas de uma borboleta em Tóquio pode provocar um furacão em Nova Iorque."</blockquote>

### Teoria do Caos
O Efeito Borboleta é uma das bases da [Teoria do Caos](http://en.wikipedia.org/wiki/Chaos_theory). Basicamente a Teoria do Caos explica - para a física e a matemática - que em sistemas complexos e dinâmicos resultados aleatórios e indeterminados ocorrem de pequenas variações em seus parâmetros iniciais.Isso nos leva a compreender que o resultados destas interações e variações, levam estes sistemas aos caos, que não pode ser previsto.

### Side effects
Segundo [Uncle Bob](butunclebob.com), no livro [Clean Code](http://viniciusquaiato.com/blog/dica-de-leitura-clean-code/), side effects são mentiras. São ações "escondidas" realizadas por métodos que não deveriam realizar estas ações. Em muitos casos estas ações realizam mudanças inesperadas no estado dos objetos, resultando assim nestes "efeitos colaterais".

### O software
Eu não sou um estudioso da Teoria do Caos (pelo menos não era, confesso que me interessei muito). Mas não pude deixar de traçar este paralelo. Qual paralelo? Oras, quem é que nunca trabalhou com um sistema, um fragmento de código, que julgava realizar uma determinada ação, dados seus parâmetros de entrada, e o resultado, a cada execução, fosse completamente aleatório, caótico e imprevisível?Tudo isto começou a me fazer sentido em uma das discussões do [.NET Architecs](http://dotnetarchitects.net/), onde alguns membros do grupo disseram "ser possível prever o comportamento de um sistema conhecendo seu código".Oras, como é possível prever o comportamento de um sistema complexo? Nossa mente é incapaz de montar o sistema de uma forma que consigamos visualizá-lo em meio  a um problema.O grafo de objetos relacionados tende a ser realmente muito grande para visualizarmos de forma simples (inclusive é por estas razões que hoje temos ferramentas que nos auxiliam a criar [diagramas](http://blogs.msdn.com/b/jpclementi/archive/2010/04/16/ferramentas-de-arquitetura-no-visual-studio-2010.aspx) de relacionamento, dependência, atividade, classes, etc).Como é possível, então, prever o comportamento de um software?

### Os testes
Eu não discordo da idéia de que o software precisa ter um código fonte bem escrito: legível, claro, coeso, simples, enxuto. Mas (sempre temos um mas) não posso confiar unicamente em mim, pois por mais que eu conheça este software eu não consigo processar de uma só vez, ao mesmo tempo, todas as suas relações e caminhos. E é neste ponto que entram os testes automatizados.Qual é a única forma de garantir que algo faz o que deve fazer? Testando!Alguns podem até dizer que não é preciso testar, mas a verdade é que todo mundo faz testes: alguns preferem algo automatizado, que pode ser utilizado por mais de uma vez, e é executado em pouco tempo, e outros preferem testes manuais, executando o sistema, passando por N telas, e tentando verificar todos os caminhos e situações.Minha crença de que os testes automatizados servem para o propósito de diminuir o impacto do Efeito Borboleta se dá pelo fato de que quando você escreve um teste você está escrevendo uma condição, real, a qual o sistema deve ser capaz de responder. Além disso, você determina qual o comportamento que ele deve ter quando este estímulo(parâmetros) é utilizado.Acontece ainda que não escrevemos apenas um teste, escrevemos dezenas deles, desta forma acabamos garantindo pré-condições, pós-condições e invariantes. Ou seja, acabamos utilizando os testes para criar uma forma de contrato para o nosso software, definindo e delineando bem como ele deve se comportar.

### As alterações e o Caos
Quando seu sistema não possui uma boa cobertura de testes, ou seja, quando você não sabe como o seu sistema se comporta, a introdução de uma pequena mudança pode ter efeitos catastróficos, aleatórios e completamente desconhecidos. E o pior, estes efeitos podem ocorrer na outra extremidade que não aquela onde a mudança foi realizada, isto torna claro que não basta conhecer bem o ponto do software onde está realizando a mudança, seria necessário conhecer todo e cada caminho que o software pode tomar, o que é impossível apenas no plano mental.Vocês podem não concordar, mas vejamos um exemplo bem simples:
{% highlight csharp %}

internal class SistemaQualquer{    

static void Autenticar(string login, string senha)    {
var usuario = Usuarios.ObterPor(login, senha);
    if(usuario!=null)        {            if(usuario.SenhaEstaExpirada)                throw new SenhaExpiradaException("Senha está expirada");
    else if(usuario.SenhaEstaBloqueada)                throw new SenhaBloqueadaException("Senha está bloqueada.");
    RegistrarTentativaLogin.ComSucesso(login, senha);
    }
        else        {            RegistrarTentativaLogin.ComFalha(login, senha);
    throw new UsuarioOuSenhaInvalidosException("Usuário ou senha incorretos.");
    }
    }
}

{% endhighlight %}
Este simples método, com 19 linhas causa em nosso sistema pelo menos 4 caminhos diferentes. Isso quer dizer que, quando você olhar para este simples método você precisa pelo menos mapear seus 4 caminhos distintos mentalmente, para conseguir prever tudo o que ele irá fazer com cada parâmetro que você informe. Poderíamos complicar um pouco mais, se adicionarmos uma validação de que os parâmetros não podem ser vazios ou nulos, o método ganha pelo menos mais 2 caminhos, totalizando a necessidade de uma mapa mental de 6 caminhos distintos. Se formos analisar ainda o método ObterPor, da classe Usuarios, com certeza teríamos de mapear mais alguns caminhos somados aos nossos 6 existintes. Então eu pergunto:_** Como pode haver previsibilidade e conhecimento sobre um software se não podemos visualizar por completo uma simples rotina de autenticação?**_[caption id="attachment_1332" align="aligncenter" width="300" caption="Code Metrics - Complexidade Ciclomática"][![Code Metrics - Complexidade Ciclomática](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/metrics-300x107.jpg "Code Metrics - Complexidade Ciclomática")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/metrics.jpg)[/caption]Outro "detalhe" sobre o código acima: para a simples tarefa de autenticação eu precisei de 6 classes (Usuarios, Usuario, RegistrarTentativaLogin, e as 3 exceptions). Então vamos lá, além dos meus 6 caminhos, os caminhos desconhecidos do método ObterPor, eu tenho 6 classes que eu também não tenho total ciência do que vão fazer, afinal, minha mente nem chegou a ver seu código ainda.Isto é caos. Isto é "aleatório". Afinal, você consegue prever quais os parâmetros de entrada serão utilizados? Você consegue, mentalmente enquanto executa a aplicação, pensar em todos os "trick scenarios"? E quando uma pequena alteração for feita, você consegue propagar mentalmente esta alteração por todos os caminhos, prevendo e conhecendo todos os impactos e resultados? Impossível!E vejam, estou falando de um código com 19 linhas!

### Em resumo
É impossível prever o comportamento de um software sem uma ferramenta que te auxilie. A melhor ferramenta para manter o controle e a previsão sobre as alterações e efeitos que um software pode ter é a escrita e manutenção de testes automatizados, sejam eles testes unitários, testes de integração, testes de aceitação, etc. A existência e a manutenção dos testes são a melhor forma de conseguir variações em um software, analisando e conhecendo o seu impacto, comportamento e abrangência. Entendendo seus efeitos e conseguindo uma forma de amenizar os impactos negativos.O software sempre se comportará de uma forma caótica. Ele sempre estará repleto de acoplamento, seja este acoplamento abstraído ou não. O software sempre terá diversos caminhos, e conforme vai crescendo esses caminhos vão se multiplicando e ficando cada vez mais complexos. Desta forma, para que você consiga ter o mínimo de previsibilidade e para que consiga dar ao software a vida que ele deve ter: escreva e mantenha testes!

Abraços,
Vinicius Quaiato.
