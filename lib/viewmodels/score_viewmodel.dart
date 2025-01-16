import 'package:flutter/material.dart';
import '../models/player_model.dart';

class ScoreViewModel extends ChangeNotifier {
  late PlayerModel player1;
  late PlayerModel player2;
  late  PlayerModel currentServer;

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
  if (player.currentGameScore == "0") {
    player.currentGameScore = "15";
  } else if (player.currentGameScore == "15") {
    player.currentGameScore = "30";
  } else if (player.currentGameScore == "30") {
    player.currentGameScore = "40";
  } else if (player.currentGameScore == "40") {
    if (opponent(player).currentGameScore == "40") {
      player.currentGameScore = "ADVANTAGE";  
    } else {
      
      _addGame(player);
    }
  } else if (player.currentGameScore == "ADVANTAGE") {
    
    _addGame(player);
  }
  notifyListeners();
}


void _addGame(PlayerModel player) {
  player.gamesWon++;
  player.currentGameScore = "0";  // Réinitialiser le score du jeu

  // Vérifier si un set est gagné
  if (player.gamesWon == 6 && opponent(player).gamesWon < 5) {
    player.setsWon++;
    player.gamesWon = 0;
  } else if (player.gamesWon == 7 && opponent(player).gamesWon == 5) {
    // Si le score est 6-5, un jeu supplémentaire est nécessaire
    player.setsWon++;
    player.gamesWon = 0;
  }
  notifyListeners();
}

PlayerModel opponent(PlayerModel player) {
  return player == player1 ? player2 : player1;  
}

void toggleService() {
  // Si le joueur 1 a servi, on passe au joueur 2 et vice-versa
  if (currentServer == player1) {
    currentServer = player2;
  } else {
    currentServer = player1;
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
