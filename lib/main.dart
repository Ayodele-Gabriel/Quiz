import 'package:flutter/material.dart';
import 'package:quiz/quiz_vault.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizVault quizVault = QuizVault();

void main() {
  runApp(const Quizzer());
}

class Quizzer extends StatelessWidget {
  const Quizzer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizHome(),
          ),
        ),
      ),
    );
  }
}

class QuizHome extends StatefulWidget {
  const QuizHome({Key? key}) : super(key: key);

  @override
  State<QuizHome> createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  List<Icon> scoreBoard = [];

  void viewReply(bool selectedAnswer) {
    bool actualReplies = quizVault.findInquiryReply();

    setState(() {
      if (quizVault.theEnd() == true) {
        Alert(
          context: context,
          title: 'The End',
          desc: 'You\'ve Reached The End Of the Questions',
        ).show();
        quizVault.startOver();
        scoreBoard = [];
      } else {
        if (selectedAnswer == actualReplies) {
          scoreBoard.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreBoard.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizVault.otherInquiry();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizVault.findInquiryLetters(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: const Text(
                'True',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                viewReply(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                viewReply(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreBoard,
        ),
      ],
    );
  }
}