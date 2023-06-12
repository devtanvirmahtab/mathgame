import 'package:flutter/material.dart';

import '../constants.dart';

class MyButtons extends StatelessWidget {
  final String child;
  var buttonClr = Colors.deepPurple;
  final VoidCallback onTap;
  MyButtons({Key? key, required this.child, required this.onTap}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    if(child == 'C'){
      buttonClr = Colors.blue;
    }else if(child == 'DEL'){
      buttonClr = Colors.red;
    }else if(child == '='){
      buttonClr = Colors.pink;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 10,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: buttonClr,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: Text(child,style: whiteText,)),
      ),
    );
  }
}
