import 'package:extended_math/extended_math.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:extended_math/extended_math.dart';
import 'package:scidart/numdart.dart';

/*
class Button extends StatelessWidget{
  final List Colorlist;
  final double Size;
  final Input;
  final symb;
  final String FullInput;
  final String PreviousAnswer;
  final ValueChanged<String> Set_Output;
  final ValueChanged<String> Set_Input;
  final ValueChanged<String> Update_Input;

  Button({this.Update_Input, this.Input, this.Set_Output, this.Set_Input, this.FullInput, this.Colorlist, this.Size, this.PreviousAnswer, this.symb,});

  void ButtonPressed(String input){
    if (input == "DEL"){
      if (FullInput != null && FullInput.length > 0){
        Set_Input(FullInput.substring(0, FullInput.length - 1));
      }
    }
    else if (input == "AC"){
      Set_Output("0");
      Set_Input("");
    }
    else if (input == "ANS"){
      Update_Input("ANS");
    }
    else if (input == "=") {
      var temp = "";
      Parser solve = Parser();
      temp = FullInput;
      temp = temp.replaceAll("ANS", PreviousAnswer.toString());
      temp = temp.replaceAll(r"\times", "*");
      temp = temp.replaceAll(r"\div", "/");

      try {

        Expression expr = solve.parse(temp);
        ContextModel cm = ContextModel();
        String ans = expr.evaluate(EvaluationType.REAL, cm).toString();

        while ((ans.contains('.') && ans.endsWith('0')) ||
            ans.endsWith('.')) {
          ans = ans.substring(0, ans.length - 1);

        }
        Set_Output(ans);
      }
      catch(err) {
        Set_Output("Error");
      }
    }
    else{
      Update_Input("$input");
    }
  }

//129, 90, 160, 0.5 for lighter purple with font size, 17, 20


  Widget build(BuildContext context){
    return SizedBox(
      width: 65.0,
      height: 55.0,
      child: FlatButton(
        color: Color.fromRGBO(Colorlist[0], Colorlist[1], Colorlist[2], Colorlist[3]),
        textColor: Colors.white,
        onPressed: () {ButtonPressed(this.Input);},
        child: Text(this.symb.toString(),style: TextStyle(fontSize: this.Size),),
      ),
    );
  }
}


 */

class Equation2 extends StatelessWidget{
  final List Colorlist;
  final double Size;
  final Input;
  final symb;
  final String FullInput, FullInput2, FullInput3;
  final ValueChanged<String> Set_Output;
  final ValueChanged<String> Set_Input;
  final ValueChanged<String> Update_Input;
  Equation2({this.Update_Input, this.Input, this.Set_Output, this.Set_Input, this.FullInput, this.symb, this.FullInput2, this.FullInput3, this.Colorlist, this.Size,});

  void Equation2Pressed(String input){
    if (input == "DEL"){
      if (FullInput != null && FullInput.length > 0) {
        Set_Input(FullInput.substring(0, FullInput.length - 1));
      }
    }
    else if (input == "AC"){
      Set_Output("0");
      Set_Input("");
    }
    else if (input == "ANS"){
      Update_Input("ANS");
      //
    }
    else if (input == "=") {
      var temp = "", temp2 = "", temp3 = "";
      temp = FullInput; temp2 = FullInput2; temp3 = FullInput3;

      try {
        var element2 = double.parse(temp2);
        var element3 = double.parse(temp3);
        var element1 = double.parse(temp);

        final q = QuadraticEquation(a: element1, b:element2, c: element3);
        var ans = q.calculate().toString();

        while ((ans.contains('.') && ans.endsWith('0')) ||
            ans.endsWith('.')) {
          ans = ans.substring(0, ans.length - 1);

        }
        Set_Output(ans);
      }
      catch(err) {
        Set_Output("Error");
      }
    }
    else{
      Update_Input("$input");
    }
  }

  Widget build(BuildContext context){
    return SizedBox(
      width: 65.0,
      height: 55.0,
      child: FlatButton(
        color: Color.fromRGBO(Colorlist[0], Colorlist[1], Colorlist[2], Colorlist[3]),
        textColor: Colors.white,
        onPressed: () {Equation2Pressed(this.Input);},
        child: Text(this.symb.toString(),style: TextStyle(fontSize: this.Size),),
      ),
    );
  }

}

class Equation3 extends StatelessWidget{
  final List Colorlist;
  final double Size;
  final Input;
  final symb;
  final String FullInput, FullInput2, FullInput3, FullInput4;
  final ValueChanged<String> Set_Output;
  final ValueChanged<String> Set_Input;
  final ValueChanged<String> Update_Input;
  Equation3({this.Update_Input, this.Input, this.Set_Output, this.Set_Input, this.FullInput, this.symb, this.FullInput2, this.FullInput3, this.FullInput4, this.Colorlist, this.Size,});

  void Equation3Pressed(String input){
    if (input == "DEL"){
      if (FullInput != null && FullInput.length > 0) {
        Set_Input(FullInput.substring(0, FullInput.length - 1));
      }
    }
    else if (input == "AC"){
      Set_Output("0");
      Set_Input("");
    }
    else if (input == "ANS"){
      Update_Input("ANS");
      //
    }
    else if (input == "=") {
      var temp = "", temp2 = "", temp3 = "", temp4 = "";
      temp = FullInput; temp2 = FullInput2; temp3 = FullInput3; temp4 = FullInput4;

      try {
        var element2 = double.parse(temp2);
        var element3 = double.parse(temp3);
        var element4 = double.parse(temp4);
        var element1 = double.parse(temp);

        final q = CubicEquation(a: element1, b: element2, c: element3, d: element4);
        var ans = q.calculate().toString();

        while ((ans.contains('.') && ans.endsWith('0')) ||
            ans.endsWith('.')) {
          ans = ans.substring(0, ans.length - 1);

        }
        Set_Output(ans);
      }
      catch(err) {
        Set_Output("Error");
      }
    }
    else{
      Update_Input("$input");
    }
  }


  Widget build(BuildContext context){
    return SizedBox(
      width: 65.0,
      height: 55.0,
      child: FlatButton(
        color: Color.fromRGBO(Colorlist[0], Colorlist[1], Colorlist[2], Colorlist[3]),
        textColor: Colors.white,
        onPressed: () {Equation3Pressed(this.Input);},
        child: Text(this.symb.toString(),style: TextStyle(fontSize: this.Size),),
      ),
    );
  }

}

class Integration extends StatelessWidget{
  final List Colorlist;
  final double Size;
  final Input;
  final symb;
  final String FullInput, Inputa, Inputb;
  final String PreviousAnswer;
  final ValueChanged<String> Set_Output;
  final ValueChanged<String> Set_Input;
  final ValueChanged<String> Update_Input;

  Integration({this.Update_Input, this.Input, this.Set_Output, this.Set_Input, this.FullInput, this.Colorlist, this.Size, this.PreviousAnswer, this.symb, this.Inputa, this.Inputb,});

  void IntegrationPressed(String input){
    if (input == "DEL"){
      if ((FullInput != null && FullInput.length > 0) || (Inputa != null && Inputa.length > 0) || (Inputb != null && Inputb.length > 0)){
        Set_Input(FullInput.substring(0, FullInput.length - 1));
        Set_Input(Inputa.substring(0, Inputa.length - 1));
        Set_Input(Inputb.substring(0, Inputb.length - 1));
      }
    }
    else if (input == "AC"){
      Set_Output("0");
      Set_Input("");
    }
    else if (input == "ANS"){
      Update_Input("ANS");
      //
    }
    else if (input == "=") {
      var temp = "", top = "", bottom = "";
      Parser solve = Parser();
      temp = FullInput; bottom = Inputa; top = Inputb;
      temp = temp.replaceAll("ANS", PreviousAnswer.toString());
      temp = temp.replaceAll(r"\times", "*");
      temp = temp.replaceAll(r"\div", "/");

      try {
        Expression expr = solve.parse(temp);
        ContextModel cm = ContextModel();
        String tp = expr.evaluate(EvaluationType.REAL, cm).toString();

        var y = Array([-1, -1, -1, -1, 1, 1, 1, 1]); // function y points
        var x = arange(stop: 8); // function x points

        // array integration
        simpsArray(y, x: x); // integration with Simpson's rule

        var start = double.parse(bottom);
        var end = double.parse(top); //convert a, b string to double

        var tep = double.parse(tp);//convert temp string to double
        var f = (x) => tep; // function definition: y = x^2
        var a = start; // start integration interval
        var b = end; // end integration interval
        var n = 20; // number of point between a and b

        var integrate = simpsFunction(a, b, n, f); // integration using Simpson's rule
        var ans = integrate.toString();
        print(ans);

        while ((ans.contains('.') && ans.endsWith('0')) ||
            ans.endsWith('.')) {
          ans = ans.substring(0, ans.length - 1);

        }
        Set_Output(ans);
      }
      catch(err) {
        Set_Output("Error");
      }
    }
    else{
      Update_Input("$input");
    }
  }


  Widget build(BuildContext context){
    return SizedBox(
      width: 65.0,
      height: 55.0,
      child: FlatButton(
        color: Color.fromRGBO(Colorlist[0], Colorlist[1], Colorlist[2], Colorlist[3]),
        textColor: Colors.white,
        onPressed: () {IntegrationPressed(this.Input);},
        child: Text(this.symb.toString(),style: TextStyle(fontSize: this.Size),),
      ),
    );
  }
}






