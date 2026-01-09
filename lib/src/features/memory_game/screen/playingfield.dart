import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:math_memory/src/data/model/equation.dart';
import 'package:math_memory/src/data/model/memory_card.dart';
import 'package:math_memory/src/features/memory_game/widgets/card_tile.dart';

/// The main playing field screen for the memory game.
class Playingfield extends StatefulWidget {
  const Playingfield({super.key});

  @override
  State<Playingfield> createState() => _PlayingfieldState();
}

class _PlayingfieldState extends State<Playingfield> {
  List<MemoryCard> cards = [];
  List<Equation> equationList = [];
  int tryCounter = 0;
  int matchCounter = 0;
  List<int> flippedIndices = [];

  /// Current difficulty level of the game. standart is medium
  Difficulty currentDifficulty = Difficulty.medium;

  @override
  void initState() {
    super.initState();
    _setupGame();
  }

  /// Sets up a new game by generating equations and creating memory cards.
  void _setupGame() {
    List<Equation> newEquationList = [];

    Set<int> checkResultSet = {};

    while (newEquationList.length < 8) {
      Equation eq = Equation(newEquationList.length, currentDifficulty);

      if (!checkResultSet.contains(eq.result)) {
        log("Generated Equation: ${eq.equationString} = ${eq.result}");
        checkResultSet.add(eq.result);

        newEquationList.add(eq);
      }
    }

    equationList = newEquationList;

    List<MemoryCard> tempCards = [];
    for (int i = 0; i < 8; i++) {
      tempCards.add(
        MemoryCard(content: equationList[i].equationString, pairId: i),
      );

      tempCards.add(
        MemoryCard(content: equationList[i].result.toString(), pairId: i),
      );
    }

    tempCards.shuffle();

    setState(() {
      cards = tempCards;
    });
  }

  /// Handles the tap event on a card.
  void _handleCardTap(int index) {
    if (cards[index].isMatched ||
        cards[index].isFlipped ||
        flippedIndices.length >= 2) {
      return;
    }

    setState(() {
      cards[index].isFlipped = true;
      flippedIndices.add(index);
    });

    if (flippedIndices.length == 2) {
      _checkMatch();
    }
  }

  /// Checks if the two flipped cards match.
  void _checkMatch() {
    tryCounter++;

    int firstIndex = flippedIndices[0];
    int secondIndex = flippedIndices[1];

    if (cards[firstIndex].pairId == cards[secondIndex].pairId) {
      setState(() {
        cards[firstIndex].isMatched = true;
        cards[secondIndex].isMatched = true;
        matchCounter++;
        flippedIndices.clear();
      });

      if (matchCounter == 8) _showWinDialog();
    } else {
      Timer(const Duration(seconds: 2), () {
        if (!mounted) return;

        setState(() {
          cards[firstIndex].isFlipped = false;
          cards[secondIndex].isFlipped = false;
          flippedIndices.clear();
        });
      });
    }
  }

  /// Displays a dialog when the player wins the game.
  void _showWinDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Gewonnen!"),
        content: Text("Versuche: $tryCounter"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);

              setState(() {
                tryCounter = 0;
                matchCounter = 0;
                flippedIndices.clear();
                _setupGame();
              });
            },
            child: const Text("Neues Spiel"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2CB07),
      appBar: AppBar(
        title: Text("Versuche: $tryCounter"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: cards.length,
          itemBuilder: (context, index) {
            return CardTile(
              card: cards[index],
              onTap: () => _handleCardTap(index),
            );
          },
        ),
      ),
    );
  }
}
