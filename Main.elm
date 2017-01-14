module Main exposing (..)

import Html
import List.Extra


type Cell
    = Empty
    | Hint Int
    | Input Int


model : List (List (List (List Cell)))
model =
    [ [ [ [ Empty, Hint 4, Empty ], [ Empty, Hint 8, Empty ], [ Empty, Empty, Empty ] ]
      , [ [ Hint 6, Empty, Hint 7 ], [ Hint 4, Hint 3, Empty ], [ Empty, Empty, Empty ] ]
      , [ [ Hint 3, Empty, Empty ], [ Hint 7, Hint 6, Empty ], [ Empty, Hint 9, Empty ] ]
      ]
    , [ [ [ Hint 1, Hint 9, Empty ], [ Empty, Empty, Empty ], [ Empty, Hint 8, Empty ] ]
      , [ [ Empty, Hint 6, Empty ], [ Empty, Empty, Empty ], [ Hint 9, Empty, Empty ] ]
      , [ [ Hint 4, Empty, Empty ], [ Hint 5, Empty, Empty ], [ Empty, Hint 6, Empty ] ]
      ]
    , [ [ [ Hint 2, Empty, Empty ], [ Hint 8, Empty, Hint 3 ], [ Hint 5, Empty, Empty ] ]
      , [ [ Empty, Empty, Empty ], [ Empty, Empty, Empty ], [ Hint 7, Empty, Hint 4 ] ]
      , [ [ Empty, Empty, Empty ], [ Empty, Empty, Empty ], [ Empty, Empty, Hint 9 ] ]
      ]
    ]


main : Html.Html msg
main =
    model
        |> List.concatMap
            (List.map
                (List.concatMap
                    (List.map
                        (toString
                            >> Html.text
                            >> List.Extra.singleton
                            >> Html.td []
                        )
                    )
                    >> Html.tr []
                )
            )
        |> Html.table []
