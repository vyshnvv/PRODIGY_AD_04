import 'package:flutter/material.dart';
import 'package:tictactoe/utils/colors.dart';
import 'package:tictactoe/screens/game_screen.dart';
import 'package:tictactoe/utils/snackbar.dart';
import 'package:tictactoe/widgets/buttonui.dart';

class MainMenu extends StatefulWidget {
  static String routeName = '/main-menu';
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  void gameScreen(BuildContext context) {
    if (player2_controller.text == "" && player1_controller.text == "") {
      showSnackBar(context, "Enter player names");
    } else if (player1_controller.text == "") {
      showSnackBar(context, "Enter name of player1");
    } else if (player2_controller.text == "") {
      showSnackBar(context, "Enter name of player2");
    } else {
      Navigator.pushNamed(context, GameScreen.routeName, arguments: {
        'player1': player1_controller.text,
        'player2': player2_controller.text
      });
    }
  }

  final player1_controller = TextEditingController();

  final player2_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "TicTacToe!",
                style: TextStyle(
                    color: brown, fontWeight: FontWeight.bold, fontSize: 50),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Enter player names:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(right: 20, left: 20),
                child: TextField(
                  controller: player1_controller,
                  style: TextStyle(color: beige),
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(10),
                      fillColor: olivegreen,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: burntOrange, width: 4),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: olivegreen)),
                      labelText: "Player 1",
                      labelStyle: TextStyle(
                          color: burntOrange, fontWeight: FontWeight.bold),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        size: 30,
                        color: burntOrange,
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(right: 20, left: 20),
                child: TextField(
                  controller: player2_controller,
                  style: TextStyle(color: beige),
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(10),
                      fillColor: olivegreen,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: burntOrange, width: 4),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: olivegreen)),
                      labelText: "Player 2",
                      labelStyle: TextStyle(
                          color: burntOrange, fontWeight: FontWeight.bold),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        size: 30,
                        color: burntOrange,
                      )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Button1(onTap: () => gameScreen(context), buttonText: "Play"),
            ],
          ),
        ),
      ),
    );
  }
}
