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
   List<Icon> scoreKeeper = [];
  List<String> question =[

    'you lead a cow up the stairs but nit down the stairs',
    'Approximately one quarter of human bnesa are the feets',
    'A slug\'s blood is green'
  ];
  List<bool> answer =[
    false,true,true,
  ];

  int questionNumber = 0;
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
              question[questionNumber],
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
                  bool correctAnswer =answer[questionNumber];
                  if(correctAnswer==true){
                    print('good answer');
                  }
                  else{
                    print('wrong answer');
                  }
                  
                questionNumber++;
                  },
                  
                );
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
                 bool correctAnswer =answer[questionNumber];
                  if(correctAnswer==false){
                    print('good answer');
                  }
                  else{
                    print('wrong answer');
                  
                questionNumber++;
                  }
                
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