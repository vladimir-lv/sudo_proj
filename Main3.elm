module Main3 exposing (..)

import Html exposing (Html, div, text, table, col, td, tr, ul, li)
import Html.Attributes exposing (..)
import Basics.Extra exposing ((=>))
import Mouse
import Keyboard
import String exposing (concat)
import Debug
import Dict


-- MODEL


type alias Model =
    { x : Int
    , y : Int
    }


sudokuPuzzle : List ( String, String )
sudokuPuzzle =
    [ ( "1", "text 1" ), ( "2", "text 2" ), ( "3", "text 3" ), ( "4", "text 4" ), ( "5", "text 5" ), ( "6", "text 6" ) ]


sList : List String
sList =
    [ "first", "second", "third" ]


init : ( Model, Cmd Msg )
init =
    ( { x = 0, y = 0 }, Cmd.none )



-- MESSAGES


type Msg
    = MouseMsg Mouse.Position
    | KeyMsg Keyboard.KeyCode



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text (concat [ "x=", (toString model.x), " ", "y=", (toString model.y) ])
        , renderList sudokuPuzzle
          -- ,xxx
        ]


xxx lst =
    List.map (\( i, t ) -> div [ id i ] [ text t ]) lst


toint : String -> Int
toint str =
    case String.toInt str of
        Ok value ->
            value

        _ ->
            1


renderList : List ( String, String ) -> Html Msg
renderList lst =
    tr []
        (List.map
            (\( i, t ) ->
                if rem (toint i) 3 == 0 then
                    td [ id i ] [ text t ]
                else
                    td [ id "z" ] [ text t ]
            )
            lst
        )



--renderTable lst =
--    List.map(\(i,t) -> )
-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MouseMsg position ->
            ( { x = position.x, y = (Debug.log "y" position.y) }, Cmd.none )

        KeyMsg code ->
            ( { x = model.x + 2, y = model.y + 3 }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Mouse.clicks MouseMsg
        , Keyboard.downs KeyMsg
        ]



-- MAIN


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
