// isPositive 함수, 

/**
 * 문제.
 * 
 * isPositive 함수에 매개변수가 number, resolve, reject 가 있으며 
 * 
 * number 매개변수의 반환값이 number 이라면 resolve 아니면 reject 를 callback으로 넘기며 
 * resolve에는 number가 0보다 크면 양수 아니면 음수의 문자열을 넘겨줌
 */

/**
 * 
 * @param {number} number 
 * @param {callback} resolve 
 * @param {callback} reject 
 */

function isPositive(number, resolve, reject) {
    setTimeout(() => {
        if(typeof number === 'number') {
            resolve(number >= 0 ? '양수' : '음수');
        } else {
            reject('숫자형이 아님');
        }
    }, 2000);
}

isPositive(
    [], // 첫번재 인자
    (result) => { // 두번째 인자 (resolve callback)
        console.log(`success: ${result}`);
    }, 
    (err) => { // 세번째 인자 (reject callback)
        console.log(`error: ${err}`);
    }
);

/**
 * 
 * @param {number} number 
 * @returns {Promise}
 */
function isPositiveP(number) {
    const executor = (resolve, reject) => {
        setTimeout(() => {
            if(typeof number === 'number') {
                resolve(number >= 0 ? '양수' : '음수');
            } else {
                reject('숫자형이 아님');
            }
        }, 2000);
    }

    const asyncPromise = new Promise(executor);

    return asyncPromise;

    /** 축약형 */
    /*
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            if(typeof number === 'number') {
                resolve(number >= 0 ? '양수' : '음수');
            } else {
                reject('숫자형이 아님');
            }
        }, 2000);
    });
    */
}

const res = isPositiveP(10);

res
    .then((result) => {
        console.log(result)
    })
    .catch((error) => {
        console.log(error);
    });