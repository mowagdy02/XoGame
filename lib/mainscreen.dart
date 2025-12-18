import 'package:flutter/material.dart';
import 'package:xogame/OxChoice.dart';
import 'package:xogame/colors.dart';
import 'package:xogame/main.dart';
import 'package:xogame/oxContainer.dart';

class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF00D2FF),
              Color(0xFF3A7BD5),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              "Tix-Tac-Toe",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 24,
                fontWeight: FontWeight.w500
              ),

            ),Spacer(),
            Text(
              "pick who goes first?",
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w400
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(child: Oxcontainer(path: "assets/images/o.png"),onTap: () {
                    Navigator.pushNamed(context, AppRoutes.play,arguments: oxChoice(player1choice: "o", player2choice: "x"));
                  },),
                  InkWell(child: Oxcontainer(path: "assets/images/x.png"),onTap: () {
                    Navigator.pushNamed(context, AppRoutes.play,arguments: oxChoice(player1choice: "x", player2choice: "o"));
                  },),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
