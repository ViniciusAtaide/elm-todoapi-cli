module Models.Todo exposing (..)

import Graphql.SelectionSet as SelectionSet exposing (SelectionSet)
import TodoApi.Object
import TodoApi.Object.Todo as Todo


type alias Todo =
    { id : Int
    , title : String
    }


todoSelection : SelectionSet Todo TodoApi.Object.Todo
todoSelection =
    SelectionSet.map2 Todo Todo.id Todo.title
