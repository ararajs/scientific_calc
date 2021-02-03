import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';

class Solver{
    String solve(String input){
      var temp = "";
      Parser solve = Parser();
      temp = input;
      temp = temp.replaceAll("x", "*");
      try{
        Expression expr = solve.parse(temp);
        ContextModel cm = ContextModel();
        double ans = expr.evaluate(EvaluationType.REAL, cm);
        return "$ans";
      }
      catch(err){
        return "Error";
      }
    }
}


class ButtonAdd{
  List ebreturner (x,sx,y,sy,z,sz,a,sa,b, sb){
    var opp;
    opp = [
    SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () {},child: Text('$x', textScaleFactor: sx,),)),
    SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () {},child: Text('$y', textScaleFactor: sy,),)),
    SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () {},child: Text('$z', textScaleFactor: sz,),)),
    SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () {},child: Text('$a', textScaleFactor: sa,),)),
      SizedBox(width: 65.0, height: 55.0,child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.black,), onPressed: () {},child: Text('$b', textScaleFactor: sb,),)),
    ];
    return opp;
  }
}