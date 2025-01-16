class PlayerModel {
  String name;
  bool isServing;
  String currentGameScore;  // Utilisation de String pour le score
  int gamesWon;
  int setsWon;

  PlayerModel({
    required this.name,
    required this.isServing,
    this.currentGameScore = "0", // Initialisation avec "0"
    this.gamesWon = 0,
    this.setsWon = 0,
  });
}