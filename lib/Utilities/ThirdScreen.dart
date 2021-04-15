import 'package:extended_math/extended_math.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart' as me;
import 'package:google_fonts/google_fonts.dart';
import 'package:scidart/numdart.dart';
import "package:flutter_app/mathtest.dart" as lp;
import 'dart:convert';
import 'package:equations/equations.dart' as eq;
import 'package:intl/intl.dart';




class FourthScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<FourthScreen> {
  String _selectedText=null;
  final formKey = GlobalKey<FormState>();
  String val;
  List Output = [];
  List PrintList = [];
  String finalString = """""";
  String root1 = "";
  String str_ans = "";
  var x = "";
  String temp = "";
  double a, b ,c;
  var q = 0;
  var ans = "";

  TextEditingController t1 = TextEditingController(text: '');
  TextEditingController t2 = TextEditingController(text: '');
  TextEditingController t3 = TextEditingController(text: '');

  // {x1: 0.5 + -1.3228756555322954i, x2: 0.5 + 1.3228756555322954i}

  doQuadratic() {
    setState(() {
      a = double.parse(t1.text);
      b = double.parse(t2.text);
      c = double.parse(t3.text);
      final q = QuadraticEquation(a: a, b: b, c: c);
      ans = buildString(q.calculate());


    });

    //   setState(() {
    //     double A = double.parse(t1.text);
    //     double B = double.parse(t2.text);
    //     double C = double.parse(t3.text);
    //     final e = eq.Quadratic(
    //         a: eq.Complex(A,0),
    //         b: eq.Complex(B,0),
    //         c: eq.Complex(C,0),
    //     );
    //     Output = e.solutions();
    //     str_ans = Output.toString();
    //     int count = 1;
    //     PrintList = [];
    //
    //     for(eq.Complex value in Output){
    //       var temp = "x$count = "  + value.toString() + " ";
    //       finalString = temp;
    //       PrintList.add(temp);
    //
    //       count++;
    //     }
    //   });
    // }

    // String buildString(List PrintList) {
    //   String str = "";
    //
    //   for (String i in PrintList) {
    //     str += i + " \n\n";
    //   }
    //   return str;
    // }
  }
  String buildString(Map Quadratic) {
    String str = "";

    String x1 = 'x1=' + Quadratic['x1'].toString();
    String x2 = 'x2=' + Quadratic['x2'].toString();

    return x1 + '\n' + x2;
  }

  @override

  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        key: formKey,
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Quadratic equations appear in the format',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red),
                    textAlign: TextAlign.center),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('ax² + bx + c = 0',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.red),
                    textAlign: TextAlign.center),
              ],
            ),

            //
            // switch(val){
            //   case "ax+by=c" :
            Card(
              color: Colors.red[600],
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 35, 15.0, 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      ans,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19, fontFamily: 'Yass.ttf', color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Divider(height: 20, color: Colors.red),



            Row( crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('a:  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
                ),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'coefficent of x²'
                    ),
                    controller: t1,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),


            Row( crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('b:  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
                ),
                SizedBox(
                  width: 270,
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'coefficent of x'
                    ),
                    controller: t2,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),



            Row( crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('c:  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
                ),
                SizedBox(
                  width: 299,
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'the constant'
                    ),
                    controller: t3,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),


            SizedBox(height: 10),



            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  elevation: 8,
                  onPressed: () {
                    //TODO:
                    doQuadratic();
                  },
                  child: Text('SUBMIT',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Yass.ttf',
                    ),
                  ),
                  textColor: Colors.white,
                  color: Colors.red,
                ),
//                  SizedBox(height: 90),
              ],
            ),

            Divider(height: 30, color: Colors.red),


            Column(
              mainAxisAlignment: MainAxisAlignment.end ,
              crossAxisAlignment: CrossAxisAlignment.end,

            ),
          ],
        ),
      ),
    );
  }
}