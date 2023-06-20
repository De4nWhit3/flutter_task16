import 'package:assignment_16/services/game_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart_classes/game_theme.dart';

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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Dean\'s Quiz App'),
          actions: [
            IconButton(
              onPressed: () {
                Provider.of<GameService>(context, listen: false).toggleTheme();
              },
              icon: const Icon(Icons.star),
            ),
          ],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
              Provider.of<GameService>(context, listen: false).questions.length,
              (questionIndex) {
            return const Placeholder();
          }),
        ));
  }
}
