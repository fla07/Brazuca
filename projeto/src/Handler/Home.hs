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
            <h1> BEM-VINDO AO SISTEMA DE PRODUTOS
            <ul>
               <li> <a href=@{ProdutoR}> Cadastro de Produto
               <li> <a href=@{ListaProdutoR}> Listagem
        |]