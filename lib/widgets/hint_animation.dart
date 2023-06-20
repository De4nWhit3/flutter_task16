import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dart_classes/question.dart';
import '../services/game_service.dart';

class HintAnimation extends StatelessWidget {
  const HintAnimation({
    super.key,
    required this.question,
    required this.hintIndex,
  });

  final Question question;
  final int hintIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer<GameService>(
      builder: (context, gameService, child) {
        return SizedBox(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                child: TextButton(
                  onPressed: () {
                    gameService.toggleHint(question, hintIndex);
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.lightbulb),
                      Text('Hint ${hintIndex + 1}')
                    ],
                  ),
                ),
              ),
              AnimatedPositioned(
                left: question.hints[hintIndex].visible ? 80 : -500,
                duration: const Duration(
                  milliseconds: 200,
                ),
                child: Text(
                  question.hints[hintIndex].text,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
