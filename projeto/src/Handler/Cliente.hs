{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}

module Handler.Cliente where

import Import
import Database.Persist.Postgresql

postClienteR :: Handler TypedContent
postClienteR = do
    cli <- requireJsonBody :: Handler Cliente
    cliid <- runDB $ insert cli
    sendStatusJSON created201 (object ["resp" .= (fromSqlKey cliid)])

getBuscaCliR :: ClienteId -> Handler TypedContent
getBuscaCliR cid = do 
    cliente <- runDB $ get404 cid
    sendStatusJSON ok200 (object ["resp" .= toJSON cliente])

getEmailCliR :: Text -> Handler TypedContent
getEmailCliR email = do
    talvezCliente <- runDB $ getBy (UniqueEmail email)
    case talvezCliente of
        Nothing -> sendStatusJSON notFound404 (object ["resp" .= ("ERRO " ++ show email ++ " NAO ENCONTRADO")])
        Just cliente -> sendStatusJSON ok200 (object ["resp" .= toJSON cliente])

