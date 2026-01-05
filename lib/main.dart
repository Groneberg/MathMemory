import 'package:flutter/material.dart';
import 'package:math_memory/src/features/memory_game/screen/playingfield.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Playingfield(),
    );
  }
}
