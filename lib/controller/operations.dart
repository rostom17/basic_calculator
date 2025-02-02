class Operations {
  static double performOperation(
      String firstValue, String lastValue, String operator) {
    double x = double.tryParse(firstValue) ?? 0;
    double y = double.tryParse(lastValue) ?? 0;

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
        return 0.00;
    }
  }
}
