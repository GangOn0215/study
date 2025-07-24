int fetchAPI() {
  return 1234;
}

void main() {
  const API = '1234';
  // const fetchAPI = fetchAPI(); // 이건 에러남

  print(API);

  final fetchVar = fetchAPI(); // 정상 작동

  print(fetchVar);
}
