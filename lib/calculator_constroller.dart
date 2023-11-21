import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  RxString userInput = ''.obs;
  RxDouble answer =
      0.0.obs; // Use RxDouble for compatibility with double values

  void calculate() {
    String finalUserInput = userInput.value;

    Parser p = Parser();

    Expression exp = p.parse(finalUserInput);

    ContextModel cm = ContextModel();

    double eval = exp.evaluate(EvaluationType.REAL, cm);

    // Check if the result is an integer

    answer.value = eval; // Convert to double if it's a whole number
  }
}
