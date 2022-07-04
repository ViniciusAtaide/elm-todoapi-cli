module Models.User exposing (..)

import Graphql.SelectionSet as SelectionSet exposing (SelectionSet)
import Models.Todo exposing (Todo, todoSelection)
import TodoApi.Object
import TodoApi.Object.User as User


type alias User =
    { username : String
    , id : Int
    , todos : List Todo
    }


userSelection : SelectionSet User TodoApi.Object.User
userSelection =
    SelectionSet.map3 User
        User.username
        User.id
        (User.todos todoSelection)
