import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/score_viewmodel.dart';
import 'player_score_widget.dart';


class TennisMatchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Accède au ScoreViewModel via Provider
    final scoreViewModel = Provider.of<ScoreViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tennis Match'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: scoreViewModel.toggleService,  // Change le serveur
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Joueur 1: ${scoreViewModel.player1.name} - ${scoreViewModel.player1.currentGameScore}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Joueur 2: ${scoreViewModel.player2.name} - ${scoreViewModel.player2.currentGameScore}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            // Affichage des scores des sets et jeux
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sets: ${scoreViewModel.player1.setsWon} - ${scoreViewModel.player2.setsWon}", 
                     style: TextStyle(fontSize: 24)),
                Text("Jeux: ${scoreViewModel.player1.gamesWon} - ${scoreViewModel.player2.gamesWon}", 
                     style: TextStyle(fontSize: 20)),
              ],
            ),
            SizedBox(height: 20),
            // Ajouter d'autres widgets pour afficher les scores, les jeux, les sets, etc.
          ],
        ),
      ),
    );
  }
}
