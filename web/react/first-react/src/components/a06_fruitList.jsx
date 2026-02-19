function A06FruitList({fruits}) {
    return fruits.map((fruit) => (
        <p key={fruit.id}>
            {fruit.emoji} {fruit.name}
        </p>
    ))
}

export default A06FruitList;