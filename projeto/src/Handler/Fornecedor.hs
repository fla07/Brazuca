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

formFornec :: Form Fornecedor 
formFornec = renderDivs $ Fornecedor 
    <$> areq textField "Nome: " Nothing
    <*> areq textField "Telefone: " Nothing 
    <*> areq textField "Email: " Nothing

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
        
getPerfilFornecR :: FornecedorId -> Handler Html
getPerfilFornecR pid = do
    fornecedor <- runDB $ get404 pid
    defaultLayout $ do 
        [whamlet|
            <h1> Nome #{fornecedorNome fornecedor}
            <h2> Telefone #{fornecedorTelefone fornecedor}
            <h2> Email #{fornecedorEmail fornecedor}
        |]
        
getFornecedorR :: Handler Html
getFornecedorR = do 
    (widget,enctype) <- generateFormPost formFornec
    defaultLayout $ do 
        [whamlet|
            <form action=@{FornecedorR} method=post>
                ^{widget}
                <input type="submit" value="Cadastrar">
        |]