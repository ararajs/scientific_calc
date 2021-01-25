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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget> [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
            ),
          ),

          Expanded(
            flex: 2,
            child: Container(
              color: Colors.yellow,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children:[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red,onPrimary: Colors.black,), onPressed: () { },child: Text('1'),),
                      ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red,onPrimary: Colors.black,), onPressed: () { },child: Text('2'),),
                      ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red,onPrimary: Colors.black,), onPressed: () { },child: Text('3'),),
                      ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red,onPrimary: Colors.black,), onPressed: () { },child: Text('+'),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red,onPrimary: Colors.black,), onPressed: () { },child: Text('4'),),
                      ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red,onPrimary: Colors.black,), onPressed: () { },child: Text('5'),),
                      ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red,onPrimary: Colors.black,), onPressed: () { },child: Text('6'),),
                      ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red,onPrimary: Colors.black,), onPressed: () { },child: Text('-'),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red,onPrimary: Colors.black,), onPressed: () { },child: Text('7'),),
                      ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red,onPrimary: Colors.black,), onPressed: () { },child: Text('8'),),
                      ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red,onPrimary: Colors.black,), onPressed: () { },child: Text('9'),),
                      ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red,onPrimary: Colors.black,), onPressed: () { },child: Text('x'),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red,onPrimary: Colors.black,), onPressed: () { },child: Text('.'),),
                      ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red,onPrimary: Colors.black,), onPressed: () { },child: Text('0'),),
                      ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red,onPrimary: Colors.black,), onPressed: () { },child: Text('='),),
                      ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red,onPrimary: Colors.black,), onPressed: () { },child: Text('÷'),),
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
