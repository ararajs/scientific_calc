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
              color: Colors.red,
            ),
          ),

          Expanded(
            flex: 2,
            child: Container(
                  child: PageView(
                    children: [
                      Column(


                      ),

                      Column(


                      )
                    ],
                  ),
            ),
          ),

          Expanded(
            flex: 3,
            child: Container(
              color: Colors.lightBlue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      SizedBox(width: 65.0, height: 60.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { },child: Text('7', textScaleFactor: 2,),)),
                      SizedBox(width: 65.0, height: 60.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { },child: Text('8', textScaleFactor: 2,),)),
                      SizedBox(width: 65.0, height: 60.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { },child: Text('9', textScaleFactor: 2,),)),
                      SizedBox(width: 65.0, height: 60.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { },child: Text('DEL', textScaleFactor: 1.13,),)),
                      SizedBox(width: 65.0, height: 60.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { },child: Text('AC', textScaleFactor: 1.3,),)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      SizedBox(width: 65.0, height: 60.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { },child: Text('4', textScaleFactor: 2,),)),
                      SizedBox(width: 65.0, height: 60.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { },child: Text('5', textScaleFactor: 2,),)),
                      SizedBox(width: 65.0, height: 60.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { },child: Text('6', textScaleFactor: 2,),)),
                      SizedBox(width: 65.0, height: 60.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { },child: Text('x', textScaleFactor: 2,),)),
                      SizedBox(width: 65.0, height: 60.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { },child: Text('/', textScaleFactor: 2,),)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      SizedBox(width: 65.0, height: 60.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { },child: Text('1', textScaleFactor: 2,),)),
                      SizedBox(width: 65.0, height: 60.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { },child: Text('2', textScaleFactor: 2,),)),
                      SizedBox(width: 65.0, height: 60.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { },child: Text('3', textScaleFactor: 2,),)),
                      SizedBox(width: 65.0, height: 60.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { },child: Text('+', textScaleFactor: 2,),)),
                      SizedBox(width: 65.0, height: 60.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { },child: Text('-', textScaleFactor: 2,),)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      SizedBox(width: 65.0, height: 60.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { },child: Text('0', textScaleFactor: 2,),)),
                      SizedBox(width: 65.0, height: 60.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { },child: Text('.', textScaleFactor: 2,),)),
                      SizedBox(width: 65.0, height: 60.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { },child: Text('x10^', textScaleFactor: 0.8,),)),
                      SizedBox(width: 65.0, height: 60.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { },child: Text('ANS', textScaleFactor: 1,),)),
                      SizedBox(width: 65.0, height: 60.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () { },child: Text('=', textScaleFactor: 2,),)),
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
