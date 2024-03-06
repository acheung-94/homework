console.log("Hello from the console!");

// Your code here

let getQuery = fetch('https://api.openweathermap.org/data/2.5/weather?q=London,UK&appid=bcb83c4b54aee8418983c2aff3073b3b')
getQuery.then( (response) => {
    if (response.ok) {
        return response.json()
    }else{
        throw new Error(response)
    }
}).then( (data) => {
    console.log(`Success! Here's the weather data`)
    console.log(data)
}).catch( (error) => {
    console.log(`Failure!`)
    console.log(error)
})

console.log(`The AJAX request has been dispatched.`)