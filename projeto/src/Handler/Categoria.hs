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