import App from "../plugins/App.js";
import React from 'react'
import ReactDOM from 'react-dom'

if(document.querySelector('#explication')){
ReactDOM.render(
  <App />,
document.querySelector('#explication')
);
}
