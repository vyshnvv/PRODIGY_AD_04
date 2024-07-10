import 'package:flutter/material.dart';
import 'package:tictactoe/utils/colors.dart';

class Gameboard extends StatefulWidget {
  final String currentPlayer;
  final String player1;
  final String player2;
  final Function updateBoard;
  final List<String> board;
  const Gameboard(
      {super.key,
      required this.currentPlayer,
      required this.board,
      required this.updateBoard,
      required this.player1,
      required this.player2});

  @override
  State<Gameboard> createState() => _GameboardState();
}

class _GameboardState extends State<Gameboard> {
  List<String> board = List.filled(9, "");

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: size.height * 0.7,
          maxWidth: size.width * 0.97,
        ),
        child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    widget.updateBoard(index, widget.player1, widget.player2);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: olivegreen,
                      border: Border.all(color: navyBlue, width: 0.5)),
                  child: Center(
                    child: Text(
                      widget.board[index],
                      style: TextStyle(fontSize: 40, color: beige),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
