import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/score_viewmodel.dart';
import '../models/player_model.dart'; 


class TennisMatchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scoreViewModel = Provider.of<ScoreViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tennis Match'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: scoreViewModel.resetScores,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Rectangle horizontal pour Joueur 1
            _buildPlayerInfo(scoreViewModel.player1),
            SizedBox(height: 20),
            // Rectangle horizontal pour Joueur 2
            _buildPlayerInfo(scoreViewModel.player2),
            SizedBox(height: 40),

            // Boutons pour incrémenter le score
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => scoreViewModel.incrementScore(scoreViewModel.player1),
                  child: Text('Marquer un point pour ${scoreViewModel.player1.name}'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => scoreViewModel.incrementScore(scoreViewModel.player2),
                  child: Text('Marquer un point pour ${scoreViewModel.player2.name}'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerInfo(PlayerModel player) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Nom du joueur
          Text(
            player.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          // Affichage des sets et jeux
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Sets: ${player.setsWon}", style: TextStyle(fontSize: 18)),
              Text("Jeux: ${player.gamesWon}", style: TextStyle(fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }
}
