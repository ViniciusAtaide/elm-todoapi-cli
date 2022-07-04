module Main exposing (main)

import Browser exposing (Document)
import Graphql.Http
import Graphql.Operation exposing (RootQuery)
import Graphql.SelectionSet as SelectionSet exposing (SelectionSet)
import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (Model)
import Models.User exposing (User, userSelection)
import Msg exposing (Msg(..))
import Pages.Main exposing (mainView)
import RemoteData
import TodoApi.Query as Query


query : SelectionSet (Maybe User) RootQuery
query =
    Query.user { id = 1 } userSelection


makeRequest : Cmd Msg
makeRequest =
    query
        |> Graphql.Http.queryRequest "http://localhost:3000/graphql"
        |> Graphql.Http.send (RemoteData.fromResult >> GotResponse)


type alias Flags =
    {}


init : Flags -> ( Model, Cmd Msg )
init _ =
    ( RemoteData.Loading
    , makeRequest
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Init ->
            ( RemoteData.NotAsked, Cmd.none )

        GotResponse response ->
            ( response, Cmd.none )


view : Model -> Document Msg
view model =
    { title = ""
    , body = [ mainView model ]
    }


main : Program Flags Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }
