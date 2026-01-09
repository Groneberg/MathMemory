import 'dart:math';

/// Enum representing the difficulty levels of equations.
enum Difficulty { easy, medium, hard }

/// A class representing a mathematical equation with two terms and an operator.
class Equation {
  final int id;
  final Difficulty difficulty;
  late int term1;
  late int term2;
  late String operator;
  late int result;

  Equation(this.id, this.difficulty) {
    _generateEquation();
  }

  /// Generates a random equation and calculates the result.
  void _generateEquation() {
    final random = Random();
    final operators = ['+', '-', 'x', '÷'];
    operator = operators[random.nextInt(operators.length)];

  /// Max values for different difficulty levels
    int maxAddSub; // Max for Addition and Subtraction
    int maxMultDiv; // Max for Multiplication and Division

switch (difficulty) {
      case Difficulty.easy:
        maxAddSub = 11; // 0 to 10 (Result max 20)
        maxMultDiv = 6; // 0 to 5 (basic multiplication by halfs of 10)
        break;
      case Difficulty.medium:
        maxAddSub = 26; // 0 to 25 (Result max 50)
        maxMultDiv = 11; // 0 to 10 (basic multiplication by halfs of 20)
        break;
      case Difficulty.hard:
        maxAddSub = 51; // 0 to 50 (Result max 100)
        maxMultDiv = 16; // 0 to 15 (basic multiplication by halfs of 30)
        break;
    }
    
    // division
    if (operator == '÷') {
      int factor = random.nextInt(maxMultDiv - 1) + 1; 
      int quotient = random.nextInt(maxMultDiv);
      term2 = factor;
      term1 = factor * quotient;
      result = quotient;

      // multiplication
    } else if (operator == 'x') {
      term1 = random.nextInt(maxMultDiv);
      term2 = random.nextInt(maxMultDiv);
      result = term1 * term2;

      // subtraction
    } else if (operator == '-') {
     term1 = random.nextInt(maxAddSub);
      term2 = random.nextInt(maxAddSub);
      // ensure term1 is greater than or equal to term2
      if (term1 < term2) {
        final temp = term1;
        term1 = term2;
        term2 = temp;
      }
      result = term1 - term2;

      // addition
    } else {
      term1 = random.nextInt(maxAddSub);
      term2 = random.nextInt(maxAddSub);
      result = term1 + term2;
    }
  }

  String get equationString => "$term1 $operator $term2";
}
