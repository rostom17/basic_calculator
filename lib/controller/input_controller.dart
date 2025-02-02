import 'package:basic_calculator/controller/operations.dart';
import 'package:get/get.dart';

class InputController extends GetxController {
  final List<String> buttonIcons = [
    "AC",
    "+/-",
    "%",
    "/",
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
    ",",
    "="
  ];
  final List<String> operatorButtons = ['+', '-', '*', '/', '='];
  final List<String> firstRowFadeButtons = ["AC", "+/-", "%"];
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
  void input(String x) {
    if (x == "AC") {
      expression = "0";
      output = "0";
      update();
      return;
    }
    if (digits.contains(x)) {
      expression += x;
      update();
      return;
    }
    if (operatorButtons.contains(x)) {
      operator.add(x);
      if (x == "=") {
        List<String> values = expression.split(RegExp(r'[.,+/\-]'));
        double curOutput = Operations.performOperation(
            values.first, values.last, operator.first);
        output = curOutput.toString();
        update();
      } else {
        expression += x;
        update();
      }
    }
  }
}
