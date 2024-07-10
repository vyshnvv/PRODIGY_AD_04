import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/utils/colors.dart';

class Scoreboard extends StatefulWidget {
  final String player1;
  final String player2;
  final String currentPlayer;
  const Scoreboard(
      {super.key,
      required this.player1,
      required this.player2,
      required this.currentPlayer});

  @override
  State<Scoreboard> createState() => _ScoreboardState();
}

class _ScoreboardState extends State<Scoreboard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        width: size.width * 0.9,
        decoration: BoxDecoration(
            border: Border.all(color: burntOrange, width: 5),
            color: brown,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    widget.currentPlayer == "P1"
                        ? AvatarGlow(
                            child: CircleAvatar(
                              maxRadius: 8,
                              backgroundColor: olivegreen,
                            ),
                          )
                        : CircleAvatar(
                            maxRadius: 8,
                            backgroundColor: brown,
                          ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.player1,
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ],
            ),
            const Text(
              "|",
              style: TextStyle(fontSize: 30),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.currentPlayer == "P2"
                        ? AvatarGlow(
                            child: CircleAvatar(
                              maxRadius: 8,
                              backgroundColor: olivegreen,
                            ),
                          )
                        : CircleAvatar(
                            maxRadius: 8,
                            backgroundColor: brown,
                          ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(widget.player2, style: TextStyle(fontSize: 20)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
