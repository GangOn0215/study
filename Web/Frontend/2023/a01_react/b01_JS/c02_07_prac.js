/**
 * 문제. 입력은 1 5 가 주어진다. 
 * 
 * 첫번째 함수는 곱하기
 * 두번째 함수는 빼기 2
 * 세번째 함수는 나누기 2 를 하여 출력 한다.
 * 
 * 첫번재 함수는 2초
 * 두번째 함수는 3초
 * 세번째 함수는 4초
 * 
 * 각반환값을 callback 으로 첫번째 > 두번째 > 세번째 함수 방향으로 흐른다.
 * 
 */

/**
 * 
 * @param {*} item 
 * @param {*} callback 
 */

function processA(a, b, callback) {
    setTimeout(()=> {
        const result = a * b;

        callback(result);
    }, 2000);
}

function processB(item, callback) {
    setTimeout(() => {
        const result = item - 2;

        callback(result);
    }, 3000);
}

function processC(item, callback) {
    setTimeout(() => {
        const result = item / 2;

        callback(result);
    }, 4000);
}


// Callback HELL
processA(2, 3, (resA) => {
    console.log(`processA: ${resA}`);

    processB(resA, (dataB) => {
        console.log(`processB: ${dataB}`);

        processC(dataB, (dataC) => {
            console.log(`processC: ${dataC}`);
        });
    });
});