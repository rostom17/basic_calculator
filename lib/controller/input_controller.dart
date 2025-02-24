import 'package:basic_calculator/controller/operations.dart';
import 'package:get/get.dart';

class InputController extends GetxController {
  final List<String> buttonIcons = [
    "AC",
    "⌫",
    "%",
    "÷",
    "7",
    "8",
    "9",
    "*",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "0",
    ".",
    "="
  ];
  final List<String> operatorButtons = ['+', '-', '*', '÷', '%', '='];
  final List<String> firstRowFadeButtons = [
    "AC",
    "⌫",
  ];
  final List<String> digits = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '0'
  ];

  String output = "0";
  String expression = "0";
  List<String> operator = [];
  bool hasPoint = false;
  void input(String x) {
    if (x == "AC") {
      expression = "0";
      output = "0";
      hasPoint = false;
      operator.clear();
      update();
      return;
    }
    if (x == "⌫") {
      if (expression == "0") {
        return;
      }
      if (expression.length == 1) {
        expression = "0";
        update();
        return;
      } else {
        expression = expression.substring(0, expression.length - 1);
        update();
        return;
      }
    }
    if (digits.contains(x)) {
      expression += x;
      if (expression.length == 2 && expression[1] != '.') {
        expression = removeLeadingZero(expression);
      }
      update();
      return;
    }
    if (x == ".") {
      if (!hasPoint) {
        expression += x;
      }
      hasPoint = true;
      update();
      return;
    }
    if (operatorButtons.contains(x)) {
      operator.add(x);
      hasPoint = false;
      if (x == "=") {
        List<String> values = expression.split(RegExp(r"[%÷*+-]"));
        print("\n\n");
        print("\n\n\n$values\n\n\n");
        print("\n\n");
        double curOutput = Operations.performOperation(
            values.first, values.last, operator.first);
        output = formatOutput(curOutput);
        operator.clear();
        update();
      } else {
        expression += x;
        update();
      }
    }
  }

  String removeLeadingZero(String str) {
    return str.startsWith('0') ? str.substring(1) : str;
  }

  String formatOutput(double value) {
    if (value % 1 == 0) {
      return value.toInt().toString();
    } else {
      return value.toStringAsFixed(2);
    }
  }
}
