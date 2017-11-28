module Aula10 where

-- Kind * -> * , polimorfico, tem 1 campo, tipo a
--data Identity a= Identity a
--        deriving Show
--instance Functor Identity where
--fmap ab (Identity a) = Identity (ab a)


-- Kind * -> * , polimorfico, tem 1 campo, tipo a
data Id a = Id a
        deriving Show
        
instance Functor Id where
fmap ab (Id a) = Id (ab a)

-- Função que troca o Funtor
f :: Id a-> [] a
f (Id x) = [x]

h :: [] a -> Id a
h xs = Id (head xs)

-- Monada (Monad) : é a tripla (m, return,join), onde m é um tipo de kind * -> * (2) e functor
-- return é uma transformação natural (ele troca o functor) de tipo return :: Id a -> m a (troca Id por m)
-- join é uma transformação natural de tipo join :: m(m a) -> m a (troca m m por m)

-- Uma monada  é um monoid na caregoria dos (endo)funtores (de hask).

-- No haskell a classe onad (de kind (* -> *) -> () )

-- class Monad a where
-- return :: a -> m a
-- (>> =) :: m a -> (a -> m b) -> mb

g :: Int -> Maybe Int
g z = do
    x <- Just z
    y <- Just (x+1)
    return (x*y)
