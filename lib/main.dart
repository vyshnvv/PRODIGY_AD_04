import 'package:flutter/material.dart';
import 'package:tictactoe/utils/colors.dart';
import 'package:tictactoe/screens/game_screen.dart';

import 'package:tictactoe/screens/main_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tic Tac Toe",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: TextTheme(bodyMedium: TextStyle(color: burntOrange)),
      ),
      routes: {
        MainMenu.routeName: (context) => const MainMenu(),
        GameScreen.routeName: (context) => const GameScreen(
              player1: "",
              player2: "",
            ),
      },
      initialRoute: MainMenu.routeName,
    );
  }
}
