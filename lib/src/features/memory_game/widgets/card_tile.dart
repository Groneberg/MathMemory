import 'package:flutter/material.dart';
import 'package:math_memory/src/data/model/memory_card.dart';

/// A widget that represents a memory card tile.
class CardTile extends StatelessWidget {
  final MemoryCard card;
  final VoidCallback onTap;

  const CardTile({
    super.key,
    required this.card,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    
    Color backgroundColor;
    Color textColor;
    Color borderColor;
    double borderWidth;

    // frontside
    if (card.isMatched) {
      backgroundColor = Colors.white;
      textColor = Colors.white; 
      borderColor = Colors.white;
      borderWidth = 2.0;
    } else if (card.isFlipped) {
      backgroundColor = Colors.white;
      textColor = Colors.black;
      borderColor = Colors.black;
      borderWidth = 3.0;
    } else {
      
    // backside
      backgroundColor = const Color(0xFF04B2D9);
      textColor = const Color(0xFF04B2D9);
      borderColor = Colors.black;
      borderWidth = 3.0;
    }

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        child: Center(
          child: Text(
            card.content,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}