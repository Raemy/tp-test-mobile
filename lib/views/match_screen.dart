import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/score_viewmodel.dart';
import 'player_score_widget.dart';

class MatchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scoreViewModel = Provider.of<ScoreViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Match de Tennis'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: scoreViewModel.resetScores,
          ),
        ],
      ),
      body: Column(
        children: [
          PlayerScoreWidget(player: scoreViewModel.player1),
          PlayerScoreWidget(player: scoreViewModel.player2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => scoreViewModel.incrementScore(scoreViewModel.player1),
                child: Text('Point Joueur 1'),
              ),
              ElevatedButton(
                onPressed: () => scoreViewModel.incrementScore(scoreViewModel.player2),
                child: Text('Point Joueur 2'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
