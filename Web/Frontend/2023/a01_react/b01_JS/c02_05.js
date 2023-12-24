const arr = ['one', 'two', 'three'];
const obj = { dOne: "a", dTwo: "b", dThree: "c" };

/** 
 * 비효율적인 변수 데이터 삽입
 * 
 * [ before ]
 * 
 */
let aOne = arr[0];
let aTwo = arr[1];
let aThree = arr[2];

console.log(aOne, aTwo, aThree);

/**
 * 비구조화 할당 (Array)
 * 
 * [ after-1 ]
 * 
 */

let [bOne, bTwo, bThree] = arr; // 비 구조화 할당

console.log(bOne, bTwo, bThree);

/**
 * 선언 분리 비구조화 할당 (Array)
 * 
 * [ after-2 ]
 * 
 */

let [cOne, cTwo, cThree, cFour] = ['one', 'two', 'three'];

console.log(cOne, cTwo, cThree, cFour);

/**
 * 비구조화 할당 (Object)
 * 
 * 단점: 키가 변수명이 된다.
 */

let { dOne, dTwo, dThree } = obj;

console.log(dOne, dTwo, dThree)

/**
 * 비구조화 할당 (Object)
 * 
 * 단점: 키에 이름을 지정해 그걸 쓸수있게 해준다.
 */

let { dOne: d1, dTwo: d2, dThree: d3 } = obj;

console.log(d1, d2, d3)