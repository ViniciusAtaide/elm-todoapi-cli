module Model exposing (..)

import Graphql.Http
import Models.User exposing (User)
import RemoteData exposing (RemoteData)


type alias Response =
    Maybe User


type alias Model =
    RemoteData (Graphql.Http.Error Response) Response
