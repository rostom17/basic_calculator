class Operations {
  static double performOperation(
      String firstValue, String lastValue, String operator) {
    double x = double.tryParse(firstValue) ?? 0;
    double y = double.tryParse(lastValue) ?? 0;
    print("$x, $y, $operator");
    switch (operator) {
      case "+":
        return x + y;
      case "-":
        return x - y;
      case "*":
        return x * y;
      case "/":
        return x / y;
      default:
        return 90.9;
    }
  }
}
