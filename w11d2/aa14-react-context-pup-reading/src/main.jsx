import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
import './index.css';
import PupProvider from './context/PupContext';

ReactDOM.createRoot(document.getElementById('root')).render(
  <PupProvider>
      <App />
  </PupProvider>
);
