module Pages.Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (Model)
import Models.Todo exposing (Todo)
import Models.User exposing (User)
import Msg exposing (Msg)
import RemoteData exposing (RemoteData(..))


todoView : Todo -> Html Msg
todoView todo =
    div [] [ text <| "Título: " ++ todo.title ]


userView : User -> Html Msg
userView user =
    div
        []
        [ text <| "Nome: " ++ user.username
        , div [] <| List.map todoView user.todos
        ]


mainView : Model -> Html Msg
mainView model =
    case model of
        Loading ->
            text "Carregando"

        Success (Just user) ->
            div [] [ userView user ]

        Success Nothing ->
            div [] [ text "Nenhum Usuário" ]

        _ ->
            text "Sei lá"
