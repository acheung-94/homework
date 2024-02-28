// const alert = function(){
//     console.log(`HAMMERTIME!!!!`);
// }

// window.setTimeout(alert, 5000)

// function hammerTime(time){
//     window.setTimeout(function(){
//         console.log(`${time} is hammertime!`)
//     }, 5000)
//     console.log(`what time is it?`)
// }
// hammerTime('8:37 pm')

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits (){
    let teaAnswer, biscuitAnswer;

    reader.question('Do you want tea?', function(teaAnswer){
        const first = teaAnswer === 'yes' ? 'do' : 'do not'
        console.log(teaAnswer);
        reader.question('Do you want biscuits?', function(biscAnswer){
            const second = (biscAnswer === 'yes') ? 'do' : 'do not'
            console.log(`So you ${first} want tea and definitely ${second} want biscuits.`);
            reader.close();
        })
        console.log(`Async tea!`)
    })   
}

teaAndBiscuits()