import 'package:flutter/material.dart';


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
  @override
  var msg = "";

  void update(x) {
    setState(() {
      msg = "$msg$x";
    });
  }
  void clear(){
    setState(() {
      msg = "";
    });

  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget> [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomRight,
              color: Colors.white,
              child: Text("$msg", textScaleFactor: 2,)
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
                        children: <Widget> [
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("∆");},child: Text('∆', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("ƒ");},child: Text('ƒ', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("∑");},child: Text('∑', textScaleFactor: 2,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("√"); },child: Text('√', textScaleFactor: 1.13,),)),
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("∛");},child: Text('∛', textScaleFactor: 1.3,),)),
                        ],
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
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { },child: Text('ANS', textScaleFactor: 1,),)),
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
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { },child: Text('ANS', textScaleFactor: 1,),)),
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
                          SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { },child: Text('ANS', textScaleFactor: 1,),)),
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
                      SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { },child: Text('ANS', textScaleFactor: 1,),)),
                      SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { update("=");},child: Text('=', textScaleFactor: 2,),)),
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
