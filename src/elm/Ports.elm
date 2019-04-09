port module Ports exposing (..)

import Json.Encode exposing (Value)


port toReact : Value -> Cmd msg


port dispatch : (Value -> msg) -> Sub msg
