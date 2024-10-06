import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Map> allQuestions = [
    {
      "question": "What is Dart primarily used for?",
      "options": [
        "Backend development",
        "Mobile app development",
        "Game development",
        "Web scraping"
      ],
      "correctAnswer": 1
    },
    {
      "question": "Which of the following data types is NOT supported in Dart?",
      "options": ["bool", "char", "double", "init"],
      "correctAnswer": 1
    },
    {
      "question": "In Dart, which keyword is used to create asynchronous functions?",
      "options": ["async","await","async and await","defer"],
      "correctAnswer": 2
    },
    {
      "question": " Which method is used to add a new element to a list in Dart?",
      "options": ["addElement()","append()"," add()","insert()"],
      "correctAnswer": 2
    },
    {
      "question": "How do you define a list in Dart?",
      "options":["var list = [];","List list = {};","var list = {};","array list = [];"],
      "correctAnswer": 0
    }
  ];

  int currentQuestionIndex = 0;
  int selectedAnswerIndex = -1;
  int count = 0;

  WidgetStateProperty<Color?> checkAnswer(int answerIndex) {
    if (selectedAnswerIndex != -1) {
      if (answerIndex == allQuestions[currentQuestionIndex]["correctAnswer"]) {
        return const WidgetStatePropertyAll(Colors.green);
      } else if (selectedAnswerIndex == answerIndex) {
        return const WidgetStatePropertyAll(Colors.red);
      } else {
        return const WidgetStatePropertyAll(null);
      }
    } else {
      return const WidgetStatePropertyAll(null);
    }
  }

  bool questionPage = true;

  @override
  Widget build(BuildContext context) {
    return isQuestionPage();
  }

  Scaffold isQuestionPage() {
    if (questionPage == true) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz App",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 28,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.purple[800],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 130,
                ),
                Text(
                 "Question: ${currentQuestionIndex + 1}/${allQuestions.length}",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 370,
              height: 80,
              child: Text(
                   allQuestions[currentQuestionIndex]["question"],
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 146, 10, 231),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(0),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 0;
                    if (selectedAnswerIndex ==
                        allQuestions[currentQuestionIndex]
                            ["correctAnswer"]) {
                      count++;
                    }
                    setState(() {});
                  }
                },
                child: Text(
                 "A.${ allQuestions[currentQuestionIndex]["options"][0]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(1),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 1;
                    if (selectedAnswerIndex ==
                        allQuestions[currentQuestionIndex]
                            ["correctAnswer"]) {
                      count++;
                    }
                    setState(() {});
                  }
                },
                child: Text(
                  "B.${allQuestions[currentQuestionIndex]["options"][1]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(2),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 2;
                    if (selectedAnswerIndex ==
                        allQuestions[currentQuestionIndex]
                            ["correctAnswer"]) {
                      count++;
                    }
                    setState(() {});
                  }
                },
                child: Text(
                  "C.${allQuestions[currentQuestionIndex]["options"][2]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(3),
          
                ),
              
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 3;
                    if (selectedAnswerIndex ==
                        allQuestions[currentQuestionIndex]
                            ["correctAnswer"]) {
                      count++;
                    }
                    setState(() {});
                  }
                },
                child: Text(
                  "D.${allQuestions[currentQuestionIndex]["options"][3]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (selectedAnswerIndex != -1) {
                  if (currentQuestionIndex < allQuestions.length - 1) {
                    currentQuestionIndex++;
                  } else {
                    questionPage = false;
                  }
                  selectedAnswerIndex = -1;
                  setState(() {});
                }
              },
              backgroundColor: Colors.purple,
              child: const Icon(Icons.forward
              ,
              ),
            ),
        
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Result",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 28,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.purple[800],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://tse2.mm.bing.net/th?id=OIP.r2jDs_h5rxdZdBS9rbox8QHaEt&pid=Api&P=0&h=180",
                height: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Score : $count/${allQuestions.length}",
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              const Text(
                " *! Congrats !*",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.red,
                ),
              ),
              const Text(
                " *! Quiz Completed Successfully !* ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.red,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            
              SizedBox(
                height: 30,
                width: 130,
                child: ElevatedButton(
                  onPressed: () {
                    questionPage = true;
                    currentQuestionIndex = 0;
                    count = 0;
                    setState(() {});
                  },
                  child: const Text(
                    "ReTest",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}