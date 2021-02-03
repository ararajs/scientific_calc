import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';
import 'functions.dart' as func;


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),

    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final golver = func.Solver();
  final badd = func.ButtonAdd();
  var msg = "";
  var output = "0";
  var temp =  "";

  void outputer(){
    setState((){
      output = golver.solve(msg);
    });
  }

  @override
  void solver(){                              // Solver based on math_expressions. Works fine and outputs it fine.
    setState(() {
      Parser solve = Parser();
      temp = msg;
      temp = temp.replaceAll('x', '*');
      try{
        Expression expr = solve.parse(temp);
        ContextModel cm = ContextModel();
        double ans = expr.evaluate(EvaluationType.REAL, cm);
        output = "$ans";
      }
      catch(err){
        output = "Error";
      }
    });
  }


  void update(x) {                              // button press to key input
    setState(() {
      msg = "$msg$x";
    });
  }
  void all_clear() {                            // All clear - deletes all inputs
    setState(() {
      msg = "";
      output = "0";
    });
  }
  void clear (){
    setState(() {
      if (msg != null && msg.length > 0){
        msg = msg.substring(0, msg.length-1);    //Used to delete char by char
      }
    });
  }

  void result () {
    setState(() {
      output = "$msg";
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget> [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("$msg", textScaleFactor: 2,)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("$output", textScaleFactor: 3, style: TextStyle(color: Colors.black.withOpacity(0.6)),)
                    ],
                  )
                ],

            ),
          ),

          Expanded(
            flex: 2,
            child: Container(
              color: Colors.yellow,
              child: PageView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: badd.ebreturner(1,2.0, 2,2.0, 3,2.0, 4,2.0, 5,2.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("∜");},child: Text('∜', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("∝");},child: Text('∝', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("∫");},child: Text('∫', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("∬");},child: Text('∬', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("∇");},child: Text('∇', textScaleFactor: 2,),)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("<");},child: Text('<', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("∀");},child: Text('∀', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("3");},child: Text('3', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("+");},child: Text('+', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("-");},child: Text('-', textScaleFactor: 2,),)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("0");},child: Text('0', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update(".");},child: Text('.', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("x10^");},child: Text('x10^', textScaleFactor: 0.8,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { result();},child: Text('ANS', textScaleFactor: 1,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("=");},child: Text('=', textScaleFactor: 2,),)),
                        ],
                      ),
                    ],
                    //Jun Hao - trigo
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("∏");},child: Text('∏', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("∘");},child: Text('∘', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("9");},child: Text('9', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { },child: Text('DEL', textScaleFactor: 1.13,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { clear();},child: Text('AC', textScaleFactor: 1.3,),)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("4");},child: Text('4', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("5");},child: Text('5', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("6");},child: Text('6', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("x");},child: Text('x', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("/");},child: Text('/', textScaleFactor: 2,),)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("1");},child: Text('1', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("2");},child: Text('2', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("3");},child: Text('3', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("+");},child: Text('+', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("-");},child: Text('-', textScaleFactor: 2,),)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("0");},child: Text('0', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update(".");},child: Text('.', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("x10^");},child: Text('x10^', textScaleFactor: 0.8,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () {result(); },child: Text('ANS', textScaleFactor: 1,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("=");},child: Text('=', textScaleFactor: 2,),)),
                        ],
                      ),
                    ],
                    // Su Quin - log functions
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("7");},child: Text('7', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("8");},child: Text('8', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("9");},child: Text('9', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { clear();},child: Text('DEL', textScaleFactor: 1.13,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { all_clear();},child: Text('AC', textScaleFactor: 1.3,),)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("4");},child: Text('4', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("5");},child: Text('5', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("6");},child: Text('6', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("x");},child: Text('x', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("/");},child: Text('/', textScaleFactor: 2,),)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("1");},child: Text('1', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("2");},child: Text('2', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("3");},child: Text('3', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("+");},child: Text('+', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("-");},child: Text('-', textScaleFactor: 2,),)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("0");},child: Text('0', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("!");},child: Text('!', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("x10^");},child: Text('x10^', textScaleFactor: 0.8,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () {result(); },child: Text('ANS', textScaleFactor: 1,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("=");},child: Text('=', textScaleFactor: 2,),)),
                        ],
                      ),
                    ],
                    // Aravind - logical operators
                  )
                ]
              )
            ),
          ),
          Expanded(      // Static buttons for simple mathematical calculations
            flex: 2,
            child: Container(
              color: Colors.lightBlue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("7");},child: Text('7', textScaleFactor: 2,),)),
                      SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("8");},child: Text('8', textScaleFactor: 2,),)),
                      SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("9");},child: Text('9', textScaleFactor: 2,),)),
                      SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { clear();},child: Text('DEL', textScaleFactor: 1.13,),)),
                      SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { all_clear();},child: Text('AC', textScaleFactor: 1.3,),)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("4");},child: Text('4', textScaleFactor: 2,),)),
                      SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("5");},child: Text('5', textScaleFactor: 2,),)),
                      SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("6");},child: Text('6', textScaleFactor: 2,),)),
                      SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("x");},child: Text('×', textScaleFactor: 2,),)),
                      SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("/");},child: Text('/', textScaleFactor: 2,),)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("1");},child: Text('1', textScaleFactor: 2,),)),
                      SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("2");},child: Text('2', textScaleFactor: 2,),)),
                      SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("3");},child: Text('3', textScaleFactor: 2,),)),
                      SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("+");},child: Text('+', textScaleFactor: 2,),)),
                      SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("-");},child: Text('-', textScaleFactor: 2,),)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("0");},child: Text('0', textScaleFactor: 2,),)),
                      SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update(".");},child: Text('.', textScaleFactor: 2,),)),
                      SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("x10^");},child: Text('x10^', textScaleFactor: 0.8,),)),
                      SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { result();},child: Text('ANS', textScaleFactor: 1,),)),
                      SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { outputer();},child: Text('=', textScaleFactor: 2,),)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),


    );
  }
}
