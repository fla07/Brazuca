sudo apt-get update
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:hvr/ghc
sudo apt-get update
sudo apt-get install -y cabal-install-1.22 ghc-7.10.3
cat >> ~/.bashrc <<EOF
export PATH="\$HOME/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.3/bin:\$PATH"
EOF
export PATH=~/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.3/bin:$PATH
ghci


:! clear = limpa
:l nomeArquivo.hs = load 
:r = reload
ctrl + c = para a aplicação

:m Control.Monad

Hello Word em Haskell

fla007:~/workspace (master) $ cd prgm/
fla007:~/workspace/prgm (master) $ ghc Main.hs
[1 of 1] Compiling Main             ( Main.hs, Main.o )
Linking Main ...
fla007:~/workspace/prgm (master) $ chmod 777 Main
fla007:~/workspace/prgm (master) $ ./Main
Hello Word