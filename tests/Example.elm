module Example exposing (suite)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)


suite : Test
suite =
    describe "Some Suite"
        [ test "String.toLower a known string" <|
            \_ ->
                Expect.equal
                    "abc"
                    (String.toLower "ABC")
        ]
