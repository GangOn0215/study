class Player {
  final String name;
  int xp, age;
  String team;

  // Player({required String name, required int xp}) {
  //   this.name = name;
  //   this.xp = xp;
  // }

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
        this.team = 'blue',
        this.xp = 0;

  Player.createRedPlayer({
    required String name,
    required int age,
  })  : this.age = age,
        this.name = name,
        this.team = 'red',
        this.xp = 0;

  void sayHello() {
    var name = 'aa';

    print("Hi my name is ${this.name}");
  }
}

void main() {
  var player = Player.createBluePlayer(name: 'coxe', age: 29);

  player.sayHello();

  var redPlayer = Player.createRedPlayer(name: 'coxe', age: 30);

  redPlayer.sayHello();
}
