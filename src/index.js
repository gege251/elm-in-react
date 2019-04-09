import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import registerServiceWorker from './registerServiceWorker';
import { Elm } from './elm/Main.elm'

const elm = Elm.Main.init()

elm.ports.toReact.subscribe(store => 
    ReactDOM.render(<App store={store} dispatch={elm.ports.dispatch.send} />, document.getElementById('root'))
)

registerServiceWorker();
