import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mathgame/widgets/my_buttons.dart';

import 'constants.dart';
import 'widgets/alert_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> numberPad = ['7','8','9','C','4','5','6','DEL','1','2','3','=','0'];

  String userAnswer = '';
  int limitInt = 0;
  int score = 0;
  var numberRandom = Random();

  int numberA = 1;
  int numberB = 1;
  @override
  void initState() {
    super.initState();
    numberA = numberRandom.nextInt(10);
    numberB = numberRandom.nextInt(10);
  }

  void checkResult(){
    if(numberA+numberB == int.parse(userAnswer)){
      showDialog(context: context, builder: (context) {
        return AlertDialogWidgets(
          title: 'Correct',
          icon: Icons.arrow_forward_rounded,
          onTap: gotToNewQuestion,
        );
      });
    }
    else{
      showDialog(context: context, builder: (context) {
        return AlertDialogWidgets(title: 'Wrong Answer', icon: Icons.refresh, onTap: goBackToQuestion,);
      });
    }
  }

  gotToNewQuestion(){
    numberA = numberRandom.nextInt(10);
    numberB = numberRandom.nextInt(10);

    Navigator.pop(context);
    userAnswer = '';
    limitInt = limitInt + 1 ;
    score = score + 5 ;
    setState(() {

    });
  }

  goBackToQuestion(){
    Navigator.pop(context);
    userAnswer='';
  }

  void buttonOnTap(String button){

    if(button == '='){
        checkResult();

    } else if(button == 'C'){
      userAnswer ='';
    }else if(button == 'DEL'){
      if(userAnswer.isNotEmpty){
        userAnswer = userAnswer.substring(0,userAnswer.length -1);
      }
    } else if(userAnswer.length<3){
      userAnswer += button;
    }



    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: limitInt != 10 ? Column(
        children: [
          Container(
            height: 100,
            color: Colors.deepPurple,
            child: Center(child: Text("Score = $score",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),)),
          ),
          Expanded(
            child: Container(
              color: Colors.deepPurple[300],
              child: Center(
                child: Text(" $numberA + $numberB = $userAnswer ",style:whiteText,),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.deepPurple[300],
              child: GridView.builder(
                itemCount: numberPad.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (context,index){
                    return MyButtons(
                      onTap: () => buttonOnTap('${numberPad[index]}'),
                      child: '${numberPad[index]}',
                    );
                  }
              ),
            ),
          )
        ],
      ) : Center(
        child: Container(
          child: Text("Level -1 completed Successfully "),
        ),
      ),
    );
  }
}
