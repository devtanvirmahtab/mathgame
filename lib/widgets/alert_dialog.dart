import 'package:flutter/material.dart';

import '../constants.dart';

class AlertDialogWidgets extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const AlertDialogWidgets({Key? key, required this.title, required this.icon, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      title: Text(title,style: whiteText,),
      content: GestureDetector(
        onTap: onTap,
        child: Icon(icon,size: 20,),
      ),
    );
  }
}
