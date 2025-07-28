void main() {
  bool giveMeFive = true;

  List<int> numbers = [1, 2, 3, 4, if (giveMeFive) 5];

  /**
   *    [[  Collection if ]] 문법을 사용하여 리스트에 조건부로 요소를 추가할 수 있습니다.
   * 
   *    만약 giveMeFive가 true라면 5가 추가되고, false라면 추가되지 않음
   *    리스트 안에 if 조건문을 사용하여 5를 추가할지 결정
   */
  print(numbers);
}
