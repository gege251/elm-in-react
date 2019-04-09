module Model exposing (..)

import Json.Encode as Encode exposing (Value)


type alias Model =
    { greeting : String
    , name : String
    , greetings : List String
    }


encodeModel : Model -> Value
encodeModel model =
    Encode.object
        [ ( "greeting", Encode.string model.greeting )
        , ( "name", Encode.string model.name )
        ]
