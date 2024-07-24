void main() {
  var oldFriends = ['puppy', 'coxe', 'happy'];
  var newFriends = [
    'lists',
    'row',
    'view',
    for (var friend in oldFriends) 'new $friend 🎇'
  ];

  print(newFriends);
}
