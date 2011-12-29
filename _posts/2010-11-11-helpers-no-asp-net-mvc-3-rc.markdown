--- 
layout: post
title: Helpers no ASP.NET MVC 3 RC
wordpress_id: 2121
wordpress_url: http://viniciusquaiato.com/blog/?p=2121
categories: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: Razor
  slug: razor
  autoslug: razor
- title: ASP.NET MVC 3
  slug: asp-net-mvc-3
  autoslug: asp.net-mvc-3
- title: ASP.NET MVC 3 RC
  slug: asp-net-mvc-3-rc
  autoslug: asp.net-mvc-3-rc
- title: MVC 3 Release Candidate
  slug: mvc-3-release-candidate
  autoslug: mvc-3-release-candidate
- title: Erro Helpers MVC3 RC
  slug: erro-helpers-mvc3-rc
  autoslug: erro-helpers-mvc3-rc
---
Fala galera, montando alguns exemplos para o minicurso de MVC 3, me <del datetime="2010-11-11T11:08:15+00:00">reparei</del> deparei com um <del datetime="2010-11-11T11:08:15+00:00">problema</del> erro criando helpers no Razor com o MVC 3 Release Candidate.Eu estava obtendo o seguinte erro:[caption id="attachment_2122" align="aligncenter" width="300" caption="Compilation Error - helpers razor mvc 3 rc"][![Compilation Error - helpers razor mvc 3 rc](http://viniciusquaiato.com/blog/wp-content/uploads/2010/11/Compilation-Error-helpers-razor-mvc-3-rc-300x257.png "Compilation Error - helpers razor mvc 3 rc")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/11/Compilation-Error-helpers-razor-mvc-3-rc.png)[/caption]Para solucionar esse problema precisamos adicionar estas duas linhas ao arquivo Web.config, na sessão assemblies:<pre lang="xml"><add assembly="WebMatrix.Data, Version=1.0.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35" /><add assembly="WebMatrix.WebData, Version=1.0.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35" /></pre>Pronto! Feito isso seus Razor helpers voltarão a funcionar no ASP.NET MVC 3 Release Candidate.Abraços,Vinicius Quaiato.
