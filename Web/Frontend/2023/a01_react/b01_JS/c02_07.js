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

// taskA();
// taskB();
// taskC();

// callback 으로 활용
function taskD(a, b, callback) {
    setTimeout(() => {
        const result = a + b;

        callback(result);
    }, 3000)
}

taskD(3, 4, (result) => {
    // console.log("D Task Result: ", result);
});

// 비동기 심화

/**
 * @param {int} a 
 * @param {int} b 
 * @param {callback} callback 
 */
function taskAdd(a, b, callback) {
    setTimeout(() => {
        // 2. a + b 를 result 변수에 넣어준다.
        const result = a + b; 

        // 4. callback
        callback(result); 
    }, 2000); // 3. 2초 뒤 실행 할 코드
}

/**
 * @param {int} res 
 * @param {callback} callback 
 */
function taskMultiple(res, callback) {
    setTimeout(() => {
        callback(res * 1.5);  // 8. 콜백으로 곱하여 넘겨줌
    }, 5000); // 7. 5초 뒤 실행 할 코드
}

/**
 * @param {int} res 
 * @param {callback} callback 
 */
function taskDivide(res, callback) {
    setTimeout(() => {
        callback(res / 2);
    }, 1000); // 1 초 뒤 실행 할 코드
}

/**
 * @param {int} a 
 * @param {int} b 
 */
function taskProcess(a, b) {
    // 1. taskAdd 함수 호출, argument(인자) 는 1, 2, 익명함수
    taskAdd(a, b, (res1) => {
        console.log(`TaskAdd Result : ${res1}`); // 5. 결과 출력
        
        // 6. multiple 함수 실행
        taskMultiple(res1, (res2) => {
            console.log(`TaskMultiple Result : ${res2}`); // 9. 결과 출력

            // 10. divide 함수 호출
            taskDivide(res2, (res3) => {
                console.log(`TaskDivide Result : ${res3}`);
            });
        });
    });
}

taskProcess(1, 3);