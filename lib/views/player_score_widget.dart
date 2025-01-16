import 'package:flutter/material.dart';
import '../models/player_model.dart';

class PlayerScoreWidget extends StatelessWidget {
  final PlayerModel player;
  final bool isServing;

  const PlayerScoreWidget({required this.player, required this.isServing});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (isServing)
                  Icon(Icons.circle, color: Colors.yellow, size: 10),
                SizedBox(width: 8),
                Text(player.name, style: TextStyle(fontSize: 18)),
              ],
            ),
            Column(
              children: [
                Text("Set: ${player.setsWon}", style: TextStyle(fontSize: 16)),
                Text("Jeux: ${player.gamesWon}", style: TextStyle(fontSize: 16)),
                Text("Score: ${player.currentGameScore}", style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}