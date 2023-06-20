import 'package:assignment_16/services/game_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart_classes/game_theme.dart';
import 'dart_classes/question.dart';

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
              crossAxisCount: 2,
              children:
                  List.generate(gameService.questions.length, (questionIndex) {
                Question question = gameService.questions[questionIndex];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 3,
                    ),
                    color: gameService.isDarkModeOn
                        ? const Color.fromARGB(255, 0, 143, 5)
                        : const Color.fromARGB(255, 125, 255, 130),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(question.question),
                      SizedBox(
                        width: double.infinity,
                        child: Image.asset(question.imageURL),
                      )
                    ],
                  ),
                );
              }),
            ));
      },
    );
  }
}
