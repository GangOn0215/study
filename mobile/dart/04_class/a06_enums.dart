enum Team {
  red,
  blue,
  green,
  yellow,
}

class Player {
  late final String name;
  late final Team team;
  late final int xp, age;

  Player({required String name, required int xp, required int age, required Team team}) {
    this.name = name;
    this.xp = xp;
    this.age = age;
    this.team = team;
  }

  sayHello() {
    print("Hello, $name! You are in the $team with $xp XP and age $age.");
  }
}

void main() {
  var player = Player(name: 'Jhyunho', xp: 1000, age: 25, team: Team.green);
  player.sayHello();

}
