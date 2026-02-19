import { useState } from "react";

function A07Counter() {
    const [count, setCount] = useState(0)

    return (
        <div>
            <p>Now Counter : {count}</p>
            <button onClick={() => setCount(count + 1)}> +1 </button>
            <button onClick={() => setCount(count - 1)}> -1 </button>
            <button onClick={() => setCount(0)}> reset </button>
        </div>
    )
}

export default A07Counter;