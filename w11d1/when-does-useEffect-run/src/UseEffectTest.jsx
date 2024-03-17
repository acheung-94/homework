import { useEffect } from "react";
import { useState } from "react";
const UseEffectTest = () => {
    const [toggleOne, setToggleOne] = useState(false)
    const [toggleTwo, setToggleTwo] = useState(false)
    const [count, setCount] = useState(0)

    useEffect(()=>{
        console.log(`useEffect1 Ran`)
    }, [])

    useEffect(()=>{
        console.log(`useEffect2 Ran`)
        {if (toggleTwo) console.log(`toggleTwo state is truthy`)}
    }, [toggleTwo])

    useEffect( () => {
        let countKey = setInterval( ()=>{
            console.log(`UseEffect 3 with interval number ${count} is running.`)
        }, 1000)

        return () => {
            console.log(`cleanup ran, interval # ${count} is being cleared out.`)
            clearInterval(countKey)
        }
    }, [count])

    return (
      <div>
        {console.log(`rendered or re-rendered`)}

        <h1>UseEffectTest Component</h1>
        <button onClick={()=> setToggleOne(!toggleOne)}>ToggleOne</button>
        <button onClick={()=> setToggleTwo(!toggleTwo)}>ToggleTwo</button>
        <button onClick={() => setCount(prevCount=> prevCount + 1 )}>Count</button>
      </div>
    );
  };
  
  export default UseEffectTest;