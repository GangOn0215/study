import { useState } from "react";

function A08Toggle() {
    const [isOn, setIsOn] = useState(false);

    return (
        <div>
            <p>상태: { isOn ? '🟢 On' : '🔴 Off' }</p>
            <button onClick={() => setIsOn(!isOn)}>
                {isOn ? 'Off' : 'On'}
            </button>
        </div>
    )
}

export default A08Toggle;