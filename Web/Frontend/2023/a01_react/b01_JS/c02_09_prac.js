/**
 * Created at. 2023-12-30
 * 
 * Async & Await Practice
 * 
 */

/**
 * 
 * @param {*} a 
 * @param {*} b 
 * @returns 
 */
function taskAdd(a, b) {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve(a + b);
        }, 1000);
    });
}

function taskSub(result) {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve(result - 1);
        }, 2000);
    });
}

function taskMulti(result) {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve(result * 2);
        }, 3000);
    });
}

/**
 * Async & Await을 사용하지 않고 then으로만 했을때
 */
function mainOld() {
    taskAdd(1, 2)
        .then((result) => {
            console.log(`taskAdd: ${result}`);
    
            return taskSub(result);
        })
        .then((result) => {
            console.log(`taskSub: ${result}`);
    
            return taskMulti(result);
        })
        .then((result) => {
            console.log(`taskMulti: ${result}`);
        })
        .catch((error) => {
            console.log(`Reject: ${error}`);
        })
}

/**
 * Async & Await을 사용하여 간결해짐
 */
async function mainNew() {
    const resultAdd = await taskAdd(3, 6);
    console.log(`result ADD: ${resultAdd}`);

    const resultSub = await taskSub(resultAdd);
    console.log(`result SUB: ${resultSub}`);

    const resultMulti = await taskMulti(resultSub);
    console.log(`result Multi: ${resultMulti}`);
}

mainOld();