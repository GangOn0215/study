void main() {
  /**
   *  Set은 중복된 값을 허용하지 않는 컬렉션입니다.
   * 
   *   Set을 사용하면 중복된 값을 자동으로 제거할 수 있습니다.
   *   Set은 순서가 없기 때문에 인덱스로 접근할 수 없습니다.
   *   Set은 중복된 값을 허용하지 않기 때문에, 같은 값을 여러 번 추가해도 한 번만 저장됩니다.
   */
  Set<int> numbers = {1, 2, 3, 4};

  numbers.add(1);
  numbers.add(1);
  numbers.add(1);
  numbers.add(1);

  print(numbers); // {1, 2, 3, 4} - 중복된 값은 추가되지 않음
}
