import 'dart:math';

/// A class representing a mathematical equation with two terms and an operator.
class Equation {
  final int id;
  late int term1;
  late int term2;
  late String operator;
  late int result;

  Equation(this.id) {
    _generateEquation();
  }

  /// Generates a random equation and calculates the result.
  void _generateEquation() {
    final random = Random();
    final operators = ['+', '-', 'x', '÷'];
    operator = operators[random.nextInt(operators.length)];

    // division
    if (operator == '÷') { 
      int factor = random.nextInt(10) + 1;
      int quotient = random.nextInt(10);
      term2 = factor;
      term1 = factor * quotient;
      result = quotient;
    
    // multiplication
    } else if (operator == 'x') { 
      term1 = random.nextInt(11);
      term2 = random.nextInt(11);
      result = term1 * term2;
    
    // subtraction
    } else if (operator == '-') { 
      term1 = random.nextInt(21);
      term2 = random.nextInt(21);
      if (term1 < term2) {
        final temp = term1;
        term1 = term2;
        term2 = temp;
      }
      result = term1 - term2;
    
    // addition
    } else { 
      term1 = random.nextInt(21);
      term2 = random.nextInt(21);
      result = term1 + term2;
    }
  }

  String get equationString => "$term1 $operator $term2";
}