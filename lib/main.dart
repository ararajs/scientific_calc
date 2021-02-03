import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';
import 'package:google_fonts/google_fonts.dart';
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
        output = "$temp";
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
            flex: 4,
            child: Container(
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("$msg", textScaleFactor: 2,style: TextStyle(color: Colors.white.withOpacity(1)),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("$output", textScaleFactor: 3, style: TextStyle(color: Colors.white.withOpacity(1)),)
                      ],
                    )
                  ],

              ),
            ),
          ),
          Expanded(
            flex: 1,
              child: Container(
                color: Color.fromRGBO(129, 90, 160, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    SizedBox(width: 85.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(129, 90, 160, 0.5), textColor: Colors.white, onPressed: () {}, child: Text("Menu", style: GoogleFonts.lato(fontSize: 20,),),)),
                    SizedBox(width: 80.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(129, 90, 160, 0.5), textColor: Colors.white, onPressed: () {}, child: Text("Units", style: GoogleFonts.lato(fontSize: 20,),),)),
                    SizedBox(width: 70.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(129, 90, 160, 0.5), textColor: Colors.white, onPressed: () {}, child: Text("<", style: GoogleFonts.lato(fontSize: 40,),),)),
                    SizedBox(width: 70.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(129, 90, 160, 0.5), textColor: Colors.white, onPressed: () {}, child: Text(">", style: GoogleFonts.lato(fontSize: 40,),),)),
                  ],
                ),
              ],
            ),
          ),),

          Expanded(
            flex: 4,
            child: Container(
              color: Color.fromRGBO(31, 33, 34, 1),
              child: PageView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(31, 33, 34, 1), textColor: Colors.white, onPressed: () {update("2");}, child: Text("2", style: GoogleFonts.lato(fontSize: 40,),),)),
                          SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(31, 33, 34, 1), textColor: Colors.white, onPressed: () {}, child: Text("3", style: GoogleFonts.lato(fontSize: 40,),),)),
                          SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(31, 33, 34, 1), textColor: Colors.white, onPressed: () {}, child: Text("2", style: GoogleFonts.lato(fontSize: 40,),),)),
                          SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(31, 33, 34, 1), textColor: Colors.white, onPressed: () {}, child: Text("5", style: GoogleFonts.lato(fontSize: 40,),),)),
                          SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(31, 33, 34, 1), textColor: Colors.white, onPressed: () {}, child: Text("2", style: GoogleFonts.lato(fontSize: 40,),),)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(31, 33, 34, 1), textColor: Colors.white, onPressed: () {}, child: Text("2", style: GoogleFonts.lato(fontSize: 40,),),)),
                          SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(31, 33, 34, 1), textColor: Colors.white, onPressed: () {}, child: Text("3", style: GoogleFonts.lato(fontSize: 40,),),)),
                          SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(31, 33, 34, 1), textColor: Colors.white, onPressed: () {}, child: Text("2", style: GoogleFonts.lato(fontSize: 40,),),)),
                          SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(31, 33, 34, 1), textColor: Colors.white, onPressed: () {}, child: Text("5", style: GoogleFonts.lato(fontSize: 40,),),)),
                          SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(31, 33, 34, 1), textColor: Colors.white, onPressed: () {}, child: Text("2", style: GoogleFonts.lato(fontSize: 40,),),)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(31, 33, 34, 1), textColor: Colors.white, onPressed: () {}, child: Text("2", style: GoogleFonts.lato(fontSize: 40,),),)),
                          SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(31, 33, 34, 1), textColor: Colors.white, onPressed: () {}, child: Text("3", style: GoogleFonts.lato(fontSize: 40,),),)),
                          SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(31, 33, 34, 1), textColor: Colors.white, onPressed: () {}, child: Text("2", style: GoogleFonts.lato(fontSize: 40,),),)),
                          SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(31, 33, 34, 1), textColor: Colors.white, onPressed: () {}, child: Text("5", style: GoogleFonts.lato(fontSize: 40,),),)),
                          SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(31, 33, 34, 1), textColor: Colors.white, onPressed: () {}, child: Text("2", style: GoogleFonts.lato(fontSize: 40,),),)),
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
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update(".");},child: Text('.', textScaleFactor: 2,),)),
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
          Expanded(
            flex: 4,
            child: Container(
              color: Color.fromRGBO(37, 39, 50, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(37, 39, 50, 1), textColor: Colors.white, onPressed: () {update("7");}, child: Text("7", style: GoogleFonts.lato(fontSize: 40,),),)),
                      SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(37, 39, 50, 1), textColor: Colors.white, onPressed: () {update("8");}, child: Text("8", style: GoogleFonts.lato(fontSize: 40,),),)),
                      SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(37, 39, 50, 1), textColor: Colors.white, onPressed: () {update("9");}, child: Text("9", style: GoogleFonts.lato(fontSize: 40,),),)),
                      SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(129, 90, 160, 0.5), textColor: Colors.white, onPressed: () {clear();}, child: Text("DEL", style: GoogleFonts.lato(fontSize: 17,),),)),
                      SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(129, 90, 160, 0.5), textColor: Colors.white, onPressed: () {all_clear();}, child: Text("AC", style: GoogleFonts.lato(fontSize: 20,),),)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(37, 39, 50, 1), textColor: Colors.white, onPressed: () {update("4");}, child: Text("4", style: GoogleFonts.lato(fontSize: 40,),),)),
                      SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(37, 39, 50, 1), textColor: Colors.white, onPressed: () {update("5");}, child: Text("5", style: GoogleFonts.lato(fontSize: 40,),),)),
                      SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(37, 39, 50, 1), textColor: Colors.white, onPressed: () {update("6");}, child: Text("6", style: GoogleFonts.lato(fontSize: 40,),),)),
                      SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(129, 90, 160, 0.5), textColor: Colors.white, onPressed: () {update("x");}, child: Text("x", style: GoogleFonts.lato(fontSize: 40,),),)),
                      SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(129, 90, 160, 0.5), textColor: Colors.white, onPressed: () {update("/");}, child: Text("/", style: GoogleFonts.lato(fontSize: 40,),),)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(37, 39, 50, 1), textColor: Colors.white, onPressed: () {update("1");}, child: Text("1", style: GoogleFonts.lato(fontSize: 40,),),)),
                      SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(37, 39, 50, 1), textColor: Colors.white, onPressed: () {update("2");}, child: Text("2", style: GoogleFonts.lato(fontSize: 40,),),)),
                      SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(37, 39, 50, 1), textColor: Colors.white, onPressed: () {update("3");}, child: Text("3", style: GoogleFonts.lato(fontSize: 40,),),)),
                      SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(129, 90, 160, 0.5), textColor: Colors.white, onPressed: () {update("+");}, child: Text("+", style: GoogleFonts.lato(fontSize: 40,),),)),
                      SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(129, 90, 160, 0.5), textColor: Colors.white, onPressed: () {update("-");}, child: Text("-", style: GoogleFonts.lato(fontSize: 40,),),)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(37, 39, 50, 1), textColor: Colors.white, onPressed: () {update("0");}, child: Text("0", style: GoogleFonts.lato(fontSize: 40,),),)),
                      SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(37, 39, 50, 1), textColor: Colors.white, onPressed: () {update(".");}, child: Text(".", style: GoogleFonts.lato(fontSize: 40,),),)),
                      SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(37, 39, 50, 1), textColor: Colors.white, onPressed: () {update("x10^");}, child: Text("x10^", style: GoogleFonts.lato(fontSize: 40,),),)),
                      SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(129, 90, 160, 0.5), textColor: Colors.white, onPressed: () {result();}, child: Text("ANS", style: GoogleFonts.lato(fontSize: 16,),),)),
                      SizedBox(width: 65.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(129, 90, 160, 0.5), textColor: Colors.white, onPressed: () {outputer();}, child: Text("=", style: GoogleFonts.lato(fontSize: 40,),),)),
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
