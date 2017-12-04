{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}

module Handler.Fornecedor where

import Control.Monad
import Import
import Network.HTTP.Types.Status
import Database.Persist.Postgresql

postFornecedorR :: Handler Html 
postFornecedorR = do 
    ((resultado,_),_) <- runFormPost formFornec
    case resultado of 
        FormSuccess fornecedor -> do 
            pid <- runDB $ insert fornecedor
            redirect (PerfilFornecR pid)
        _ -> redirect HomeR
        
postApagarFornecR :: FornecedorId -> Handler Html
postApagarFornecR pid = do 
    _ <- runDB $ get404 pid
    runDB $ delete pid 
    redirect ListaFornecedorR
    
getListaFornecedorR :: Handler Html
getListaFornecedorR = do 
    fornecedor <- runDB $ selectList [] [Asc FornecedorNome]
    defaultLayout $ do 
        [whamlet|
            <table>
                <thead>
                    <tr>
                        <td> 
                            Nome
                        <td>
                            Telefone
                        <td>
                            Email
                        <td>
                            
                <tbody>
                    $forall (Entity pid fornecedor) <- fornecedores
                        <tr>
                            <td> 
                                <a href=@{PerfilFornecR pid}> 
                                    #{fornecedorNome fornecedor}
                            <td>
                                #{produtoTelefone fornecedor}
                            <td>
                                #{produtoEmail fornecedor}
                            <td>
                                <form action=@{ApagarFornecR pid} method=post>
                                    <input type="submit" value="Apagar">
                        
                        
        |]