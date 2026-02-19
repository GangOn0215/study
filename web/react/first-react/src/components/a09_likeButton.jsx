import { useState } from "react";

function A09LikeButton() {
    const [like, setLike] = useState(0);
    function onLike() { setLike(like + 1 ) }
    function onUnlike() { 
        if(like > 0) { setLike(like - 1 ) }
    }
    return (
        <div>
            <p>Like: { like <= 0 ? '🤍' : `❤️ ${like}개` }</p>
            <button onClick={onLike}>
                Like
            </button>
            <button onClick={onUnlike}>
                DisLike
            </button>
        </div>
    )
}

export default A09LikeButton;