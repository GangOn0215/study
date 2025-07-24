// dynamic

// dynamic은 어떤 타입이든 허용됨
// 하지만 타입 안정성이 떨어지므로 주의해서 사용해야 함

void main() {
  var name;

  name = 'Dart Dynamic';
  if (name is String) {
    // name. << name 이 String 타입일 때만 사용 가능한 메소드나 속성에 접근할 수 있음
    name.length; // 예: 문자열 길이
  }

  name = 10;
  if (name is int) {
    // name. << name 이 int 타입일 때만 사용 가능한 메소드나 속성에 접근할 수 있음
    name.isOdd; // 예: 홀수인지 확인
  }
}
