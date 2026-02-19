function A05UserCard({ name, age, isPremium}) {
    return (
        <>
            <div>
                <span>{isPremium ? '⭐' : ''} </span>
                <span>My Name [ {name} ] & </span>
                <span>Age [ {age} ] is [[ { age < 18 ? 'Minor' : 'Adult' } ]] </span>
            </div>
            <br />
        </>
    );
}

export default A05UserCard;