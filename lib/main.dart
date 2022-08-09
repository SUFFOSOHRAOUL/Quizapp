import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}
class QuizApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
    
  }
}

class QuizPage extends StatefulWidget {
 
  
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
   List<Icon> scoreKeeper = [
     Icon(
            Icons.check,
            color: Colors.green,
            ),
            Icon(
            Icons.close,
            color: Colors.red,
            ),
            Icon(
            Icons.check,
            color: Colors.green,
            ),
            Icon(
            Icons.close,
            color: Colors.red,
            ),

  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              'this is where the question will go',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white
              ),
            ),
          ), ),
        ),
         Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor:MaterialStateProperty.all(Colors.red),
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  scoreKeeper.add(
                    Icon(
            Icons.check,
            color: Colors.green,
            ),
                  );
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor:MaterialStateProperty.all(Colors.green),
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
              },
            ),
          ),
        ),
      Row(
        children: scoreKeeper,
         
        
      )
      ],
    );
    
  }
}