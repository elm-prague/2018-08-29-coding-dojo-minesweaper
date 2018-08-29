module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (Html)


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    {}


init : Model
init =
    {}



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> Model
update msg model =
    model



-- VIEW


view : Model -> Html Msg
view model =
    Html.div []
        [ Html.div [] [ Html.text "Hello!" ]
        ]
