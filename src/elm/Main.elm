port module Main exposing (..)

import Platform
import Json.Encode as Encode exposing (Value)
import Json.Decode as Decode exposing (Decoder)
import Model exposing (..)
import Ports
import Actions exposing (..)


main : Program () Model Msg
main =
    Platform.worker
        { init = init
        , update = update
        , subscriptions = subscriptions
        }


actionDecoder : Decoder Msg
actionDecoder =
    Decode.field "type" Decode.string
        |> Decode.andThen toMsg


init : () -> ( Model, Cmd Msg )
init _ =
    let
        model =
            { greeting = "Hello", greetings = [ "Hi", "Hey" ], name = "Gergo" }
    in
        ( model
        , (Ports.toReact << encodeModel) model
        )


actionToMsg : Value -> Msg
actionToMsg value =
    case Decode.decodeValue actionDecoder value of
        Ok action ->
            action

        Err _ ->
            NoOp


subscriptions : Model -> Sub Msg
subscriptions model =
    Ports.dispatch actionToMsg
