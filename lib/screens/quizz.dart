import 'dart:math'; //Avec je peux rendre les questions aléatoire en utiilisant la méthode shuffle et un rnadom
import 'package:flutter/material.dart';
import 'package:quizz/models/questions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final QuestionData questionData = QuestionData();
  int currentQuestionIndex = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    questionData.questionList.shuffle(Random());
  }

  void checkAnswer(bool userAnswer) {
    final question = questionData.questionList[currentQuestionIndex];
    bool isCorrect = userAnswer == question.response;

    if (isCorrect) score++;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child:
                Text(isCorrect ? "✅ Bonne réponse !" : "❌ Mauvaise réponse !"),
          ),
          content: Text(question.explanation),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                nextQuestion();
              },
              child: Text("Suivant"),
            ),
          ],
        );
      },
    );
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questionData.questionList.length - 1) {
        currentQuestionIndex++;
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("🎉 Quiz terminé !"),
              content: Text(
                  "Votre score est de $score/${questionData.questionList.length}"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    restartQuiz();
                  },
                  child: Text("Recommencer"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text("Page d'accueil"),
                ),
              ],
            );
          },
        );
      }
    });
  }

  void restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      questionData.questionList.shuffle(Random());
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questionData.questionList[currentQuestionIndex];

    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Color(0xffA077EF), Color(0xff6655D5)],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("Quizz Sneakers",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(70, 55, 55, 55),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Question ${currentQuestionIndex + 1} sur ${questionData.questionList.length}",
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                      SizedBox(height: 25),
                      Text(
                        question.question,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 25),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 5),
                          ),
                          child: Image.asset(
                            "assets/images/${question.imagePath}",
                            height: 180,
                            width: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () => checkAnswer(true),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF5E7D99),
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          minimumSize: const Size(370, 50)),
                      child: Text("✅ VRAI",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => checkAnswer(false),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF864C90),
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(370, 50)),
                      child: Text("❌ FAUX",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  score == 0
                      ? "0 bonne réponse"
                      : score == 1
                          ? "$score bonne réponse"
                          : "$score bonnes réponses",
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ],
            ),
          ),
        ));
  }
}
