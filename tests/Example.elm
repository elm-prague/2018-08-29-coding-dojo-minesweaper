module Example exposing (suite)

import Array
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)


fourByFourInput =
    [ "...."
    , "...."
    , "..**"
    , "..*."
    ]


oneByoneInput =
    [ "*" ]


oneBytwoInput =
    [ "**" ]


charAt : List String -> Int -> Int -> String
charAt field x y =
    let
        elemAt index list =
            list |> Array.fromList |> Array.get index
    in
    field
        |> elemAt y
        |> Maybe.map (String.slice x (x + 1))
        |> Maybe.withDefault "."


getOutput : List String -> Int -> Int -> String
getOutput field x y =
    case charAt field x y of
        "*" ->
            "*"

        _ ->
            getNeighbours x y
                |> List.map (\( a, b ) -> charAt field a b)
                |> List.filter (\a -> a == "*")
                |> List.length
                |> String.fromInt


neighbours =
    [ ( 0, -1 ), ( 1, -1 ), ( 1, 0 ), ( 1, 1 ), ( 0, 1 ), ( -1, 1 ), ( -1, 0 ), ( -1, -1 ) ]


getNeighbours x y =
    List.map (\( dx, dy ) -> ( x + dx, y + dy )) neighbours


suite : Test
suite =
    describe "Minesweeper"
        [ describe "getOutput"
            [ test "* for (2,2) in 4x4 input" <|
                \_ ->
                    Expect.equal
                        "*"
                        (getOutput fourByFourInput 2 2)
            , testOutputOnXY "4x4"
                fourByFourInput
                [ ( 0, 0, "0" )
                , ( 1, 1, "1" )
                , ( 1, 0, "0" )
                , ( 2, 1, "2" )
                , ( 2, 2, "*" )
                , ( 3, 2, "*" )
                , ( 3, 0, "0" )
                , ( 2, 0, "0" )
                , ( 0, 2, "0" )
                ]
            , testOutputOnXY "oneByoneInput"
                oneByoneInput
                [ ( 0, 0, "*" )
                ]
            , testOutputOnXY "oneBytwoInput"
                oneBytwoInput
                [ ( 0, 0, "*" )
                ]
            ]
        , describe "getNeighbours"
            [ test "(0,0)" <|
                \_ ->
                    Expect.equal
                        [ ( 0, -1 ), ( 1, -1 ), ( 1, 0 ), ( 1, 1 ), ( 0, 1 ), ( -1, 1 ), ( -1, 0 ), ( -1, -1 ) ]
                        (getNeighbours 0 0)
            , test "(10,10)" <|
                \_ ->
                    Expect.equal
                        [ ( 10, 9 )
                        , ( 11, 9 )
                        , ( 11, 10 )
                        , ( 11, 11 )
                        , ( 10, 11 )
                        , ( 9, 11 )
                        , ( 9, 10 )
                        , ( 9, 9 )
                        ]
                        (getNeighbours 10 10)
            ]
        ]


testOutputOnXY fieldName field cases =
    describe fieldName
        (List.map
            (\( x, y, output ) ->
                test
                    (output
                        ++ " for ("
                        ++ String.fromInt x
                        ++ ","
                        ++ String.fromInt y
                        ++ ")"
                    )
                <|
                    \_ ->
                        Expect.equal
                            output
                            (getOutput field x y)
            )
            cases
        )
