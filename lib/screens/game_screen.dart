import 'package:flutter/material.dart';
import 'package:tictactoe/screens/main_menu.dart';
import 'package:tictactoe/utils/colors.dart';
import 'package:tictactoe/utils/snackbar.dart';
import 'package:tictactoe/views/gameboard.dart';
import 'package:tictactoe/views/scoreboard.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game-screen';
  final String player1;
  final String player2;
  const GameScreen({super.key, required this.player1, required this.player2});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late String currentPlayer;
  late String winner;
  late bool gameOver;
  List<String> board = List.filled(9, "");
  @override
  void initState() {
    super.initState();
    currentPlayer = "P1";
    winner = "";
    gameOver = false;
  }

  void updateBoard(int index, String player1, String player2) {
    if (board[index] == "" && !gameOver) {
      setState(() {
        board[index] = currentPlayer == "P1" ? "X" : "O";
        if (checkWinner(currentPlayer == "P1" ? "X" : "O", context)) {
          gameOver = true;
          winner = currentPlayer == "P1" ? player1 : player2;
          showResult(winner);
        } else if (board.every((index) => index.isNotEmpty)) {
          gameOver = true;
          winner = "Draw";
          showResult(winner);
        } else {
          switchPlayer(currentPlayer == "P1" ? "P2" : "P1");
        }
      });
    } else {
      showSnackBar(context, "Celll already filled!");
    }
  }

  bool checkWinner(String symbol, BuildContext context) {
    List<List<int>> winPositions = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    for (var pos in winPositions) {
      if (board[pos[0]] == symbol &&
          board[pos[1]] == symbol &&
          board[pos[2]] == symbol) {
        return true;
      }
    }
    return false;
  }

  void showResult(String message) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              textAlign: TextAlign.center,
              "Game Over",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            content: Text(
              textAlign: TextAlign.center,
              message == "Draw" ? "It's a Tie!" : "$message Wins!",
              style: TextStyle(fontSize: 25),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => exitGame(context),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: desertOasis),
                    child: const Text(
                      "Quit",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      resetGame(context);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: deepAqua),
                    child: const Text(
                      "Restart",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }

  void resetGame(BuildContext context) {
    setState(() {
      board = List.filled(9, "");
      currentPlayer = "P1";
      winner = "";
      gameOver = false;
    });
  }

  void switchPlayer(String nextPlayer) {
    setState(() {
      currentPlayer = nextPlayer;
    });
  }

  void exitGame(BuildContext context) {
    Navigator.pushNamed(context, MainMenu.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final player1 = routeArgs['player1'].toString();
    final player2 = routeArgs['player2'].toString();

    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.only(top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () => exitGame(context),
                  label: Icon(Icons.close),
                  style: ElevatedButton.styleFrom(backgroundColor: desertOasis),
                ),
                ElevatedButton.icon(
                  onPressed: () => resetGame(context),
                  label: Icon(Icons.restart_alt),
                  style: ElevatedButton.styleFrom(backgroundColor: deepAqua),
                ),
              ],
            ),
            Scoreboard(
                player1: player1,
                player2: player2,
                currentPlayer: currentPlayer),
            Expanded(
                child: Gameboard(
                    currentPlayer: currentPlayer,
                    board: board,
                    updateBoard: updateBoard,
                    player1: player1,
                    player2: player2)),
          ],
        ),
      )),
    );
  }
}
