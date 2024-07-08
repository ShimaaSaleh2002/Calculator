import 'package:calc/button.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String screenResult = '';
  String op = '';
  String LHS = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text(
          'Calculator',
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
                  //color: Colors.red,
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  child: Text(
                    screenResult,
                    style: const TextStyle(fontSize: 27),
                  ))),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomButton(label: '7', onClick: onNumClicked),
                CustomButton(label: '8', onClick: onNumClicked),
                CustomButton(label: '9', onClick: onNumClicked),
                CustomButton(label: '-', onClick: onOperatorClicked),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomButton(label: '4', onClick: onNumClicked),
                CustomButton(label: '5', onClick: onNumClicked),
                CustomButton(label: '6', onClick: onNumClicked),
                CustomButton(
                  label: '+',
                  onClick: onOperatorClicked,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomButton(label: '1', onClick: onNumClicked),
                CustomButton(label: '2', onClick: onNumClicked),
                CustomButton(label: '3', onClick: onNumClicked),
                CustomButton(
                  label: '/',
                  onClick: onOperatorClicked,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomButton(label: '.', onClick: onNumClicked),
                CustomButton(label: '0', onClick: onNumClicked),
                CustomButton(
                  label: '=',
                  onClick: onEqualClicked,
                ),
                CustomButton(
                  label: '*',
                  onClick: onOperatorClicked,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  String calculate(String lhs, String op, String rhs) {
    double LHS = double.parse(lhs);
    double RHS = double.parse(rhs);
    double res;
    if (op == '+') {
      res = LHS + RHS;
      return res.toString();
    } else if (op == '-') {
      res = LHS - RHS;
      return res.toString();
    } else if (op == '/') {
      res = LHS / RHS;
      return res.toString();
    } else if (op == '*') {
      res = LHS * RHS;
      return res.toString();
    } else {
      return '';
    }
  }


  onNumClicked(label) {
    if (op == '=') {
      screenResult = '';
      op = '';
      LHS = '';
    }
    screenResult += label;
    setState(() {});
  }

  //LHS OP RHS
  onOperatorClicked(label) {
    if (op.isEmpty) {
      LHS = screenResult;
    } else if (op == '=') {
      op = label;
      //LHS = calculate(LHS, op, screenResult);
    } else {
      LHS = calculate(LHS, op, screenResult);
    }
    op = label;
    screenResult = '';
    setState(() {});
  }

  onEqualClicked(label) {
    screenResult = calculate(LHS, op, screenResult);
    op = label;
    LHS = screenResult;
    setState(() {});
  }
}
