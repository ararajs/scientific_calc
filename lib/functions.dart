import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';
import 'package:google_fonts/google_fonts.dart';

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
  List ebreturner () {
    var opp;
    opp = [
      SizedBox(width: 65.0,
          height: 55.0,
          child: FlatButton(color: Color.fromRGBO(37, 39, 50, 1),
            textColor: Colors.white,
            onPressed: () {},
            child: Text("7", style: GoogleFonts.lato(fontSize: 40,),),)),
      SizedBox(width: 65.0,
          height: 55.0,
          child: FlatButton(color: Color.fromRGBO(37, 39, 50, 1),
            textColor: Colors.white,
            onPressed: () {},
            child: Text("8", style: GoogleFonts.lato(fontSize: 40,),),)),
      SizedBox(width: 65.0,
          height: 55.0,
          child: FlatButton(color: Color.fromRGBO(37, 39, 50, 1),
            textColor: Colors.white,
            onPressed: () {},
            child: Text("9", style: GoogleFonts.lato(fontSize: 40,),),)),
      SizedBox(width: 65.0,
          height: 55.0,
          child: FlatButton(color: Color.fromRGBO(129, 90, 160, 0.5),
            textColor: Colors.white,
            onPressed: () {},
            child: Text("DEL", style: GoogleFonts.lato(fontSize: 17,),),)),
      SizedBox(width: 65.0,
          height: 55.0,
          child: FlatButton(color: Color.fromRGBO(129, 90, 160, 0.5),
            textColor: Colors.white,
            onPressed: () {},
            child: Text("AC", style: GoogleFonts.lato(fontSize: 20,),),)),
    ];
    return opp;
  }
}