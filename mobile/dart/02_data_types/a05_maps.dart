void main() {
  /**
   *  Map은 키와 값의 쌍으로 이루어진 컬렉션입니다.
   *  Map은 키를 통해 값을 빠르게 찾을 수 있습니다.
   *  Map은 순서가 없기 때문에 인덱스로 접근할 수 없습니다.
   */

  // 기본 형
  Map<String, Object> player = {'name': 'cookie', 'xp': 1, 'level': 3};

  // List로 Map 만들기
  List<Map<String, Object>> players = [
    {'name': 'cookie', 'xp': 1, 'level': 3},
    {'name': 'choco', 'xp': 2, 'level': 4},
    {'name': 'milk', 'xp': 3, 'level': 5},
  ];

  print(player);
  print(players);
}
