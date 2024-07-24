/**
 * late variable
 *    - 선언 이후에 초기화되는 non-nullable 변수를 선언하는 것
 *    - 변수를 초기화를 지연하는 것
 * 
 * late 변수인 경우 보통은  api를 받아오거나 바로 초기화를 안하고 나중에 데이터를 넣어줘야하는 경우에
 * late 변수를 사용하게 된다
 */

void main() {
  late final String name;
  var a = 10;

  // do something, go to api

  name = 'puppy';

  print(a);

  // 만약 late 변수인데 나중에 초기화를 안해주면 에러를 뿜어냄
  print(name);
}
