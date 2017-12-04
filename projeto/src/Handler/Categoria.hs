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