module Helpers exposing (..)

import Model exposing (Model, encodeModel)
import Ports


updateAndSend : Model -> ( Model, Cmd msg )
updateAndSend newModel =
    ( newModel, (Ports.toReact << encodeModel) newModel )

doNothing : Model -> ( Model, Cmd msg)
doNothing model =
    ( model, Cmd.none )

