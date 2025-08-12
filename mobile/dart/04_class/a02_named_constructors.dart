// 클래스에서 변수는 반드시 자료형을 적어줘야함
class Player {
  late final String name;
  late final String team;
  late final int xp, age;

  Player({required String name, required int xp, required int age, required String team}) {
    this.name = name;
    this.xp = xp;
    this.age = age;
    this.team = team;
  }

  Player.createBluePlayer({required String name, required int age})
    : this.name = name,
      this.age = age,
      this.team = 'Blue Team',
      this.xp = 0;

  Player.createRedPlayer({required String name, required int age})
    : this.name = name,
      this.age = age,
      this.team = 'Red Team',
      this.xp = 0;

  sayHello() {
    print("Hello, $name! You are in the $team with $xp XP and age $age.");
  }
}

void main() {
  Player player = Player(name: 'Jhyunho', xp: 1000, age: 25, team: 'Green Team');
  player.sayHello();

  Player bluePlayer = Player.createBluePlayer(name: 'Alice', age: 22);
  bluePlayer.sayHello();

  Player redPlayer = Player.createRedPlayer(name: 'Bob', age: 24);
  redPlayer.sayHello();
}
