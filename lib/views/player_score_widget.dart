import 'package:flutter/material.dart';
import '../models/player_model.dart';

class PlayerScoreWidget extends StatelessWidget {
  final PlayerModel player;

  const PlayerScoreWidget({required this.player});

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
                if (player.isServing)
                  Icon(Icons.circle, color: Colors.yellow, size: 10),
                SizedBox(width: 8),
                Text(player.name, style: TextStyle(fontSize: 18)),
              ],
            ),
            Text(
              '${player.gamesWon.join(" ")} *${player.currentGameScore}*',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
