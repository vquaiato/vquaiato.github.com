--- 
layout: post
title: "Raquing Jekyll, Github, Regex e Wordpress"
categories: 
- title: Blog
  slug: blog
tags:
- title: Jekyll
  slug: jekyll
  autoslug: jekyll
---
Fala galera, beleza?

Pois bem, depois de decidir sobre como funcionaria o meu novo blog eu tive que pesquisar um pouco sobre como colocar tudo isso para funcionar. 

##Migrando os posts do Wordpress para markdown
A minha maior preocupação foi entender se era possível e como era possível migrar os posts do Wordpress para o Jekyll. 

Dando rápida olhada na documentação do [Jekyll e vemos que ele possui uma série de migrators][migrators] para importar posts existentes de alguns engines. E como é de se esperar o Wordpress está entre eles.

Das formas de fazer isso com o wordpress a que eu escolhi foi:

- conectar no mysql do meu blog e fazer um dump
- conectar no mysql local e fazer um import

Feito isso precisamos rodar o migrator do Jekyll. Antes de rodarmos vamos instalar algumas dependências que ele possui:

{% highlight sh %}
sudo gem install mysqlplus
sudo gem install sequel 
{% endhighlight %}

Terminadas as instalações precisamos fazer uma configuração:

{% highlight sh %}
export DYLD_LIBRARY_PATH="/usr/local/mysql/lib/:$DYLD_LIBRARY_PATH"
{% endhighlight %}

Pronto! Basta convertermos tudo:

{% highlight sh %}
ruby -rubygems -e 'require "jekyll/migrators/wordpress"; Jekyll::WordPress.process("database", "user", "pass")'
{% endhighlight %}

###Tratando os posts com regex
Depois de realizar a migração eu precisei tratar os posts migrados pois o html dos posts não ficou 100% como eu queria após convertido para markdown.

Estes ajustes até poderiam ser feitos manualmente, post por post. Eu até estava com paciência para isso. O problema é que eu tenho 280 posts que foram migrados e isso acabou com a idéia de fazer manualmente.

Foi então que comecei a me divertir com regex em Ruby. Muita gente diz que Regex é um grande problema, e eu até concordo com isso. Mas acho que neste cenário era o ideal. Eu não estou colocando uma dúzia de regex dentro de um sistema, estou apenas utilizando-as para tarefas pontuais que eu não repetirei mais.

Essa foi uma experiência bem interessante. Regex é meio que um mito/tabu. Muitos nunca as estudaram, não as compreendem e se aproveitam desse papo de que *"elas são um problema"* para nunca estudá-las e nem utilizá-las. Falácia né…
Algumas das regex que utilizei seguem abaixo:

{% highlight ruby %}
#code format
replace.gsub! /{[^\s?\.]/, "{\n"
replace.gsub! /;(\s*)/, ";\n    "
replace.gsub! /(\s\s+)(var|double|string|decimal|int|bool|void|List<.*>|IEnumerable<.*>)\s/, "\n\\2\s"
replace.gsub! /^(public|private|protected|internal|static)\s/, "\n\\1\s"
replace.gsub! /\s+(if|for|foreach|do|while)\s?({|\()/, "\n\\1\\2"
replace.gsub! /\s+(return)(\s.*);/, "\n\\1\\2;"
{% endhighlight %}

A lista completa está aqui: [regex_raque.rb][regex]

**Disclaimer:** *As regex que utilizei não tem nada a ver com o Jekyll. Foi apenas uma forma que eu encontrei de ajustar alguns posts. Isso tudo está em um arquivo separado que eu rodei manualmente isolado do Jekyll.*


##Importando as imagens 
Terminada essa minha fase de migração e ajustes (que ainda necessitam de retoques manuais) eu parti para algumas outras migrações como por exemplo as imagens.

Eu já não queria mais a estrutura de pastas do wordpress para manter as imagens dos meus posts então resolvi jogar todas as imagens dos posts em um diretório só.

Isso foi bastante simples visto que eu já tinha todos os posts em arquivos locais. Bastaria eu percorrer todos estes arquivos, procurar as urls de imagens e então baixá-las do servidor. É óbvio que eu não faria isso na unha, então criei um script Ruby que me ajudou:

{% highlight ruby %}
Dir.foreach("../_posts/") do |file|
	begin
		content  = File.read("../_posts/#{file}")
		images_found = content.scan /http\S*\.[jpg|gif|png]+/i

		images_found.each do |img|
			system "curl #{img} -O"
		end
	rescue
		p "shit #{file}"
	end
end
{% endhighlight %}

**Disclaimer:** *Não sei se essa é a melhor regex do mundo (provavelmente não pois eu tinha medo delas antes dessa brincadeira) mas ela funcionou bem para baixar minhas mais de 900 imagens.*

##Alguns ajustes finais
###Syntax highlight
O Jekyll faz uso da biblioteca pygments para syntax highlight. [Aqui podemos ver uma lista de linguagens que ele coloriza e uma série de arquivos de estilo para estas linguagens][pygments-list].

###Biblioteca markdown
Além disso a biblioteca padrão para markdown do Jekyll é o Makuru. Pelo que andei lendo o RDiscount é melhor e mais rápido que ele, então eu preferi usá-lo.
Para isso basta adicionarmos uma linha ao arquivo *_config.yml*

{% highlight ruby %}
markdown: rdiscount
{% endhighlight %}

E instalarmos essa gem:

{% highlight sh %}
$ [sudo] gem install rdiscount -s http://gemcutter.org
{% endhighlight %}

###Gerando as tags
Todas as tags dos posts no Jekyll vão em uma espécie de header YAML. Para gerar as páginas de tags (que listam todos os posts de uma tag) eu utilizei uma rake task, desta forma eu faço no console algo como

{% highlight sh %}
rake tags:generate
{% endhighlight %}

E pronto! Minhas pastas e arquivos estão gerado, tudo estático :D
Essa rake task pode ser encontrada aqui.

##Resumindo
Desta forma fica bem claro como é simples fazer uma migração e algumas configurações para iniciar o uso do Jekyll a partir de um blog já existente.

Essa brincadeira toda de script e regex se torna bastante divertida quando estamos brincando com Ruby. Basta escrever meu script em um arquivo texto e executar com um simples _ruby nome_do_arquivo.rb_ e pronto! A coisa se torna bastante rápida e produtiva.

[migrators]:https://github.com/mojombo/jekyll/wiki/blog-migrations
[regex]:https://github.com/vquaiato/vquaiato.github.com/blob/master/_raquer_scripts/regex_raque.rb
[pygments-list]:http://pygments.org/demo/