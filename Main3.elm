module Main3 exposing (..)

import Html exposing (Html, div, text, table, col, td, tr, ul, li)
import Html.Attributes exposing (..  )
import Basics.Extra exposing ((=>))
import Html.App
import Mouse
import Keyboard
import String exposing (concat)
import Debug
import Dict

-- MODEL


type alias Model =
    {
    x : Int
    ,y : Int
    }

sudokuPuzzle = [("id1","text 1"), ("id2","text 2")]
sList = ["first", "second", "third"]

init : ( Model, Cmd Msg )
init =
    ( {x = 0, y = 0 }, Cmd.none )



-- MESSAGES


type Msg
    = MouseMsg Mouse.Position
    | KeyMsg Keyboard.KeyCode



-- VIEW

view : Model -> Html Msg
view model =
    div [][ text (concat ["x=",(toString model.x)," ","y=",(toString model.y)])
    ,(renderList sudokuPuzzle)
    ,xxx
     ]

xxx lst =
    List.map (\(i, t) -> div [id i] [text t])  lst


renderList lst =
    tr [] (renderRows lst)

renderRows mylst = 
        List.map (\(i, t) -> td [id i] [ text t ]) mylst

-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MouseMsg position ->
            ( { x=position.x ,y=(Debug.log "y" position.y) }, Cmd.none )

        KeyMsg code ->
            ( { x= model.x + 2 , y = model.y  + 3}, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Mouse.clicks MouseMsg
        , Keyboard.downs KeyMsg
        ]



-- MAIN


main : Program Never
main =
    Html.App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
