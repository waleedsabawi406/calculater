import 'package:flutter/material.dart';

void main() {
  runApp(const MyCalculater());
}

class MyCalculater extends StatelessWidget {
  const MyCalculater({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calaulater(),
    );
  }
}

class Calaulater extends StatefulWidget {
  const Calaulater({super.key});

  @override
  State<Calaulater> createState() => _CalaulaterState();
}

class _CalaulaterState extends State<Calaulater> {
  String text = '0';
  double numOne = 0;
  double numTow = 0;
  String result = '0';
  String finalResult = '0';
  String opr = '';
  String preOpr = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button('C', Color.fromRGBO(165, 165, 165, 1)),
                  button('+/-', Color.fromRGBO(165, 165, 165, 1)),
                  button('%', Color.fromRGBO(165, 165, 165, 1)),
                  button('/', Color.fromRGBO(255, 152, 0, 1)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button('7', Color.fromRGBO(165, 165, 165, 1)),
                  button('8', Color.fromRGBO(165, 165, 165, 1)),
                  button('9', Color.fromRGBO(165, 165, 165, 1)),
                  button('x', Color.fromRGBO(255, 152, 0, 1)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button('4', Color.fromRGBO(165, 165, 165, 1)),
                  button('5', Color.fromRGBO(165, 165, 165, 1)),
                  button('6', Color.fromRGBO(165, 165, 165, 1)),
                  button('-', Color.fromRGBO(255, 152, 0, 1)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button('1', Color.fromRGBO(165, 165, 165, 1)),
                  button('2', Color.fromRGBO(165, 165, 165, 1)),
                  button('3', Color.fromRGBO(165, 165, 165, 1)),
                  button('+', Color.fromRGBO(255, 152, 0, 1)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button('     0     ', Color.fromRGBO(165, 165, 165, 1)),
                  button('.', Color.fromRGBO(165, 165, 165, 1)),
                  button('=', Color.fromRGBO(255, 152, 0, 1)),
                ],
              ),
            ],
          )),
    );
  }

  void calculate(txtBtn) {
    if (txtBtn == 'c') {
      text = '0';
      numOne = 0;
      numTow = 0;
      result = '0';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && txtBtn == '=') {
      switch (preOpr) {
        case '+':
          result = add();
          break;

        case '-':
          result = sub();
          break;

        case '*':
          result = mult();
          break;

        case '/':
          result = div();
          break;
      }
    } else if (txtBtn == '+' ||
        txtBtn == '-' ||
        txtBtn == '*' ||
        txtBtn == '/' ||
        txtBtn == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTow = double.parse(result);
      }

      switch (opr) {
        case '+':
          result = add();
          break;

        case '-':
          result = sub();
          break;

        case '*':
          result = mult();
          break;

        case '/':
          result = div();
          break;
      }
      preOpr = opr;
      opr = txtBtn;
      result = '';
    } else if (txtBtn == '%') {
      result = (numOne / 100).toString();
      finalResult = result;
    } else if (txtBtn == '.') {
      if (!result.contains('.')) result += '.';
      finalResult = result;
    } else if (txtBtn == '+/-') {
      result.startsWith('-')
          ? result = result.substring(1)
          : result = '-' + result;
      finalResult = result;
    } else {
      if (result == 0)
        result = txtBtn;
      else
        result = result + txtBtn;
      finalResult = result;
    }
    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTow).toString();
    numOne = double.parse(result);
    return result;
  }

  String sub() {
    result = (numOne - numTow).toString();
    numOne = double.parse(result);
    return result;
  }

  String mult() {
    result = (numOne * numTow).toString();
    numOne = double.parse(result);
    return result;
  }

  String div() {
    result = (numOne / numTow).toString();
    numOne = double.parse(result);
    return result;
  }

  Widget button(String btnText, Color color) {
    return Container(
      padding: EdgeInsets.only(bottom: 30),
      child: ElevatedButton(
        onPressed: () {
          calculate(btnText);
        },
        child: Text(
          btnText,
          style: TextStyle(fontSize: 40, color: Colors.black),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
    );
  }
}
