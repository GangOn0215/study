String fetchApi() {
  return 'https://api.github.com';
}

/**
 * const 와 final의 차이
 * 
 * const는 컴파일 단계에서 알고있는 정보를 상수로 저장
 * ex) 앱스토어에 앱을 올리기전에 알고 있는 값
 * 
 * final 은 api로 받아온 데이터를 넣어줄수있음
 * 
 */

void main() {
  // const API = fetchApi();

  const max_allowed_price = 1000;

  print(max_allowed_price);
}
