import Html exposing (Html, btn)
import Mouse
import Window
import Color exposing (..)
import Graphics.Element exposing (..)
import Graphics.Collage exposing (..)







style : List (String, String) -> Attribute msg

NStyle : Attribute msg
NStyle =
  style
    [("backgroundColor", "black"
   , ("height", "120px")
   , ("width" , "100%")
    ]

naming : Html msg
naming =
  div [ NStyle ] [ text "Nome:"]


pass : Html msg
pass =
  div [ NStyle ] [ text "Senha"]



SStyle : Attribute msg
SStyle =
  style
    [("backgroundColor", "blue"
   , ("height", "90px")
   , ("width" , "100%")
    ]

sucess : Html btn
sucess =
  div [ SStyle ] [ text "Login"]

ssucess : Element
ssucess =
 collage 300 300
 [makeSquare green 50]
makeSquare color size =
 filled color (square size)