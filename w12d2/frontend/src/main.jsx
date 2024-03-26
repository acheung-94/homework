import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.jsx'
import './index.css'
import configureStore from './store/store.js'
import { Provider } from 'react-redux'
import { restoreSession } from './utils/csrfUtils.js'

const initializeApp = () => {
  const store = configureStore()
  //testing purposes only! REMOVE ME!!!
  window.store = store
  //
   
  ReactDOM.createRoot(document.getElementById('root')).render(
  
    <React.StrictMode>
      <Provider store = {store}>
        <App />
      </Provider>
    </React.StrictMode>,
  )
  
}

restoreSession().then(initializeApp)