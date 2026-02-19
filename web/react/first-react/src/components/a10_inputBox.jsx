import { useState } from "react";

function A10InputBox() {
    const [text, setText] = useState('');

    return (
        <div>
            <p>text: <strong>{text}</strong></p>
            <input 
                type="text" 
                onChange={(e) => setText(e.target.value)}
            />
        </div>
    )
}

export default A10InputBox;