import 'package:flutter/material.dart';

import 'colors.dart';

class Oxcontainer extends StatelessWidget {

String path ;
Oxcontainer({required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 30),
      width: MediaQuery.sizeOf(context).width * 0.5 - 20,
      height: MediaQuery.sizeOf(context).width * 0.5 - 20,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Image.asset(path),
    );
  }
}
