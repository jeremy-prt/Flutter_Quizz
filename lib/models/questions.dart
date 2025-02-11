import 'package:quizz/models/question.dart';

class QuestionData {
  List<Question> questionList = [
    Question(
        question: "La Nike Air Jordan 1 a été bannie par la NBA en 1985 ?",
        response: true,
        explanation:
            "La NBA a interdit la Air Jordan 1 'Bred' parce qu'elle ne respectait pas les règles de couleur de l'époque. Michael Jordan devait payer une amende à chaque match où il les portait.",
        imagePath: '1.png'),
    Question(
        question:
            "Adidas a été la première marque à utiliser la technologie d’amorti Air dans ses baskets.",
        response: false,
        explanation:
            "C’est Nike qui a introduit la technologie Air en 1978 avec la Nike Air Tailwind.",
        imagePath: '2.png'),
    Question(
        question: "Le designer de la Nike Air Force 1 est Tinker Hatfield.",
        response: false,
        explanation:
            "C’est Bruce Kilgore qui a conçu la Nike Air Force 1 en 1982.",
        imagePath: '3.png'),
    Question(
        question:
            "Les Yeezy ont d’abord été créées par Kanye West chez Nike avant de passer chez Adidas.",
        response: true,
        explanation:
            "Kanye West a d’abord sorti la Nike Air Yeezy en 2009 avant de quitter Nike pour Adidas et créer la fameuse ligne Yeezy Boost.",
        imagePath: '4.png'),
    Question(
        question:
            "La première collaboration entre Travis Scott et Nike était sur une Air Jordan 4.",
        response: false,
        explanation:
            "La première collab entre Travis Scott et Nike était une Air Force 1 en 2017. ",
        imagePath: '5.png'),
    Question(
        question: "La marque New Balance a été fondée aux États-Unis en 1906.",
        response: true,
        explanation: "New Balance a été créée en 1906 à Boston, Massachusetts.",
        imagePath: '6.png'),
    Question(
        question:
            "Les Converse Chuck Taylor All Star sont les sneakers les plus vendues de tous les temps.",
        response: true,
        explanation:
            "Avec plus de 1 milliard de paires vendues, elles sont les baskets les plus populaires de l’histoire.",
        imagePath: '7.png'),
    Question(
        question: "Nike a acheté la marque Reebok en 2005.",
        response: false,
        explanation:
            "C’est Adidas qui a racheté Reebok en 2005. Nike n’a jamais possédé Reebok.",
        imagePath: '8.png'),
  ];
}
