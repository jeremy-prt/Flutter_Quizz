import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz")),
      body: Center(
        child: Text(
          "Ici, tu mettras tes questions !",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
