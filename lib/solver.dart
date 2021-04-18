import 'package:extended_math/extended_math.dart' as ex;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart' as me;
import 'package:google_fonts/google_fonts.dart';
import 'package:extended_math/extended_math.dart';
import 'package:scidart/numdart.dart';
import "package:flutter_app/mathtest.dart" as lp;


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



class IntConverter {
  final String input;
  final int Precision;
  final bool isRadMode;
  IntConverter(this.input, this.Precision, this.isRadMode);

  String decode(){
    String temp = input.replaceAll(r"\int_", "");
    RegExp exp = RegExp(r"\\left\(.*\\right\)");
    String match = exp.stringMatch(temp);
    String func = match.toString();
    lp.LaTexParser Lparser = lp.LaTexParser(func);
    me.Expression expr = Lparser.parse();
    temp = temp.replaceAll(func, "");
    me.Variable x = me.Variable('x');
    var limits = temp.split("^");
    lp.LaTexParser Limit1Parser = lp.LaTexParser(limits[0]);
    lp.LaTexParser Limit2Parser = lp.LaTexParser(limits[1]);
    me.Expression Limit1 = Limit1Parser.parse();
    me.Expression Limit2 = Limit2Parser.parse();
    me.ContextModel cm = me.ContextModel();
    double a = Limit1.evaluate(me.EvaluationType.REAL, cm);
    double b = Limit2.evaluate(me.EvaluationType.REAL, cm);
    var n =  200000;
    var h = (b-a)/n;
    var ans = 0.0;
    for (int i = 0; i <= n; i++ ){
      var j = a+h*i;
      me.ContextModel cm = me.ContextModel();
      cm.bindVariable(x, me.Number(j));
      String tp = expr.evaluate(me.EvaluationType.REAL, cm).toString();
      var out =  double.parse(tp);
      if (i % 2 == 0){
        ans += 4*out;
      }
      else{
        ans += 2*out;
      }
    }
    var output = h/3 * ans;
    return output.toStringAsFixed(this.Precision);
    }
}

class DiffConverter {
  final String input;
  final int Precision;
  final bool isRadMode;
  DiffConverter(this.input, this.Precision, this.isRadMode);

  String decode(){
    String temp = input.replaceAll(r"\frac{d}{dx}", "");
    RegExp exp = RegExp(r"\\left\(.*\\right\)|\{x.*\}");
    Iterable<RegExpMatch> matches  = exp.allMatches(input);
    if (matches.length != 2) {
      return "0";
    }
    else {
      List match = matches.toList();
      String func = input.substring(match[0].start, match[0].end);
      String x_val = input.substring(match[1].start, match[1].end);
      x_val = x_val.replaceAll("x=", "");
      lp.LaTexParser FuncParser = lp.LaTexParser(func);
      lp.LaTexParser XValParser = lp.LaTexParser(x_val);
      me.Expression FuncExp = FuncParser.parse();
      me.Expression XExp = XValParser.parse();
      me.ContextModel cm =  me.ContextModel();
      double conv_x_val = XExp.evaluate(me.EvaluationType.REAL, cm);

      me.Variable x = me.Variable("x");
      double h = 0.0000000001;

      cm.bindVariable(x, me.Number(conv_x_val));

      double fx = FuncExp.evaluate(me.EvaluationType.REAL, cm);

      cm.bindVariable(x, me.Number(conv_x_val+h));

      double fxh = FuncExp.evaluate(me.EvaluationType.REAL, cm);

      double ans = (fxh-fx)/h;

      return ans.toStringAsFixed(Precision);
    }
  }
}

class NumericalAnalysis {
  final String input;
  final Precision;
  NumericalAnalysis(this.input, this.Precision);


  String decode () {
    RegExp regstr = RegExp(r"[^=]+");
    Iterable<RegExpMatch> matches = regstr.allMatches(input);
    if (matches.length != 2) {
      return "0";
    }
    else {
      List match = matches.toList();
      String LHS = input.substring(match[0].start, match[0].end);
      print(LHS);
      String RHS = input.substring(match[1].start, match[1].end);
      print(RHS);
      lp.LaTexParser LHSParser = lp.LaTexParser(LHS);
      lp.LaTexParser RHSParser = lp.LaTexParser(RHS);
      me.Expression LHSexp =LHSParser.parse();
      me.Expression RHSexp = RHSParser.parse();
      String function = LHSexp.toString() + " - " + RHSexp.toString();
      print(function);
      me.Parser solver = me.Parser();
      me.Expression mathexp = solver.parse(function);
      me.Variable x = me.Variable("x");
      double x_v = 1.0;
      var h = 0.000001;
      var delta = 0.0001;
      int counter = 0;
      bool Loop = true;
      while (Loop){
          if (counter > 2000){
            return "NaN";
          }
          me.ContextModel cm1 = me.ContextModel();
          cm1.bindVariable(x, me.Number(x_v));
          double fx1 = mathexp.evaluate(me.EvaluationType.REAL, cm1);
          cm1.bindVariable(x, me.Number(x_v+h));
          double fx2 = mathexp.evaluate(me.EvaluationType.REAL, cm1);
          double dfxv = (fx2-fx1)/h;

        if (dfxv == 0.0){
          x_v += 1.0;
          continue;
        }
        else{
          me.ContextModel cm = me.ContextModel();
          cm.bindVariable(x, me.Number(x_v));
          double fx = mathexp.evaluate(me.EvaluationType.REAL, cm);
          double curr_xv = x_v;
          x_v = x_v - fx/dfxv;
          print(x_v);
          if ((curr_xv - x_v).abs() < delta){
            Loop = false;
            return x_v.toStringAsFixed(Precision);
          }
          counter += 1;
        }
      }

    }
  }
}

class ComplexConv {
  final String input;
  final Precision;
  final isRadMode;
  ComplexConv({this.input, this.Precision, this.isRadMode});

  String decode(){
    lp.LaTexParser Parser = lp.LaTexParser(input);
    me.Expression parsedExp = Parser.parse();
    String parsedString = parsedExp.toString();
    RegExp regstr = RegExp(r"\(.+?i\)|\d*\.+?\d+[i]*|/|\+|\*|-");
    Iterable<RegExpMatch> matches = regstr.allMatches(parsedString);
    List match = matches.toList();
    List vals = [];
    var y = parsedString;
    for (int i = 0; i<matches.length; i++){
      var x = parsedString.substring(match[i].start, match[i].end);
      if (x == "+" || x == "-" || x== "*" || x=="/") {
        vals.add(x);
      }
      else{
        x = x.replaceAll("(", "");
        x = x.replaceAll(")", "");
        ex.Complex cx = str2complex(x);
        vals.add(cx);
      }
    }
    print(vals);
    List trial = ShuntingYard(vals);
    ex.Complex output = CompParser(trial);

    String true_str = "$output";
    print(true_str);
    String output_str = Str2Deci(true_str);

    return output_str;
  }

  ex.Complex str2complex (String input){
    input = input.replaceAll(" ", "");
    input = input.replaceAll("*", "");
    input = input.replaceAll(",", "");
    var c_i = "i".allMatches(input).length;
    var c_sin = "sin".allMatches(input).length;
    var c_asin = "arcsin".allMatches(input).length;
    print(input);
    RegExp opStr = RegExp(r"\+|-");
    Iterable<RegExpMatch> op_matches = opStr.allMatches(input);
    List op_match = op_matches.toList();
    List op = [];
    RegExp valStr = RegExp(r"[^+-]+");
    Iterable<RegExpMatch> val_matches = valStr.allMatches(input);
    List val_match = val_matches.toList();
    List val = [];
    for (int i = 0; i < val_matches.length; i++){
     val.add(input.substring(val_match[i].start, val_match[i].end));
    }

    List Rectifier (List val) {
      for (int i = 0; i < val.length; i++) {
        if (val[i].contains("^")) {
          List temp = val[i].split("^");
          for (int j = 0; j < temp.length; j++) {
            temp[j] = "(" + temp[j] + ")";
          }
          String output = temp.join("^");
          val[i] = output;
        }
        else if (val[i].contains("log")) {
          String temp = val[i].replaceAll("log", "");
          val[i] = "log(" + temp + ")";
        }
      }
      return val;
    }
    for (int i = 0; i < op_matches.length; i++){
      op.add(input.substring(op_match[i].start, op_match[i].end));
    }
    if (op.length == 2){
      String re =  val[1];
      if (val[2] == "i"){
        val[2] = "1i";
      }
      if (op[0] == "+"){
        op[0] = "";
      }
      String im = val[2].replaceAll("i", "");
      List ConvList = [re, im];
      ConvList = Rectifier(ConvList);
      String re1 = "-" + ConvList[0];
      String im1 = op[1] +  ConvList[1];
      me.Parser MeSolver = me.Parser();
      me.ContextModel cm = me.ContextModel();
      me.Expression ReExp = MeSolver.parse(re1);
      me.Expression ImExp = MeSolver.parse(im1);
      double Re = ReExp.evaluate(me.EvaluationType.REAL, cm);
      double Im = ImExp.evaluate(me.EvaluationType.REAL, cm);
      ex.Complex comp = ex.Complex(re: Re, im: Im);
      return comp;
      }
    else if (op.length == 1){
      if (input.contains("i")) {
        if (val.length == 2){
          if (val[1] == "i"){
            val[1] = "1i";
          }
          if (op[0] == "+"){
            op[0] = "";
          }
          String re =  val[0];
          String im = val[1].replaceAll("i", "");
          List ConvList = [re, im];
          ConvList = Rectifier(ConvList);
          print(ConvList);
          String re1 = ConvList[0];
          String im1 = op[0] + ConvList[1];
          me.Parser MeSolver = me.Parser();
          me.ContextModel cm = me.ContextModel();
          me.Expression ReExp = MeSolver.parse(re1);
          me.Expression ImExp = MeSolver.parse(im1);
          double Re = ReExp.evaluate(me.EvaluationType.REAL, cm);
          double Im = ImExp.evaluate(me.EvaluationType.REAL, cm);
          ex.Complex comp = ex.Complex(re: Re, im: Im);
          return comp;
        }
        else {
          if (val[0] == "i"){
            val[0] = "1i";
          }
          String im =  val[0].replaceAll("i", "");
          List ConvList = [im];
          ConvList = Rectifier(ConvList);
          String im1 = "-" + ConvList[0];
          me.Parser MeSolver = me.Parser();
          me.ContextModel cm = me.ContextModel();
          me.Expression ImExp = MeSolver.parse(im1);
          double Im = ImExp.evaluate(me.EvaluationType.REAL, cm);
          ex.Complex comp = ex.Complex(re:0.0, im: Im);
          return comp;
        }
      }
      else {
        String re =  val[0];
        List ConvList = [re];
        ConvList = Rectifier(ConvList);
        String re1 = "-" +ConvList[0];
        me.Parser MeSolver = me.Parser();
        me.ContextModel cm = me.ContextModel();
        me.Expression ReExp = MeSolver.parse(re1);

        double Re = ReExp.evaluate(me.EvaluationType.REAL, cm);
        ex.Complex comp = ex.Complex(re: Re, im: 0.0);
        return comp;
      }
    }
    else {
      if (input.contains("i")) {
        if (val[0] == "i"){
          val[0] = "1i";
        }
        String im = val[0].replaceAll("i", "");
        List ConvList = [im];
        ConvList = Rectifier(ConvList);
        String im1 = ConvList[0];
        me.Parser MeSolver = me.Parser();
        me.ContextModel cm = me.ContextModel();
        me.Expression ImExp = MeSolver.parse(im1);
        double Im = ImExp.evaluate(me.EvaluationType.REAL, cm);
        ex.Complex comp = ex.Complex(re: 0.0, im: Im);
        return comp;
      }
      else{
        String re = val[0];
        List ConvList = [re];
        ConvList = Rectifier(ConvList);
        String re1 = ConvList[0];
        me.Parser MeSolver = me.Parser();
        me.ContextModel cm = me.ContextModel();
        me.Expression ReExp = MeSolver.parse(re1);
        double Re = ReExp.evaluate(me.EvaluationType.REAL, cm);
        ex.Complex comp = ex.Complex(re: Re, im: 0.0);
        return comp;
      }
    }



}

  List ShuntingYard(List input){
    List OperStack = [];
    List FinalStack = [];
    for (int i = 0; i < input.length; i++){
        if (input[i] == "+" || input[i] == "-" || input[i]== "*" || input[i]=="/") {
          if (OperStack.isEmpty){
            OperStack.add(input[i]);
          }
          else{
            if (getPrio(input[i]) > getPrio(OperStack.last)){
              OperStack.add(input[i]);
            }
            else{
              while(OperStack.isNotEmpty){
                FinalStack.add(OperStack.removeLast());
              }
              OperStack.add(input[i]);
            }
          }
        }
        else {
          FinalStack.add(input[i]);
        }


    }
    while(OperStack.isNotEmpty){
      FinalStack.add(OperStack.removeLast());
    }
    return FinalStack;

  }

  ex.Complex CompParser(List input){
    List result = [];
    for (int i =0; i<input.length; i++){
      switch (input[i]){
        case "*":
          var last = result.removeLast();
          var first = result.removeLast();
          result.add(last*first);
          break;
        case "/":
          var den = result.removeLast();
          var num = result.removeLast();
          result.add(num/den);
          break;
        case "+":
          var second = result.removeLast();
          var first = result.removeLast();
          result.add(first+second);
          break;
        case "-":
          var second = result.removeLast();
          var first = result.removeLast();
          result.add(first-second);
          break;
        default:
          result.add(input[i]);
      }
    }
    return result[0];

  }


  int getPrio (String inp){
    switch(inp){
      case "+":
        return 1;
        break;
      case "-":
        return 1;
        break;
      case "*":
        return 2;
        break;
      case "/":
        return 2;
        break;
      default:
        return 0;
        break;
    }
  }

  String Str2Deci(String input){
    input = input.replaceAll(" ", "");
    RegExp opStr = RegExp(r"\+|-");
    Iterable<RegExpMatch> op_matches = opStr.allMatches(input);
    List op_match = op_matches.toList();
    RegExp valStr = RegExp(r"[^+-]+");
    Iterable<RegExpMatch> val_matches = valStr.allMatches(input);
    List val_match = val_matches.toList();
    List val = [];
    List op = [];
    for (int i = 0; i < val_matches.length; i++){
      String x = input.substring(val_match[i].start, val_match[i].end);
      if (x=="i"){
        val.add("1i");
      }
      else{
        val.add(x);
      }
    }
    for (int i = 0; i < op_matches.length; i++){
      op.add(input.substring(op_match[i].start, op_match[i].end));
    }
    if (op.length == 3){
      String re = val[0];
      String im = val[1].replaceAll("i", "");
      double Re = double.parse(re);
      double Im = double.parse(im);
      return "-" + Re.toStringAsFixed(Precision) + " - " + Im.toStringAsFixed(Precision) + "i";
    }
    else if (op.length == 2){
      if (op[0] == "-"){
        String re = val[0];
        String im = val[1].replaceAll("i", "");
        double Re = double.parse(re);
        double Im = double.parse(im);
        return "-" + Re.toStringAsFixed(Precision) + " + " + Im.toStringAsFixed(Precision) + "i";
      }
      else{
        String re = val[0];
        String im = val[1].replaceAll("i", "");
        double Re = double.parse(re);
        double Im = double.parse(im);
        return Re.toStringAsFixed(Precision) + " - " + Im.toStringAsFixed(Precision) + "i";
      }
    }
    else if (op.length == 1){
      if (val.length == 2){
        String re = val[0];
        String im = val[1].replaceAll("i", "");
        double Re = double.parse(re);
        double Im = double.parse(im);
        return Re.toStringAsFixed(Precision) + " + " + Im.toStringAsFixed(Precision) + "i";
      }
      else{
        String re = val[0];
        double Re = double.parse(re);
        return "-" + Re.toStringAsFixed(Precision);
      }
    }
    else{
      String re = val[0];
      double Re = double.parse(re);
      return Re.toStringAsFixed(Precision);
    }

  }

}





