module Main where

-- Monada IO


safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead xs = Just (head xs)

main :: IO ()
main = do
    putStrLn "Digite um nome"
    nome <- fmap safeHead getLine
    case nome of
        Nothing -> putStrLn "Erro!"
        (Just x) -> putStrLn $ "A letra é " ++ show x
    

--main :: IO ()
--main = putStrLn "Hello Word "

--main :: IO ()
--main = do
--    putStrLn "Digite um numero"
--    x <- readLn
--    putStrLn "Digite outro numero"
--    y <- readLn
--    putStrLn $ "A soma deu "  ++ show (x+y)
    
--main :: IO ()
--main = putStrLn "Digite seu nome" >> getLine >>= \x -> putStrLn ("Olá " ++ x)

--main :: IO ()
--main = do 
 --   putStrLn "Digite um nome"
 --   x <- getLine
 --   putStrLn ("Olá " ++ x)