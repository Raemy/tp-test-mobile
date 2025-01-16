import 'package:flutter/material.dart';
import '../models/player_model.dart';

class ScoreViewModel extends ChangeNotifier {
  late PlayerModel player1;
  late PlayerModel player2;

  bool isSingleMatch = true;

  ScoreViewModel() {
    resetScores();
  }

  void resetScores() {
    player1 = PlayerModel(name: "Joueur 1", isServing: true);
    player2 = PlayerModel(name: "Joueur 2", isServing: false);
    notifyListeners();
  }

  void incrementScore(PlayerModel player) {
    if (player.currentGameScore == 40) {
      _addGame(player);
    } else {
      player.currentGameScore += 15;
    }
    notifyListeners();
  }

  void _addGame(PlayerModel player) {
    player.gamesWon.add(1);
    player.currentGameScore = 0;

    if (player.gamesWon.length == 6) {
      player.setsWon += 1;
      player.gamesWon.clear();
    }
    notifyListeners();
  }

  void toggleMatchType() {
    isSingleMatch = !isSingleMatch;
    resetScores();
  }

  void updatePlayerName(PlayerModel player, String newName) {
    player.name = newName;
    notifyListeners();
  }
}
