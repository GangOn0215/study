// 비동기 예시
function taskA() {
    setTimeout(() => {
        console.log('A Task End');
    }, 2000);
}

function taskB() {
    setTimeout(() => {
        console.log('B Task End');
    }, 5000);
}

function taskC() {
    setTimeout(() => {
        console.log('C Task End');
    }, 1000);
}

taskA();
taskB();
taskC();

// callback 으로 활용
function taskD(a, b, callback) {
    setTimeout(() => {
        const result = a + b;

        callback(result);
    }, 3000)
}

taskD(3, 4, (result) => {
    console.log("D Task Result: ", result);
});

