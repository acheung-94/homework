function titleize(array, callback){
    let newArray = array.map(name => `Mx. ${name} Jingleheimer Schmidt`); // OK THESE ARE BACKTICKS, NOT SINGLE QUOTES. FML.
    callback(newArray);
}
let printCallback = function(newarray){
    newarray.forEach((title) => {
        console.log(title);
    })
}

//titleize(["Mary", "Brian", "Leo"], printCallback);


class Elephant{
    constructor(name, height, tricksArray){
        this.name = name;
        this.height = height;
        this.tricksArray = tricksArray;
    }

    trumpet(){
        console.log(`${this.name} goes 'phrRRRRRR!!!!!!'`);
    }

    grow(){
        this.height += 12;
    }

    addTrick(trick){
        this.tricksArray.push(trick)
    }

    play(){
        let trick = this.tricksArray[Math.floor(Math.random() * this.tricksArray.length)]
        console.log(`${this.name} is ${trick}!`);
    }

}

let dumbo = new Elephant('Dumbo', 157, ['painting a picture','licking a seesaw','growing its toenails'])
let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah, dumbo];
Elephant.paradeHelper = function(elephant){
    console.log(`${elephant.play()}`);
}
// herd.forEach((elephant)=>{
//     Elephant.paradeHelper(elephant);
// })

function dinerBreakfast () {
    let order = "I'd like scrambled eggs and bacon please."

    return function(newFood){
        order = `${order.slice(0, order.length - 8)}, and ${newFood} please.`
        console.log(order);
    }
}

let hungry = dinerBreakfast();
hungry('waffles with strawberries and whipped cream')
hungry('french toast')
hungry('banana pancakes')
console.log( hungry('yogurt parfait'));

// ok the commas became a bit oppressive, i admit.