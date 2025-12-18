
import 'package:flutter/material.dart';
import 'package:xogame/Boardtile.dart';
import 'package:xogame/colors.dart';

import 'OxChoice.dart';

class PlayScreen extends StatefulWidget {
  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  List<String> boardlist = [
    "","","",
    "","","",
    "","",""];
int player1score = 0 ;
  int player2score = 0 ;
String title = "Player's 1 Turn";
late oxChoice args;
  @override
  Widget build(BuildContext context) {
     args = ModalRoute.of(context)?.settings.arguments as oxChoice;
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).width * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.white
                ),
                child: Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("player1 ${args.player1choice}",style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 24
                        ),),
                        Text("score : $player1score",style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 24
                        ),),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("player2 ${args.player2choice}",style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 24
                        ),),

                        Text("score : $player2score",style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 24
                        ),),
                      ],
                    ),

                  ],
                ),
              ),
              Text(title,style: TextStyle(
                color: AppColors.white,
                fontSize: 36,
                fontWeight: FontWeight.w700
              ),),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: AppColors.white
                ),
                child: Column(
                  children: [
                    Expanded(child: Row(
                      children: [
                        Boardtile(symbol: boardlist[0], onButtonClick: onButtonClick, index: 0,),
                        divider(width: 2,),
                        Boardtile(symbol: boardlist[1], onButtonClick: onButtonClick, index: 1,),
                        divider(width: 2,),
                        Boardtile(symbol: boardlist[2], onButtonClick: onButtonClick, index: 2,),
                      ],
                    )),
                    divider(height: 2,),
                    Expanded(child: Row(
                      children: [
                        Boardtile(symbol: boardlist[3], onButtonClick: onButtonClick, index: 3,),
                        divider(width: 2,),
                        Boardtile(symbol: boardlist[4], onButtonClick: onButtonClick, index: 4,),
                        divider(width: 2,),
                        Boardtile(symbol: boardlist[5], onButtonClick: onButtonClick, index: 5,),
                      ],
                    )),
                    divider(height: 2,),
                    Expanded(child: Row(
                      children: [
                        Boardtile(symbol: boardlist[6], onButtonClick: onButtonClick, index: 6,),
                        divider(width: 2,),
                        Boardtile(symbol: boardlist[7], onButtonClick: onButtonClick, index: 7,),
                        divider(width: 2,),
                        Boardtile(symbol: boardlist[8], onButtonClick: onButtonClick, index: 8,),
                      ],
                    )),
                  ],
                ),
              )
            ],
          ),)
    );
  }

  int counter = 0 ;

  void onButtonClick(int index){
    if(boardlist[index].isNotEmpty){
      return ;
    }
    if(counter % 2 == 0 ){
      boardlist[index] = args.player1choice;
      title = "Player's 2 Turn";
    }
    else{
      boardlist[index] = args.player2choice;
      title = "Player's 1 Turn";
    }
    counter++;
    if(isWiner(args.player1choice)){
    player1score++;
    title = "Player's 1 win";
    Future.delayed(Duration(seconds: 1),clearboard);
    }else if (isWiner(args.player2choice)){
    player2score++;
    title = "Player's 2 win";
    Future.delayed(Duration(seconds: 1),clearboard);
    } else if(counter == 9){
      Future.delayed(Duration(seconds: 1),clearboard);
      title = "none wins";
    }
    setState(() {

    });
  }
  bool isWiner(String symbol){
   for(int i= 0 ; i < 9 ; i+=3){
     if(boardlist[i] == symbol && boardlist[i+1] == symbol && boardlist[i+2] == symbol){
       return true;
     }
   }
   for(int i= 0 ; i < 3 ; i+=1){
     if(boardlist[i] == symbol && boardlist[i+3] == symbol && boardlist[i+6] == symbol){
       return true;
     }
   }
   if(boardlist[0] == symbol && boardlist[4] == symbol && boardlist[8] == symbol){
     return true;
   }
   if(boardlist[2] == symbol && boardlist[4] == symbol && boardlist[6] == symbol){
     return true;
   }
   return false;
  }

  void clearboard(){
  boardlist = [
  "","","",
  "","","",
  "","",""];
  title = "Player's 1 Turn";
  counter =0;
  setState(() {

  });
}
}
