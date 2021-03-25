import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart' as me;
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_math/flutter_math.dart';
import 'package:flutter_app/mathtest.dart' as lp;
import 'main.dart';

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
  var func_dict = [r"\tan", r"\sin", r"\ln", r"\cos", r"\cot", r"\csc", r"\sec", r"\arcsin", r"\arcos", r"arctan"];

  void ButtonPressed(String input){
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
        var temp = "";
        me.Parser solve = me.Parser();
        temp = FullInput;
        temp = temp.replaceAll("ANS", PreviousAnswer.toString());
        lp.LaTexParser LpParser = lp.LaTexParser(temp);
        var normal_expr = LpParser.parse().toString();
        //temp = temp.replaceAll(r"\times", "*"); redundant now since it is taken care by latexparser
        //temp = temp.replaceAll(r"\div", "/");
        try {
          me.Expression expr = solve.parse(normal_expr);
          me.ContextModel cm = me.ContextModel();
          String ans = expr.evaluate(me.EvaluationType.REAL, cm).toString();
          while ((ans.contains('.') && ans.endsWith('0')) ||
              ans.endsWith('.')) {
            ans = ans.substring(0, ans.length - 1);
          }
          if (ans.contains(".")){
            var val = double.parse(ans);
            ans = val.toStringAsFixed(5);
          }
          Set_Output(ans);
        }
        catch(err) {
          Set_Output(normal_expr.toString());
        }
      }

    else if (func_dict.contains(input)){
        Update_Input("$input");
        Update_Input("(");
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
      child: Stack(children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Container(
            child: FlatButton(
              color: Color.fromRGBO(Colorlist[0], Colorlist[1], Colorlist[2], Colorlist[3]),
              onPressed: () {ButtonPressed(this.Input);},
        ),
          )

        ),
        Align(
          alignment: Alignment.center,
            child: IgnorePointer(
              ignoring: true,
              child: Text(
                this.symb.toString(),style: TextStyle(fontSize: this.Size, color: Colors.white,),),
            ),
          ),
      ]),
    );
  }


}



