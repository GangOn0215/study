class Player {
  // 멤버변
  late final String name;
  late final int xp;
  late final String team;

  // fromJson 는 굉장히 많이 쓰이는 패턴 이라고 함. ( API에서 JSON 데이터를 받아올 때 )
  Player.fromJson(Map<String, dynamic> playerJson)
    : name = playerJson['name'],
      xp = playerJson['xp'],
      team = playerJson['team'];

  sayHello() {
    print("Hello, $name! You are in the $team with $xp XP.");
  }
}

void main() {
  var apiData = [
    {"name": "Jhyunho", "xp": 1000, "team": "green"},
    {"name": "Minji", "xp": 850, "team": "blue"},
    {"name": "Hana", "xp": 1200, "team": "red"},
    {"name": "Taeyang", "xp": 950, "team": "yellow"},
    {"name": "Sumin", "xp": 780, "team": "green"},
    {"name": "Ara", "xp": 890, "team": "red"},
  ];

  // API에서 받아온 JSON 데이터를 Player 객체로 변환
  apiData.forEach((playerJson) {
    // fromJson 생성자를 사용하여 JSON 데이터를 Player 객체로 변환
    Player player = Player.fromJson(playerJson);
    player.sayHello();
  });
}
