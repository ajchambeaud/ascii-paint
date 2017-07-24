module Main exposing (..)

import Color
import Element exposing (..)
import Element.Attributes exposing (..)
import Html exposing (Html)
import Html.Attributes as Attr
import Style exposing (..)
import Style.Color as Color
import Style.Font as Font
import Style.Shadow as Shadow


{-| A synonym for creating tuples. This will be included in the standard library soon.
1 => 2 == (1, 2)
-}
(=>) : a -> b -> ( a, b )
(=>) =
    (,)



---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


type Styles
    = None
    | Header
    | Logo
    | Title
    | Toolbar
    | Editor
    | BottomToolbar


stylesheet : StyleSheet Styles variation
stylesheet =
    Style.stylesheet
        [ style None []
          -- It's handy to have a blank style
        , style Header
            [ Color.text Color.white
            , Color.background Color.black
            ]
        , style Logo
            [ Font.size 26
            , Font.typeface [ "helvetica", "arial", "sans-serif" ]
            ]
        , style Title
            [ Font.size 20
            , Font.typeface [ "helvetica", "arial", "sans-serif" ]
            ]
        , style Toolbar
            [ Color.text Color.black
            , Color.background Color.lightGray
            ]
        , style Editor
            [ Color.text Color.white
            , Color.background Color.black
            , Shadow.simple
            , Font.typeface [ "Courier New", "arial", "sans-serif" ]
            ]
        , style BottomToolbar
            [ Color.background Color.lightGray
            , Color.border Color.darkGray
            , Font.size 26
            , Font.center
            ]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    Element.root stylesheet <|
        column None
            []
            [ navigation
            , container
            , row None
                [ center, paddingTop 50, paddingLeft 70, paddingRight 70, spacing 20 ]
                [ bottomToolBar ]
            ]


navigation : Element Styles variation msg
navigation =
    row Header
        [ justify, height (px 80), paddingLeft 50, paddingRight 50 ]
        [ el Logo [ verticalCenter ] (text "# ASCII Paint")
        , el Title [ verticalCenter ] (text "Make ilustrations using ascii characters.")
        ]


container : Element Styles variation msg
container =
    row None
        [ justify, paddingTop 50, paddingLeft 70, paddingRight 70, spacing 20 ]
        [ toolBar
        , body
        , rightToolBar
        ]


toolBar : Element Styles variation msg
toolBar =
    grid None
        { columns = [ px 100, px 100 ]
        , rows =
            [ px 100
            , px 100
            , px 100
            , px 100
            ]
        }
        [ spacing 20 ]
        [ area
            { start = ( 0, 0 )
            , width = 1
            , height = 1
            }
            (html <| Html.button [] [ Html.img [ Attr.src "img/undo.png" ] [] ])
        , area
            { start = ( 1, 1 )
            , width = 1
            , height = 2
            }
            (html <| Html.button [] [ Html.img [ Attr.src "img/foward.png" ] [] ])
        , area
            { start = ( 2, 1 )
            , width = 2
            , height = 2
            }
            (html <| Html.button [] [ Html.img [ Attr.src "img/pencil.png" ] [] ])
        , area
            { start = ( 1, 0 )
            , width = 1
            , height = 1
            }
            (html <| Html.button [] [ Html.img [ Attr.src "img/bucket.png" ] [] ])
        , area
            { start = ( 2, 1 )
            , width = 2
            , height = 2
            }
            (html <| Html.button [] [ Html.img [ Attr.src "img/line.png" ] [] ])
        , area
            { start = ( 1, 0 )
            , width = 1
            , height = 1
            }
            (html <| Html.button [] [ Html.img [ Attr.src "img/rectangle.png" ] [] ])
        , area
            { start = ( 1, 0 )
            , width = 1
            , height = 1
            }
            (html <| Html.button [] [ Html.img [ Attr.src "img/eraser.png" ] [] ])
        , area
            { start = ( 1, 0 )
            , width = 1
            , height = 1
            }
            (html <| Html.button [] [ Html.img [ Attr.src "img/trash.png" ] [] ])
        ]


rightToolBar : Element Styles variation msg
rightToolBar =
    grid None
        { columns = [ px 100, px 100 ]
        , rows =
            [ px 100
            , px 100
            ]
        }
        [ spacing 20 ]
        [ area
            { start = ( 0, 0 )
            , width = 1
            , height = 1
            }
            (html <| Html.button [] [ Html.img [ Attr.src "img/copy.png" ] [] ])
        , area
            { start = ( 1, 1 )
            , width = 1
            , height = 2
            }
            (html <| Html.button [] [ Html.img [ Attr.src "img/save.png" ] [] ])
        ]


bottomToolBar : Element Styles variation msg
bottomToolBar =
    grid BottomToolbar
        { columns = [ px 50, px 50, px 50, px 50, px 50, px 50, px 50, px 50, px 50, px 50, px 50, px 50 ]
        , rows =
            [ px 50
            ]
        }
        [ spacing 20, padding 10 ]
        [ area
            { start = ( 0, 0 )
            , width = 1
            , height = 1
            }
            (html <| Html.input [ Attr.type_ "text", Attr.style [ ( "text-align", "center" ) ] ] [])
        , area
            { start = ( 0, 1 )
            , width = 1
            , height = 2
            }
            (html <| Html.button [] [ Html.text "." ])
        , area
            { start = ( 0, 2 )
            , width = 1
            , height = 1
            }
            (html <| Html.button [] [ Html.text "," ])
        , area
            { start = ( 0, 3 )
            , width = 1
            , height = 2
            }
            (html <| Html.button [] [ Html.text "!" ])
        , area
            { start = ( 0, 4 )
            , width = 1
            , height = 1
            }
            (html <| Html.button [] [ Html.text "@" ])
        , area
            { start = ( 0, 5 )
            , width = 1
            , height = 2
            }
            (html <| Html.button [] [ Html.text "#" ])
        , area
            { start = ( 0, 6 )
            , width = 1
            , height = 1
            }
            (html <| Html.button [] [ Html.text "$" ])
        , area
            { start = ( 0, 7 )
            , width = 1
            , height = 2
            }
            (html <| Html.button [] [ Html.text "%" ])
        , area
            { start = ( 0, 8 )
            , width = 1
            , height = 1
            }
            (html <| Html.button [] [ Html.text "^" ])
        , area
            { start = ( 0, 9 )
            , width = 1
            , height = 2
            }
            (html <| Html.button [] [ Html.text "&" ])
        , area
            { start = ( 0, 10 )
            , width = 1
            , height = 1
            }
            (html <| Html.button [] [ Html.text "*" ])
        , area
            { start = ( 0, 11 )
            , width = 1
            , height = 1
            }
            (html <| Html.button [] [ Html.text "+" ])
        ]


body : Element Styles variation msg
body =
    column Editor
        [ verticalCenter
        , width (px 800)
        , height (px 600)
        ]
        [ el None [ verticalCenter ] (text "TODO: Editor") ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
