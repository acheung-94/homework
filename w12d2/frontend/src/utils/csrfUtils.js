export const restoreSession = async () => { // returns a promise
    let res = await fetch('/api/session') //hit the session#show endpoint
    let token = res.headers.get('X-CSRF-Token') // get teh csrf token
    sessionStorage.setItem('X-CSRF-Token', token) // store csrf token in sessionStorage for access from other utils.
    let sessionData = await res.json()
    sessionStorage.setItem('currentUser', JSON.stringify(sessionData.user))
}

export const csrfFetch = async (url, options = {}) => {
    // set options.method to 'GET' if there is no method
    options.method = options.method || 'GET';
    // set options.headers to an empty object if there are no headers
    options.headers = options.headers || {};
  
    // if the options.method is not 'GET', then set the "Content-Type" header to
    // "application/json" and the "X-CSRF-Token" header to the value of the 
    // "X-CSRF-Token" cookie
    if (options.method.toUpperCase() !== 'GET') {
      options.headers['Content-Type'] =
        options.headers['Content-Type'] || 'application/json';
      options.headers['X-CSRF-Token'] = sessionStorage.getItem('X-CSRF-Token');
    }
  
    // call fetch with the url and the updated options hash
    const res = await fetch(url, options);
  
    // if the response status code is 400 or above, then throw an error with the
    // error being the response
    if (res.status >= 400) throw res;
  
    // if the response status code is under 400, then return the response to the
    // next promise chain
    return res;
  }