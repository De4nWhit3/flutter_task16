import 'package:assignment_16/services/game_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart_classes/game_theme.dart';
import 'dart_classes/question.dart';
import 'widgets/hint_animation.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => GameService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameService>(
      builder: (context, gameService, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          themeMode:
              gameService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          theme: GameTheme.lightTheme,
          darkTheme: GameTheme.darkTheme,
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GameService>(
      builder: (context, gameService, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Dean\'s Quiz App'),
            actions: [
              IconButton(
                onPressed: () {
                  gameService.toggleTheme();
                },
                icon: const Icon(Icons.star),
              ),
            ],
          ),
          body: GridView.count(
            crossAxisCount: 1,
            mainAxisSpacing: 20,
            padding: const EdgeInsets.only(top: 20),
            children: List.generate(
              gameService.questions.length,
              (questionIndex) {
                Question question = gameService.questions[questionIndex];

                return Container(
                  padding: const EdgeInsets.only(top: 20),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: gameService.isDarkModeOn
                            ? Colors.white
                            : Colors.black,
                        width: 2,
                      )),
                  child: Column(
                    children: [
                      Text(
                        question.question,
                        style: const TextStyle(fontSize: 26),
                      ),
                      Center(
                        child: Container(
                            width: MediaQuery.of(context).size.width - 40,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Image.asset(question.imageURL)),
                      ),
                      HintAnimation(question: question, hintIndex: 0),
                      HintAnimation(question: question, hintIndex: 1),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
