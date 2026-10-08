import 'package:flutter/material.dart';

class ResultLeaderboard extends StatelessWidget {
  const ResultLeaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Icon(Icons.emoji_events_outlined, size: 46, color: Colors.grey),

            SizedBox(height: 12),

            Text(
              'Leaderboard is not available yet',

              textAlign: TextAlign.center,

              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 8),

            Text(
              'Ranking other players requires storing their results.',

              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
