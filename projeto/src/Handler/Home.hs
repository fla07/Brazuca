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
    
                    $if lt IE 9
                      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
                      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
                    
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
                            <li class="active"> <a href="#">Home <span class="sr-only">(current)
                            <li><a href="#">Recomendados
                            <li class="dropdown"> 
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Categoorias 
                                <span class="caret"></span></a>
                                  <ul class="dropdown-menu" role="menu" style="color:rgba(251,248,248,1.00)">
                                    <li><a href="#">Acessórios
                                    <li><a href="#">Artigos Esportivos
                                    <li><a href="#">Bandeiras
                                    <li>
                                    	<a href="#">Camisetas
                                        <ul class="dropdown-menu-right" role="menu">
                                        <li><a href="#">Feminina
                                        <li><a href="#">Masculina
                                         </ul>
                                    </li>
                                    <li><a href="#">Canecas
                                    <li><a href="#">Chaveiros
                                    <li><a href="#">Pelúcias
                                    <li class="divider">
                                    <li><a href="#">Ofertas
                                    <li class="divider"></li>
                                    <li><a href="#">Produtos em Destaque
                               
                           
                          <form class="navbar-form navbar-right" role="ex. camiseta feminina">
                            <div class="form-group">
                              <input type="text" class="form-control" placeholder="ex. camiseta feminina">
                            
                            <button type="submit" class="btn btn-default">Pesquisar
                          
                          <ul class="nav navbar-nav navbar-right hidden-sm">
                            <li><a href="#">Sobre</a> </li>
                            <li class="dropdown"> 
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Minha Conta 
                                <span class="caret">
                                    <ul class="dropdown-menu" role="menu" >
                                        <li><a href="#">Carrinho
                                        <li><a href="#">Login
                                        <li class="divider">
                                            <li><a href="#">Cadastre-se
                                    
                       
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
                              <h4>Frete Grátis
                        
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                          <div class="row">
                            <div class="col-lg-2 col-md-3 col-sm-3 col-xs-2"><img class="img-circle" alt="Free Shipping" src="img/icon_melhores_produtos.png">
                            <div class="col-lg-6 col-md-9 col-sm-9 col-xs-9">
                              <h4>Melhores Produtos
                           
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                          <div class="row">
                            <div class="col-lg-2 col-md-3 col-sm-3 col-xs-2"><img class="img-circle" alt="Free Shipping" src="img/icon_economia.png">
                            <div class="col-lg-6 col-md-9 col-sm-9 col-xs-9">
                              <h4>Preços Baixos
                            
                    <hr>
                    <h2 class="text-center">PRODUTOS RECOMENDADOS
                    <hr>
                    <div class="container">
                      <div class="row text-center">
                        <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
                          <div class="thumbnail"> <img src="img/img_didi.png" alt="Thumbnail Image 1" class="img-responsive" style=" width=400px; height=200px;">
                            <div class="caption">
                              <h3>Didi Forever
                              <p>Camiseta Didi No Céu Tem Pão? por apenas R$29,90.
                              <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true">
                                     Adicionar ao Carrinho
                               
                           
                        <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
                          <div class="thumbnail"> <img src="img/img_carnaval.png" alt="Thumbnail Image 1" class="img-responsive" style=" width=400px; height=200px;">
                            <div class="caption">
                              <h3>Carnaval
                              <p>Camiseta feminina Carnaval Legal de R$29,99 por R$22,00!
                              <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true">
                                    Adicionar ao Carrinho
                            
                            
                        <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
                          <div class="thumbnail"> <img src="img/img_sam.png" alt="Thumbnail Image 1" class="img-responsive" style=" width=400px; height=200px;">
                            <div class="caption">
                              <h3>SAM
                              <p>Camiseta SAM masculina inverno por R$35,00.
                              <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"> 
                                    Adicionar ao Carrinho
                           
                           
                        <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6 hidden-lg hidden-md hidden-sm">
                          <div class="thumbnail"> <img src="img/img_macaquinho_feliz.png" alt="Thumbnail Image 1" class="img-responsive" style=" width=400px; height=200px;">
                            <div class="caption">
                              <h3>Macaquinho Feliz
                              <p>Pelúcia Macaquinho Feliz R$45,80.
                              <p>
                                <a href="#" class="btn btn-primary" role="button">
                                     <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true">
                                     Adicionar ao Carrinho
    
                      <div class="row text-center hidden-xs">
                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                          <div class="thumbnail"> <img src="img/img_xulesco.png" alt="Thumbnail Image 1" class="img-responsive" style=" width=400px; height=200px;">
                            <div class="caption">
                              <h3>Boneco Xulesco
                              <p>Boneco Xulesco da Derrota em até 7 X R$1,00.
                              <p>
                                  <a href="#" class="btn btn-primary" role="button">
                                    <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true">
                                    Adicionar ao Carrinho
    
    
                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                          <div class="thumbnail"> <img src="img/img_caneca.png" alt="Thumbnail Image 1" class="img-responsive" style=" width=400px; height=200px;">
                            <div class="caption">
                              <h3>Caneca Sampa
                              <p>Caneca Sampa especial para um café paulistano na hora do trampo por R$36,90.
                              <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true">
                                    Adicionar ao Carrinho
                            
                            
                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                          <div class="thumbnail"> <img src="img/img_chaveiro.png" alt="Thumbnail Image 1" class="img-responsive" style=" width=400px; height=200px;">
                            <div class="caption">
                              <h3>Chaveiro Brasil
                              <p>Chaveiro Mapa do Brasil em resina e inox por R$19,99.
                              <p><a href="#" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true">
                              Adicionar ao Carrinho
                            
                      <nav class="text-center">
                        
                        <ul class="pagination">
                          <li> <a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;
                          <li class="active"><a href="#">1
                          <li><a href="#">2
                          <li><a href="#">3
                          <li><a href="#">4
                          <li class="disabled"><a href="#">5
                          <li> <a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;
                       
                       
                    <hr>
                    <h2 class="text-center">PRODUTOS EM DESTAQUE</h2>
                    <hr>
                    <div class="container">
                      <div class="row">
                        <div class="col-lg-4 col-md-6">
                          <div class="media-object-default">
                            <div class="media">
                              <div class="media-left"> <a href="#"> <img class="media-object" src="img/100X125.gif" alt="placeholder image"> </a> </div>
                              <div class="media-body">
                                <h4 class="media-heading">Produto
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis, vitae doloremque voluptatum doloribus neque assumenda velit sapiente quas aliquam ratione. Sed possimus corporis dolorum optio eaque in asperiores soluta expedita! </div>
                            
                            <div class="media">
                              <div class="media-left"> <a href="#"> <img class="media-object" src="img/100X125.gif" alt="placeholder image"> </a> </div>
                              <div class="media-body">
                                <h4 class="media-heading">Produto
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit, quasi doloribus non repellendus quae aperiam. Quos, eligendi itaque soluta ut dignissimos reprehenderit commodi laboriosam quis atque minus enim magnam delectus.</div>
                            
                            <div class="media">
                              <div class="media-left"> <a href="#"> <img class="media-object" src="img/100X125.gif" alt="placeholder image"></a></div>
                              <div class="media-body">
                                <h4 class="media-heading">Produto</h4>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus, repellendus, ad, adipisci neque earum culpa magnam veritatis ipsum dolores odio laboriosam sed veniam accusamus! Architecto, provident nulla recusandae repellendus illo!</div>
                        
                        
                        <hr class="hidden-md hidden-lg">
                        <div class="col-lg-4 col-md-6">
                          <div class="media-object-default">
                            <div class="media">
                              <div class="media-left"> <a href="#"> <img class="media-object" src="img/100X125.gif" alt="placeholder image">
                              <div class="media-body">
                                <h4 class="media-heading">Produto
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sit, eos, et in quam laboriosam ipsum laudantium laborum provident nihil modi reprehenderit tempora voluptatum quasi non libero quaerat vel. Assumenda, officiis?</div>
                            
                            <div class="media">
                              <div class="media-left"> <a href="#"> <img class="media-object" src="img/100X125.gif" alt="placeholder image">
                              <div class="media-body">
                                <h4 class="media-heading">Produto
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Obcaecati, minus, praesentium dignissimos non provident et consectetur illo expedita aliquam laboriosam esse incidunt deleniti accusantium debitis voluptas. Non vitae quos dolorem.</div>
                            
                            <div class="media">
                              <div class="media-left"> <a href="#"> <img class="media-object" src="img/100X125.gif" alt="placeholder image">
                              <div class="media-body">
                                <h4 class="media-heading">Produto
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio, ducimus quidem aliquam voluptate quas impedit modi neque quasi deleniti dicta. Dolore, provident, unde voluptas dicta fugit odit maxime eius minus!</div>
                        
                        
                        <hr class="hidden-lg">
                        <div class="col-lg-4 col-md-12 hidden-md">
                          <div class="media-object-default">
                            <div class="media">
                              <div class="media-left"> <a href="#"> <img class="media-object" src="img/100X125.gif" alt="placeholder image">
                              <div class="media-body">
                                <h4 class="media-heading">Media heading 1
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Porro dolorum reprehenderit vitae omnis. Quidem, recusandae, magni ut perspiciatis nobis consequuntur ullam molestias molestiae obcaecati ea labore aspernatur modi. Impedit, fugit!</div>
                            
                            <div class="media">
                              <div class="media-left"> <a href="#"> <img class="media-object" src="img/100X125.gif" alt="placeholder image">
                              <div class="media-body">
                                <h4 class="media-heading">Produto
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore, libero, ea itaque atque vero quidem esse optio minus tenetur dolorem delectus nemo fugit deserunt quibusdam veritatis assumenda obcaecati praesentium omnis!</div>
                            
                            <div class="media">
                              <div class="media-left"> <a href="#"> <img class="media-object" src="img/100X125.gif" alt="placeholder image">
                              <div class="media-body">
                                <h4 class="media-heading">Produto
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam, cumque, ad voluptatibus vel perspiciatis reprehenderit magni in recusandae voluptatum iusto commodi laudantium veritatis esse labore nisi error tempora debitis impedit.</div>
                        
                        
                    <hr>
                      <div class="container well">
                        <div class="row">
                          <div class="col-xs-6 col-sm-6 col-md-6 col-lg-7">
                            <div class="row">
                              <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
                                <div>
                                  <ul class="list-unstyled">
                                    <li> <a>Camisetas
                                    <li> <a>Canecas
                                    <li> <a>Chaveiros
                                    <li> <a>Acessorios
                                    <li> <a>Esportivos
                                  </ul>
                                </div>
                              </div>
                              <div class="col-sm-4 col-md-4 col-lg-4  col-xs-6">
                                <div>
                                  <ul class="list-unstyled">
                                    <li> <a>Pelucias
                                    <li> <a>Destaques
                                    <li> <a>Ofertas
                                    <li> <a>Mais Vendidos
                                    <li> <a>Exclusivos
                                 
                              <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
                                <div>
                                  <ul class="list-unstyled">
                                    <li> <a>Haskell
                                    <li> <a>Yesod
                                    <li> <a>Heroku
                                    <li> <a>ELM
                                    <li> <a>Creditos
                              
                          <div class="col-xs-6 col-sm-6 col-md-6 col-lg-5"> 
                            <address>
                            <strong>Haskell Brazuca Ltda.
                            <br>
                            Rua dos Bobos, nº 0
                            <br>
                            Patópolis - Disneylândia
                            <br>
                            <abbr title="Phone">Telefone:</abbr> (666) 666-666
                          
                            <address>
                            <strong>Contato</strong><br>
                            <a href="mailto:#">brazuca@huehuebr.com
                         
                    
                    <footer class="text-center">
                      <div class="container">
                        <div class="row">
                          <div class="col-xs-12">
                            <p>Copyright © Haskell Brazuca. Copia não, comédia.
                          
                        
                    <script src="js/jquery-1.11.2.min.js">
                    <script src="js/bootstrap.min.js">
                    
        |]