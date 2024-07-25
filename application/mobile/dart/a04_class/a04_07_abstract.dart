// ignore_for_file: unused_local_variable

enum Team { red, blue, orange, yellow }

class Player {
  late String name;
  late Team team;
  late int age;
  late int xp;

  Player({
    required String name,
    required Team team,
    required int age,
    int xp = 0,
  }) {
    this.name = name;
    this.team = team;
    this.age = age;
    this.xp = xp;
  }

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
    String team = 'Red',
    int xp = 0,
  }) {
    this.name = name;
    this.team = Team.red;
    this.age = age;
    this.xp = xp;
  }

  void sayHello() {
    print('Hi my name is ${this.name}, my xp is ${this.xp}');
  }

  void sayMyTeam() {
    print('My team is ${this.team}');
  }
}

void main() {
  var player1 = Player(
    name: 'puppy',
    xp: 1000,
    team: Team.orange,
    age: 19,
  );

  player1.sayHello();
  player1.sayMyTeam();

  var bluePlayer1 = Player.createBluePlayer(
    name: 'blue_puppy',
    age: 29,
  );

  bluePlayer1.sayMyTeam();

  var redPlayer1 = Player.createRedPlayer(
    name: 'red_puppy',
    age: 27,
    xp: 2000,
  );

  redPlayer1.sayMyTeam();

  var bluePlayer2 = Player.createBluePlayer(name: 'blue_puppy_two', age: 22)
    ..name = 'blue_puppy_three'
    ..age = 23
    ..team = Team.yellow
    ..sayMyTeam();
}
