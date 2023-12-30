/**
 * Created At. 2023-12-30
 * 
 * Async & Await
 * 
 */

/**
 * 
 * @param {number} ms 
 * @returns 
 */
function delay(ms) {
    return new Promise((reslove) => {
        setTimeout(reslove, ms);
    });
}

/**
 * 
 * @returns { Promise<string> }
 */
async function helloAsync() {
    const a = await delay(3000);

    return "hello";
}

async function main() {
    const result = await helloAsync();

    console.log(result);
}

main();
// helloAsync();