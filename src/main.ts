import './style.css'
// @ts-ignore
import { Elm } from './Main.elm'

Elm.Main.init({
  node: document.getElementById('app'),
})