import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
typedef onPressed = void Function(int);
class Boardtile extends StatelessWidget {
String symbol;
int index;
onPressed onButtonClick;
Boardtile({required this.symbol,required this.onButtonClick,required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        child: symbol.isEmpty? Container() : Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset("assets/images/${symbol}.png"),
        ),
        onTap: () {
          onButtonClick(index);

        },
      ),
    );
  }
}

class divider extends StatelessWidget {
  double height;
  double width;
   divider({this.height = double.infinity , this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black,
      height: height,
      width: width,
    );
  }
}

