import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ios_calculator/calculator_constroller.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  CalculatorController calculatorController = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: h * 0.1,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Obx(
                    () => Text(
                      "${calculatorController.userInput.toString()}",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  )),
              SizedBox(
                height: h * 0.01,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Obx(
                    () => Text(
                      "${calculatorController.answer}",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  )),
              SizedBox(
                height: h * 0.12,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: h * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MyButton(
                            text: "Ac",
                            onButtonClick: () {
                              calculatorController.userInput.value = '';
                              calculatorController.answer.value = 0;
                            },
                            color: Colors.grey.shade400,
                          ),
                          MyButton(
                            text: "DEL",
                            onButtonClick: () {
                              calculatorController.userInput.value =
                                  calculatorController.userInput.value
                                      .substring(
                                          0,
                                          calculatorController
                                                  .userInput.value.length -
                                              1);
                            },
                            color: Colors.grey.shade400,
                          ),
                          MyButton(
                            text: "%",
                            onButtonClick: () {
                              calculatorController.userInput.value += '%';
                            },
                            color: Colors.grey.shade400,
                          ),
                          MyButton(
                            text: "/",
                            onButtonClick: () {
                              calculatorController.userInput.value += '/';
                            },
                            color: Colors.amber.shade400,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MyButton(
                            text: "7",
                            onButtonClick: () {
                              calculatorController.userInput.value += '7';
                            },
                          ),
                          MyButton(
                            text: "8",
                            onButtonClick: () {
                              calculatorController.userInput.value += '8';
                            },
                          ),
                          MyButton(
                            text: "0",
                            onButtonClick: () {
                              calculatorController.userInput.value += '0';
                            },
                          ),
                          MyButton(
                            text: "*",
                            onButtonClick: () {
                              {
                                calculatorController.userInput.value += '*';
                              }
                            },
                            color: Colors.amber.shade400,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MyButton(
                            text: "4",
                            onButtonClick: () {
                              calculatorController.userInput.value += '4';
                            },
                          ),
                          MyButton(
                            text: "5",
                            onButtonClick: () {
                              calculatorController.userInput.value += '5';
                            },
                          ),
                          MyButton(
                            text: "6",
                            onButtonClick: () {
                              calculatorController.userInput.value += '6';
                            },
                          ),
                          MyButton(
                            text: "-",
                            onButtonClick: () {
                              calculatorController.userInput.value += '-';
                            },
                            color: Colors.amber.shade400,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MyButton(
                            text: "1",
                            onButtonClick: () {
                              calculatorController.userInput.value += '1';
                            },
                          ),
                          MyButton(
                            text: "2",
                            onButtonClick: () {
                              calculatorController.userInput.value += '2';
                            },
                          ),
                          MyButton(
                            text: "3",
                            onButtonClick: () {
                              calculatorController.userInput.value += '3';
                            },
                          ),
                          MyButton(
                            text: "+",
                            onButtonClick: () {
                              calculatorController.userInput.value += '+';
                            },
                            color: Colors.amber.shade400,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MyButton(
                            text: "0",
                            onButtonClick: () {
                              calculatorController.userInput.value += '0';
                            },
                          ),
                          MyButton(
                            text: ".",
                            onButtonClick: () {
                              calculatorController.userInput.value += '.';
                            },
                          ),
                          MyButton(
                            text: "00",
                            onButtonClick: () {
                              calculatorController.userInput.value += '00';
                            },
                          ),
                          MyButton(
                            text: "=",
                            onButtonClick: () {
                              calculatorController.calculate();
                            },
                            color: Colors.amber.shade400,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.text,
    required this.onButtonClick,
    this.color,
  }) : super(key: key);

  final String text;
  final VoidCallback onButtonClick;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: h * 0.08,
      width: w * 0.23,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Colors.grey.shade600,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
        ),
        onPressed: onButtonClick,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
