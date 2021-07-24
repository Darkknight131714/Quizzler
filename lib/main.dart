import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
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
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scores=[
  ];
  QuizBrain quizBrain = QuizBrain();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  if(quizBrain.getAnswer())
                  {
                    scores.add(Icon(Icons.check,color: Colors.green,));
                  }
                  else
                  {
                    scores.add(Icon(Icons.close,color: Colors.red,));
                  }
                  int a=quizBrain.nextQuestion();
                  if(a==1)
                    {
                      Alert(
                        context: context,
                        type: AlertType.error,
                        title: "Quiz",
                        desc: "Quiz is over",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: (){
                              setState(() {
                                scores.clear();
                                quizBrain.cleare();
                              });

                            },
                            width: 120,
                          )
                        ],
                      ).show();
                    }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                  setState(() {
                    if(quizBrain.getAnswer()==false)
                      {
                        scores.add(Icon(Icons.check,color: Colors.green,));
                      }
                    else
                      {
                        scores.add(Icon(Icons.close,color: Colors.red,));
                      }
                    int a=quizBrain.nextQuestion();
                    if(a==1)
                    {
                      Alert(
                      context: context,
                      type: AlertType.error,
                        title: "Quiz",
                        desc: "Quiz is over",
                        buttons: [
                        DialogButton(
                        child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: (){
                          setState(() {
                            scores.clear();
                            quizBrain.cleare();
                          });

                        },
                        width: 120,
                        )
                        ],
                        ).show();
                  }
                  }
                  );
              },
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: scores
          ),
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
