module Actions exposing (..)

import Json.Encode as Encode exposing (Value)
import Json.Decode as Decode exposing (Decoder)
import Model exposing (..)
import Helpers exposing (updateAndSend, doNothing)


type Msg
    = NoOp
    | ChangeName String
    | ToggleGreeting


toMsg : String -> Decoder Msg
toMsg action =
    case action of
        "ChangeName" ->
            Decode.map ChangeName (Decode.field "payload" Decode.string)

        "ToggleGreeting" ->
            Decode.succeed ToggleGreeting

        _ ->
            Decode.fail "Invalid Action"


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        ChangeName name ->
            updateAndSend
                { model | name = name }

        ToggleGreeting ->
            case model.greetings of
                head :: rest ->
                    updateAndSend
                        { model | greeting = head, greetings = List.concat [ rest, [ model.greeting ] ] }

                _ ->
                    doNothing model
