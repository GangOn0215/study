function test(a, b, callback) {
    console.log('test func');
    console.log(callback(a, b));
}

function commonAddFunc(a, b) {
    console.log('commonAdd');
    return a + b;
}

function commonInit() {
    const data = {
        'result': true,
        'age': 28,
        'gender': 'man'
    }

    return data;
}

test(1, 2, commonInit);