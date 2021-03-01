import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_math/flutter_math.dart';




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
        Parser solve = Parser();
        temp = FullInput;
        temp = temp.replaceAll("ANS", PreviousAnswer.toString());
        temp = temp.replaceAll("×", "*");
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







