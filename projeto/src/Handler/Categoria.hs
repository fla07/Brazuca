{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
-- | Common handler functions.
module Handler.Categoria where

import Import
import Database.Persist.Postgresql

formCat :: Form Categoria 
formCat = renderDivs $ Categoria 
    <$> areq textField "Nome: " Nothing
    <*> areq textField "Descricao: " Nothing
    
postCategoriaR :: Handler Html 
postCategoriaR = do 
    ((resultado,_),_) <- runFormPost formCat
    case resultado of 
        FormSuccess categoria -> do 
            pid <- runDB $ insert categoria
            redirect (PerfilCatR pid)
        _ -> redirect HomeR
        
getCategoriaR :: Handler Html
getCategoriaR = do 
    (widget,enctype) <- generateFormPost formCat
    defaultLayout $ do 
        [whamlet|
            <form action=@{CategoriaR} method=post>
                ^{widget}
                <input type="submit" value="Cadastrar">
        |]
        
postApagarCatR :: CategoriaId -> Handler Html
postApagarCatR pid = do 
    _ <- runDB $ get404 pid
    runDB $ delete pid 
    redirect ListaCategoriaR
    
getPerfilCatR :: CategoriaId -> Handler Html
getPerfilCatR pid = do
    categoria <- runDB $ get404 pid
    defaultLayout $ do 
        [whamlet|
            <h1> Nome #{categoriaNome categoria}
            <h2> Descricao #{categoriaDescricao categoria}
        |]
        
getListaCategoriaR :: Handler Html
getListaCategoriaR = do 
    categoria <- runDB $ selectList [] [Asc CategoriaNome]
    defaultLayout $ do 
        [whamlet|
            <table>
                <thead>
                    <tr>
                        <td> 
                            Nome
                        <td>
                            Descricao
                        <td>
                            
                <tbody>
                    $forall (Entity pid categoria) <- categorias
                        <tr>
                            <td> 
                                <a href=@{PerfilCatR pid}> 
                                #{categoriarNome categoria}
                            <td>
                                #{categoriaDescricao categoria}
                            <td>
                                <form action=@{ApagarCatR pid} method=post>
                                    <input type="submit" value="Apagar">
                        
                        
        |]