/**
 * created date: 2023-12-29 19:30
 * 
 * 목표
 *  1. callback, 비동기 연습
 *  2. 비동기 promise 연습
 * 
 * 첫번째 프로그램은 숫자 양수를 받아서 더하기, 빼기, 곱하기를 해주는 프로그램
 * 
 * 두번째 프로그램은 위와 동일하며, 그것을 callback hell (콜백지옥) 이 아닌 promise로 해결하는 문제
 */


/**
 * @param {number} a 
 * @param {number} b 
 * @param {callback} callback 
 */

function taskAdd(a, b, callback) {
    setTimeout(() => {
        callback(a + b);
    }, 1000);
}

/**
 * @param {number} res 
 * @param {number} num 
 * @param {callback} callback 
 */
function taskSub(res, num, callback) {
    setTimeout(() => {
        callback(res - num);
    }, 2000);
}

/**
 * @param {number} res
 * @param {number} num
 * @param {*} callback 
 */
function taskMul(res, num, callback) {
    setTimeout(() => {
        callback(res * num);
    }, 3000);
}

taskAdd(2, 3, (result) => {
    console.log(`taskAdd: ${result}`);

    taskSub(result, 2, (result) => {
        console.log(`taskSub: ${result}`);

        taskMul(result, 4, (result) => {
            console.log(`taskMul: ${result}`);
        })
    });
});

/**
 * 이제 위에 애들을 Promise로 바꿀것입니다.
 */


/**
 * @param {number} a 
 * @param {number} b 
 * @param {callback} callback 
 * 
 * @returns {Promise}
 */

function promiseTaskAdd(a, b) {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            if(typeof a === 'number' && typeof b === 'number') {
                resolve(a + b);
            } else {
                reject('Not Number');
            }
        }, 1000);
    });
}

/**
 * @param {number} res 
 * @param {number} num 
 * @param {callback} callback 
 * 
 * @returns {Promise}
 */
function promiseTaskSub(res, num) {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            if(typeof res === 'number' && typeof num === 'number') {
                resolve(res - num);
            } else {
                reject('Not Number');
            }
        }, 2000);
    });
}

/**
 * @param {number} res
 * @param {number} num
 * @param {callback} callback 
 * 
 * @returns {Promise}
 */
function promiseTaskMul(res, num, callback) {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            if(typeof res === 'number' && typeof num === 'number') {
                resolve(res * num);
            } else {
                reject('Not Number');
            }
        }, 3000);
    });
}

promiseTaskAdd(1, 3)
    .then((result) => {
        console.log(`[ Success ] task A : ${result}`);

        return promiseTaskSub(result, 2);
    })
    .then((result) => {
        console.log(`[ Success ] task B: ${result}`);

        return promiseTaskMul(result, 4)
    })
    .then((result) => {
        console.log(`[ Success ] task C: ${result}`);
    })
    .catch((error) => {
        console.log(`[ ERROR ] : ${error}`);
    });

    