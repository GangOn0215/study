/** 
 * 문제점
 */

let cookie = {};
let chocochipCookie = {};
let blueberryCookie = {};
let strawberryCookie = {};

/**
 * 아래의 toping이 올라간 친구들은 기존 cookie와 같은 base 같은 madeIn을 가진다.
 * 
 * 이 때 유용한 것이 spread operator (스프레드 연산자)
 */

cookie = {
    base: "cookie",
    madeIn : "korea"
}

chocochipCookie = {
    base: "cookie",
    madeIn : "korea",
    toping: "chocochip"
}

blueberryCookie = {
    base: "cookie",
    madeIn : "korea",
    toping: "blueberry"
}

strawberryCookie = {
    base: "cookie",
    madeIn : "korea",
    toping: "strawberry"
}

/**
 * spread operator 를 이용해 간단하게 배열을 쓸수있다
 */

chocochipCookie = {};
chocochipCookie = {
    ...cookie,
    toping: "chocochip"
}

blueberryCookie = {};
blueberryCookie = {
    ...cookie,
    toping: "blueberry"
}

strawberryCookie = {};
strawberryCookie = {
    ...cookie,
    toping: "strawberry"
}


/**
 * 강의와 별개로 조금 더 알아본 정보
 * 
 * 스프레드 연산자는 어떤 곳에서 유용하게 쓰일 수 있을까?
 * 
 * 1. 계약서 배열을 복사하고 싶을 때.
 */

let contractSoft = ['deatil', 'outSorcing'];
let contractDeep = [...contractSoft];
let contractDeepEC6 = [...contractSoft];


// 배열의 얕은 복사
let contractSoftCopy = contractSoft;
// 이런식으로 push 또는 pop을 했을때 원본 배열인 contact 에도 직접적인 값 변화가 일어납니다.
contractSoftCopy.push('bono');

contractSoftCopy; // [ 'detail', 'outSorcing', 'bono' ]


// ES5 시절 스프레드 연산자가 없을 때 방식
let contractDeepCopy = null;
contractDeepCopy = contractDeep.slice();

contractDeepCopy.push('deep-bono');

contractDeepCopy; // [ 'deatil', 'outSorcing', 'deep-bono' ]


// EC6 스프레드 연산자로 깊은 복사
let contractDeepEC6Copy = [...contractDeepEC6, 'deep-bono-ec6'];

console.log(contractDeepEC6Copy); // [ 'deatil', 'outSorcing', 'deep-bono-ec6' ]