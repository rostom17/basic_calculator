import "package:basic_calculator/controller/input_controller.dart";
import "package:flutter/material.dart";

ButtonStyle outlineButtonSytle(double screenWidth, double screenHeight,
    String buttonName, InputController inputController) {
  return OutlinedButton.styleFrom(
    textStyle: TextStyle(
        fontSize: buttonName == "AC" || buttonName == "+/-" ? 22 : 28,
        fontWeight: FontWeight.bold),
    fixedSize:
        buttonName == "0" ? Size(screenWidth * .46, screenHeight / 10.2) : null,
    backgroundColor: inputController.operatorButtons.contains(buttonName)
        ? Colors.amber
        : inputController.firstRowFadeButtons.contains(buttonName)
            ? Colors.blue.shade500
            : null,
  );
}
