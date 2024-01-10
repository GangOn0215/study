enum Team { red, blue }

class Player {
  final String name;
  int xp, age;
  Team team;

  Player({
    required this.name,
    required this.xp,
    required this.age,
    required this.team,
  });

  Player.createBluePlayer({
    required String name,
    required int age,
  })  : this.age = age,
        this.name = name,
        this.team = Team.blue,
        this.xp = 0;

  Player.createRedPlayer({
    required String name,
    required int age,
  })  : this.age = age,
        this.name = name,
        this.team = Team.red,
        this.xp = 0;

  void sayHello() {
    var name = 'aa';

    print("Hi my name is ${this.name}, my Team is ${this.team}");
  }
}

void main() {
  var player = Player(
    name: 'coxe',
    age: 29,
    team: Team.blue,
    xp: 0,
  );

  player.sayHello();
}
