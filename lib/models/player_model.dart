class PlayerModel {
  String name;
  int currentGameScore;
  List<int> gamesWon;
  int setsWon;
  bool isServing;

  PlayerModel({
    required this.name,
    this.currentGameScore = 0,
    this.gamesWon = const [],
    this.setsWon = 0,
    this.isServing = false,
  });
}
