import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:basic_calculator/controller/input_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final InputController inputController = Get.put(InputController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GetBuilder<InputController>(builder: (inputControllerInstance) {
              return SingleChildScrollView(
                reverse: true,
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(inputControllerInstance.output,
                          style: Theme.of(context).textTheme.displayLarge),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        inputControllerInstance.expression,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(
              height: 24,
            ),
            Wrap(
              children:
                  _buildCalculatorButtons(screenSize.height, screenSize.width),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCalculatorButtons(
      double screenHeight, double screenWidth) {
    return inputController.buttonIcons.map((items) {
      return Padding(
        padding: EdgeInsets.all(7),
        child: OutlinedButton(
          style: _outlineButtonSytle(screenWidth, screenHeight, items),
          onPressed: () {
            inputController.input(items);
          },
          child: Text(items),
        ),
      );
    }).toList();
  }

  ButtonStyle _outlineButtonSytle(
      double screenWidth, double screenHeight, String buttonName) {
    return OutlinedButton.styleFrom(
      textStyle: TextStyle(
          fontSize: buttonName == "AC" || buttonName == "+/-" ? 22 : 28,
          fontWeight: FontWeight.bold),
      fixedSize: buttonName == "0"
          ? Size(screenWidth * .46, screenHeight / 10.2)
          : null,
      backgroundColor: inputController.operatorButtons.contains(buttonName)
          ? Colors.amber
          : inputController.firstRowFadeButtons.contains(buttonName)
              ? Colors.blue.shade500
              : null,
    );
  }
}
