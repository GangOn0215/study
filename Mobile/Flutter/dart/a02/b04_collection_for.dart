void main() {
  var oldFriends = ['coxe', 'monkey'];
  var newFriends = [
    '❄️',
    'lay',
    'darren',
    for (var friend in oldFriends) "🪄 $friend",
  ];

  print(newFriends);
}
