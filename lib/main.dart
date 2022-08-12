import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'question.dart';
import 'quizbrian.dart';

QuizBrian quizBrian = QuizBrian();
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
   int score = 0;
   
  
  void checkAnswer(bool userDefindAnswer){
     
                 bool correctAnswer =quizBrian.getAnswer();
                 setState(() {
                    if(userDefindAnswer == correctAnswer){

                    scoreKeeper.add(Icon(
                      color:Colors.green,
                      Icons.check));
                      
                  }
                  else{
                    scoreKeeper.add(Icon
                    (
                      color:Colors.red,
                      Icons.close));
                    
                  
                
                  }
                  
                     quizBrian.nextQuestion();
                  
                   if( quizBrian.isFinished() == true){
                    Alert(
      context: context,
      type: AlertType.warning,
      title: "Quiz Finished",
      desc: "thanks for participating",
      buttons: [
        DialogButton(
          child: Text(
            "CANCEL",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: (){ Navigator.pop(context);
          color: Color.fromRGBO(0, 179, 134, 1.0);

          setState(() {
            quizBrian.reset();
            scoreKeeper.clear();
          });
               
          
          }
        ),
                   
      ],
    ).show();
           }
                 }
                  
                  );
                 

    
  }
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
              quizBrian.getQuestion(),
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
                
                  checkAnswer(true);
                  
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
                
                  checkAnswer(false);
                
                
                
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
 