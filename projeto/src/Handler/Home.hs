{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
-- | Common handler functions.
module Handler.Home where

import Import
import Database.Persist.Postgresql

getHomeR :: Handler Html
getHomeR = do 
    defaultLayout $ do 
        [whamlet|
        $doctype 5
            <html>
                <head>
                    <meta charset="utf-8">
                    <meta http-equiv="X-UA-Compatible" content="IE=edge">
                    <meta name="viewport" content="width=device-width, initial-scale=1">
                    <title>Haskell Brazuca
    
                    <link rel="stylesheet" href="css/bootstrap.css">

                    
                    <body>
                    <nav>
                      <div class="container"> 
                        
                       
                        <div class="navbar-header">
                          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> 
                              <span class="sr-only">Toggle navigation 
                              <span class="icon-bar"> 
                              <span class="icon-bar"> 
                              <span class="icon-bar">
                          <a class="navbar-brand" href="#" style="color:rgba(12,149,207,0.99); 
                          font-size:24px; font-family:Gotham, 'Helvetica Neue', Helvetica, Arial, sans-serif"><img src="#"/><b>Haskell Brazuca
                        
                       
                        <div class="collapse navbar-collapse" >
                          <ul class="nav navbar-nav">
                            <li class="active"> <a href=@{Home}>Home <span class="sr-only">(current)
                            <li><a href=@{Recomendados}>Recomendados
                            <li class="dropdown"> 
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Categoorias 
                                <span class="caret">
                                  <ul class="dropdown-menu" role="menu" style="color:rgba(251,248,248,1.00)">
                                    <li><a href=@{Acessorios}>Acessorios
                                    <li><a href=@{Esportivos}>Artigos Esportivos
                                    <li><a href=@{Bandeiras}>Bandeiras
                                    <li>
                                    	<a href=@{Camisetas}>Camisetas
                                        <ul class="dropdown-menu-right" role="menu">
                                        <li><a href=@{Feminina}>Feminina
                                        <li><a href=@{Masculina}>Masculina
                                    <li><a href=@{Canecas}>Canecas
                                    <li><a href=@{Chaveiros}>Chaveiros
                                    <li><a href=@{Pelucias}>Pelucias
                                    <li class="divider">
                                    <li><a href=@{Ofertas)>Ofertas
                                    <li class="divider"></li>
                                    <li><a href=@{ProdDestaque}>Produtos em Destaque
                          <form class="navbar-form navbar-right" role="ex. camiseta feminina">
                            <div class="form-group">
                              <input type="text" class="form-control" placeholder="ex. camiseta feminina">
                            
                            <button type="submit" class="btn btn-default">Pesquisar
                          
                          <ul class="nav navbar-nav navbar-right hidden-sm">
                            <li><a href=@{Sobre}>Sobre</a> </li>
                            <li class="dropdown"> 
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Minha Conta 
                                <span class="caret">
                                    <ul class="dropdown-menu" role="menu" >
                                        <li><a href=@{Carrinho}>Carrinho
                                        <li><a href=@{Login}>Login
                                        <li class="divider">
                                            <li><a href=@{Cadastro}>Cadastre-se
                                    
                       
                    <div class="container">
                        <div class="row">
                          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div id="carousel1" class="carousel slide">
                              <ol class="carousel-indicators">
                                <li data-target="#carousel1" data-slide-to="0" class="active">
                                <li data-target="#carousel1" data-slide-to="1" class="">
                                <li data-target="#carousel1" data-slide-to="2" class="">
                              
                              <div class="carousel-inner">
                                <div class="item"> <img class="img-responsive" src="img/loja1.jpg" alt="thumb">
                                  <div class="carousel-caption">
                                
                                <div class="item active"> <img class="img-responsive" src="img/loja2.jpg" alt="thumb">
                                  <div class="carousel-caption">
                                  
                                <div class="item"> <img class="img-responsive" src="img/loja3.jpg" alt="thumb">
                                  <div class="carousel-caption"> 
                                
                              
                              <a class="left carousel-control" href="#carousel1" data-slide="prev"><span class="icon-prev"> 
                              <a class="right carousel-control" href="#carousel1" data-slide="next"><span class="icon-next">
                         
                        <hr>
                      
                    <div class="container">
                      <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                          <div class="row">
                            <div class="col-lg-2 col-md-3 col-sm-3 col-xs-2"><img class="img-circle" alt="Free Shipping" src="img/icon_frete.png">
                            <div class="col-lg-6 col-md-9 col-sm-9 col-xs-9">
                              <h4>Frete Gratis
                        
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                          <div class="row">
                            <div class="col-lg-2 col-md-3 col-sm-3 col-xs-2"><img class="img-circle" alt="Free Shipping" src="img/icon_melhores_produtos.png">
                            <div class="col-lg-6 col-md-9 col-sm-9 col-xs-9">
                              <h4>Melhores Produtos
                           
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                          <div class="row">
                            <div class="col-lg-2 col-md-3 col-sm-3 col-xs-2"><img class="img-circle" alt="Free Shipping" src="img/icon_economia.png">
                            <div class="col-lg-6 col-md-9 col-sm-9 col-xs-9">
                              <h4>Precos Baixos
                            
                    <hr>
                    <h2 class="text-center">PRODUTOS RECOMENDADOS
                    <hr>
                    <div class="container">
                      <div class="row text-center">
                        <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
                          <div class="thumbnail"> <img src="img/img_didi.png" alt="Didi" class="img-responsive" style=" width=400px; height=200px;">
                            <div class="caption">
                              <h3>Didi Forever
                              <p>Camiseta Didi No Céu Tem Pão? por apenas R$29,90.
                              <p>
                                <a href=@{CamisetaDidi} class="btn btn-primary" role="button">
                                    <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true">
                                     Adicionar ao Carrinho
                               
                           
                        <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
                          <div class="thumbnail"> <img src="img/img_carnaval.png" alt="Carnaval" class="img-responsive" style=" width=400px; height=200px;">
                            <div class="caption">
                              <h3>Carnaval
                              <p>Camiseta feminina Carnaval Legal de R$29,99 por R$22,00!
                              <p>
                                <a href=@{CamisetaCarnaval} class="btn btn-primary" role="button">
                                    <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true">
                                    Adicionar ao Carrinho
                            
                            
                        <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
                          <div class="thumbnail"> <img src="img/img_sam.png" alt="SAM" class="img-responsive" style=" width=400px; height=200px;">
                            <div class="caption">
                              <h3>SAM
                              <p>Camiseta SAM masculina inverno por R$35,00.
                              <p>
                                <a href=@{CamisetaSAM} class="btn btn-primary" role="button">
                                    <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"> 
                                    Adicionar ao Carrinho
                           
                           
                        <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6 hidden-lg hidden-md hidden-sm">
                          <div class="thumbnail"> <img src="img/img_macaquinho_feliz.png" alt="Feliz" class="img-responsive" style=" width=400px; height=200px;">
                            <div class="caption">
                              <h3>Macaquinho Feliz
                              <p>Pelúcia Macaquinho Feliz R$45,80.
                              <p>
                                <a href=@{PeluciaMacaco} class="btn btn-primary" role="button">
                                     <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true">
                                     Adicionar ao Carrinho
    
                      <div class="row text-center hidden-xs">
                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                          <div class="thumbnail"> <img src="img/img_xulesco.png" alt="7X1" class="img-responsive" style=" width=400px; height=200px;">
                            <div class="caption">
                              <h3>Boneco Xulesco
                              <p>Boneco Xulesco da Derrota em até 7 X R$1,00.
                              <p>
                                  <a href=@{PeluciaDerrota} class="btn btn-primary" role="button">
                                    <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true">
                                    Adicionar ao Carrinho
    
    
                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                          <div class="thumbnail"> <img src="img/img_caneca.png" alt="Sampa" class="img-responsive" style=" width=400px; height=200px;">
                            <div class="caption">
                              <h3>Caneca Sampa
                              <p>Caneca Sampa especial para um café paulistano na hora do trampo por R$36,90.
                              <p>
                                <a href=@{CanecaSampa) class="btn btn-primary" role="button">
                                    <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true">
                                    Adicionar ao Carrinho
                            
                            
                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                          <div class="thumbnail"> <img src="img/img_chaveiro.png" alt="Chaveiro Brasil" class="img-responsive" style=" width=400px; height=200px;">
                            <div class="caption">
                              <h3>Chaveiro Brasil
                              <p>Chaveiro Mapa do Brasil em resina e inox por R$19,99.
                              <p><a href=@{ChaveiroMapa} class="btn btn-primary" role="button"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true">
                              Adicionar ao Carrinho
                            
                      <nav class="text-center">
                        
                        <ul class="pagination">
                          <li class="active"><a href=@{Home}>1
                          <li><a href=@{Home}>2
                          <li><a href=@{Home}>3
                          <li><a href=@{Home}>4
                          <li class="disabled"><a href="#">5
                          <li> <a href=@?{(Home, [("page", pack $ show $ currPage + 1)])}>Proximo
                        
                    <hr>
                    
                    <footer class="text-center">
                      <div class="container">
                        <div class="row">
                          <div class="col-xs-12">
                            <p>Copyright © Haskell Brazuca. Copia não, comédia.
                          
                        
                    <script src="js/jquery-1.11.2.min.js">
                    <script src="js/bootstrap.min.js">
                    
        |]