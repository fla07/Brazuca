{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
-- | Common handler functions.
module Handler.Produto where

import Import
import Database.Persist.Postgresql

formProd :: Form Produto 
formProd = renderDivs $ Produto 
    <$> areq textField "Nome: " Nothing
    <*> areq doubleField "Preco: " Nothing 
    <*> areq intField "Estoque: " Nothing
    
getProdutoR :: Handler Html
getProdutoR = do 
    (widget,enctype) <- generateFormPost formProd
    defaultLayout $ do 
        [whamlet|
            <form action=@{ProdutoR} method=post>
                ^{widget}
                <input type="submit" value="Cadastrar">
        |]

postProdutoR :: Handler Html 
postProdutoR = do 
    ((resultado,_),_) <- runFormPost formProd
    case resultado of 
        FormSuccess produto -> do 
            pid <- runDB $ insert produto
            redirect (PerfilProdR pid)
        _ -> redirect HomeR

getListaProdutoR :: Handler Html
getListaProdutoR = do 
    produtos <- runDB $ selectList [] [Asc ProdutoNome]
    defaultLayout $ do 
        [whamlet|
            <table>
                <thead>
                    <tr>
                        <td> 
                            Nome
                        <td>
                            Preco
                        <td>
                            Estoque
                        <td>
                            
                <tbody>
                    $forall (Entity pid produto) <- produtos
                        <tr>
                            <td> 
                                <a href=@{PerfilProdR pid}> 
                                    #{produtoNome produto}
                            <td>
                                #{produtoPreco produto}
                            <td>
                                #{produtoEstoque produto}
                            <td>
                                <form action=@{ApagarProdR pid} method=post>
                                    <input type="submit" value="Apagar">
                        
                        
        |]

getPerfilProdR :: ProdutoId -> Handler Html
getPerfilProdR pid = do
    produto <- runDB $ get404 pid
    defaultLayout $ do 
        [whamlet|
            <h1> Produto #{produtoNome produto}
            <h2> Estoque #{produtoEstoque produto}
            <h2> Preco #{produtoPreco produto}
        |]
        
postApagarProdR :: ProdutoId -> Handler Html
postApagarProdR pid = do 
    _ <- runDB $ get404 pid
    runDB $ delete pid 
    redirect ListaProdutoR