import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/score_viewmodel.dart';
import 'views/match_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ScoreViewModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tennis Score Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MatchScreen(),
    );
  }
}
