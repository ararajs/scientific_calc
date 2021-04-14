import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart' as me;
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import "math_server.dart";
import "package:provider/provider.dart";
import "mathtest.dart" as lp;
import "package:flutter_app/solver.dart";
import "package:linalg/linalg.dart";
import "package:flutter_app/mathtest.dart";


class Button extends StatelessWidget{
  final List Colorlist;
  final double Size;
  final Input;
  final symb;
  final List InputList;
  final String FullInput;
  final String PreviousAnswer;
  final ValueChanged<String> Set_Output;
  final ValueChanged<String> Set_Input;
  final ValueChanged<String> Update_Input;
  Button({this.Update_Input, this.Input, this.Set_Output, this.Set_Input, this.FullInput, this.Colorlist, this.Size, this.PreviousAnswer, this.symb, this.InputList});

  List Keys = ["Right", "Left", "Up", "Down", "Shift-Spacebar", "Shift-Enter", "Backspace"];
  List Op =  ["+", "-", r"\div", "\\\\times" ,"/"];

  Widget build(BuildContext context){
    final mathBoxController = Provider.of<MathBoxController>(context, listen: false);

    void LoopInput(List input){
      if (input == null){
        mathBoxController.addExpression(Input);
      }
      else{
        for (var i=0; i < input.length; i++){
          if (Keys.contains(input[i])) {
            mathBoxController.addKey(input[i]);
          }
          else{
            if (Op.contains(input[i])){
              mathBoxController.addExpression(input[i], isOperator: true);
            }
            else{
              mathBoxController.addExpression(input[i]);
            }

          }
        }
      }
    }

    return SizedBox(
      width: 65.0,
      height: 35.0,
      child: Stack(children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Container(
            child: FlatButton(
              color: Color.fromRGBO(Colorlist[0], Colorlist[1], Colorlist[2], Colorlist[3]),
              onPressed: (){LoopInput(InputList);},
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

class delButton extends StatelessWidget{
  final List Colorlist;
  final Size;
  delButton({this.Size, this.Colorlist});

  Widget build (BuildContext context){
    final mathBoxController = Provider.of<MathBoxController>(context, listen: false);
    return SizedBox(
      width: 65.0,
      height: 35.0,
      child: Stack(children: <Widget>[
        Align(
            alignment: Alignment.center,
            child: Container(
              child: FlatButton(
                color: Color.fromRGBO(Colorlist[0], Colorlist[1], Colorlist[2], Colorlist[3]),
                onPressed: () {mathBoxController.deleteExpression();},
              ),
            )

        ),
        Align(
          alignment: Alignment.center,
          child: IgnorePointer(
            ignoring: true,
            child: Text(
              "DEL",style: TextStyle(fontSize: this.Size, color: Colors.white,),),
          ),
        ),
      ]),
    );
  }
}

class delAllButton extends StatelessWidget{
  final List Colorlist;
  final Size;
  delAllButton({this.Size, this.Colorlist});

  Widget build (BuildContext context){
    final mathBoxController = Provider.of<MathBoxController>(context, listen: false);
    return SizedBox(
      width: 65.0,
      height: 35.0,
      child: Stack(children: <Widget>[
        Align(
            alignment: Alignment.center,
            child: Container(
              child: FlatButton(
                color: Color.fromRGBO(Colorlist[0], Colorlist[1], Colorlist[2], Colorlist[3]),
                onPressed: () {mathBoxController.deleteAllExpression();},
              ),
            )

        ),
        Align(
          alignment: Alignment.center,
          child: IgnorePointer(
            ignoring: true,
            child: Text(
              "AC",style: TextStyle(fontSize: this.Size, color: Colors.white,),),
          ),
        ),
      ]),
    );
  }
}


class MathModel with ChangeNotifier {
  String _expression = '';
  String _result = "0";
  bool _isClearable = false;
  int _precision;
  bool _isRadMode;

  AnimationController equalAnimation;

  String get result => _result;
  void updateExpression(String expression) {
    _expression = expression;
  }

  void changeSetting({int precision, bool isRadMode}) {
    this._precision = precision;
    this._isRadMode = isRadMode;
  }

  void changeClearable(bool b) {
    _isClearable = b;
    if (_isClearable) {
      equalAnimation.forward();
    } else {
      equalAnimation.reset();
    }
  }

  void setResult(){
    _result = "";
    notifyListeners();
  }

  void calcNumber() {
    print('exp: ' + _expression.toString());
    me.Parser solver = me.Parser();
    if (_expression.isEmpty) {
      _result = "";
    } else {
      var c_i = "i".allMatches(_expression).length;
      var c_times = "\\times".allMatches(_expression).length;
      var c_div = "\\div".allMatches(_expression).length;
      var c_sin = r"\sin".allMatches(_expression).length;
      var c_asin = r"\arcsin".allMatches(_expression).length;
      var c_rb = r"\right".allMatches(_expression).length;
      var c_pi = r"\pi".allMatches(_expression).length;
      try {
        if (_expression.contains(r"\int")){
          IntConverter solver = IntConverter(_expression, _precision, _isRadMode);
          _result =  solver.decode();
        }
        else if (_expression.contains(r"\frac{d}{dx}")){
          DiffConverter solver = DiffConverter(_expression, _precision, _isRadMode);
          _result =  solver.decode();
        }
        else if (_expression.contains("=")){
          NumericalAnalysis solver = NumericalAnalysis(_expression, _precision);
          _result = solver.decode();
        }
        else if (c_i > c_times + c_div + c_rb + c_asin + c_sin + c_pi){
         ComplexConv solver = ComplexConv(_expression, _precision, _isRadMode);
         _result = solver.decode();
        }
        else {
          lp.LaTexParser LParser = lp.LaTexParser(_expression, isRadMode: _isRadMode);
          me.Expression mathexp = LParser.parse();
          me.ContextModel cm = me.ContextModel();
          String ans = mathexp.evaluate(me.EvaluationType.REAL, cm).toString();
          while ((ans.contains('.') && ans.endsWith('0')) ||
              ans.endsWith('.')) {
            ans = ans.substring(0, ans.length - 1);
          }
          if (ans.contains(".")){
            var val = double.parse(ans);
            ans = val.toStringAsFixed(_precision);
          }
          _result = ans;
        }
      }
      catch(e){
        print("Error: Not sure what bro. " + e.toString());
      }
    }
    notifyListeners();
  }
}

class MatrixModel with ChangeNotifier {
  List<String> _matrixExpHistory = [];
  String _matrixExression;
  Matrix _matrix;
  int _precision;
  bool _single = true;
  bool _square = true;

  bool get single => _single;
  bool get square => _square;

  void updateExpression(String expression) {
    _matrixExression = expression;
    final mp = MatrixParser(_matrixExression, precision: _precision);
    _matrix = mp.parse();
    _single = mp.single;
    _square = mp.square;
    notifyListeners();
  }

  void calc() {
    _matrixExpHistory.add(_matrixExression);
    updateExpression(matrix2String(_matrix));
  }

  void norm() {
    _matrixExpHistory.add(_matrixExression);
    _matrixExression = _matrix.det().toString();
    _single = false;
    _square = false;
    notifyListeners();
  }

  void transpose() {
    _matrixExpHistory.add(_matrixExression);
    updateExpression(matrix2String(_matrix.transpose()));
  }

  void invert() {
    _matrixExpHistory.add(_matrixExression);
    updateExpression(matrix2String(_matrix.inverse()));
  }

  String display() {
    List<int> uniCode = _matrixExression.runes.toList();
    for (var i = 0; i < uniCode.length; i++) {
      if (uniCode[i] == 92) {
        uniCode.insert(i, 92);
        i++;
      }
    }
    return String.fromCharCodes(uniCode);
  }

  String matrix2String(Matrix matrix) {
    List<String> matrixRows = [];
    for (var i = 0; i < matrix.m; i++) {
      matrixRows.add(matrix[i].join('&'));
    }
    String matrixString = matrixRows.join(r'\\');
    matrixString = r'\begin{bmatrix}' + matrixString + r'\end{bmatrix}';
    return matrixString;
  }

  void changeSetting({int precision}) {
    this._precision = precision;
  }

}

class eqButton extends StatelessWidget{
  final List Colorlist;
  final Size;
  eqButton({this.Size, this.Colorlist});

  Widget build (BuildContext context){
    final mathBoxController = Provider.of<MathBoxController>(context, listen: false);
    return SizedBox(
      width: 65.0,
      height: 35.0,
      child: Stack(children: <Widget>[
        Align(
            alignment: Alignment.center,
            child: Container(
              child: FlatButton(
                color: Color.fromRGBO(Colorlist[0], Colorlist[1], Colorlist[2], Colorlist[3]),
                onPressed: () {mathBoxController.equal();},
              ),
            )

        ),
        Align(
          alignment: Alignment.center,
          child: IgnorePointer(
            ignoring: true,
            child: Text(
              "=",style: TextStyle(fontSize: this.Size, color: Colors.white,),),
          ),
        ),
      ]),
    );
  }
}


class RightButton extends StatelessWidget{
  final List Colorlist;
  final Size;
  RightButton({this.Size, this.Colorlist});

  Widget build (BuildContext context){
    final mathBoxController = Provider.of<MathBoxController>(context, listen: false);
    return SizedBox(
      width: 43.0,
      height: 30.0,
      child: Stack(children: <Widget>[
        Align(
            alignment: Alignment.center,
            child: Container(
              child: FlatButton(
                color: Color.fromRGBO(Colorlist[0], Colorlist[1], Colorlist[2], Colorlist[3]),
                onPressed: () {mathBoxController.addKey("Right");},
              ),
            )

        ),
        Align(
          alignment: Alignment.center,
          child: IgnorePointer(
            ignoring: true,
            child: Text(
              ">",style: TextStyle(fontSize: this.Size, color: Colors.white,),),
          ),
        ),
      ]),
    );
  }
}

class LeftButton extends StatelessWidget{
  final List Colorlist;
  final Size;
  LeftButton({this.Size, this.Colorlist});

  Widget build (BuildContext context){
    final mathBoxController = Provider.of<MathBoxController>(context, listen: false);
    return SizedBox(
      width: 43.0,
      height: 30.0,
      child: Stack(children: <Widget>[
        Align(
            alignment: Alignment.center,
            child: Container(
              child: FlatButton(
                color: Color.fromRGBO(Colorlist[0], Colorlist[1], Colorlist[2], Colorlist[3]),
                onPressed: () {mathBoxController.addKey("Left");},
              ),
            )

        ),
        Align(
          alignment: Alignment.center,
          child: IgnorePointer(
            ignoring: true,
            child: Text(
              "<",style: TextStyle(fontSize: this.Size, color: Colors.white,),),
          ),
        ),
      ]),
    );
  }
}

class UpButton extends StatelessWidget{
  final List Colorlist;
  final Size;
  UpButton({this.Size, this.Colorlist});

  Widget build (BuildContext context){
    final mathBoxController = Provider.of<MathBoxController>(context, listen: false);
    return SizedBox(
      width: 43.0,
      height: 30.0,
      child: Stack(children: <Widget>[
        Align(
            alignment: Alignment.center,
            child: Container(
              child: FlatButton(
                color: Color.fromRGBO(Colorlist[0], Colorlist[1], Colorlist[2], Colorlist[3]),
                onPressed: () {mathBoxController.addKey("Up");},
              ),
            )

        ),
        Align(
          alignment: Alignment.center,
          child: IgnorePointer(
            ignoring: true,
            child: Text(
              "∧",style: TextStyle(fontSize: this.Size, color: Colors.white,),),
          ),
        ),
      ]),
    );
  }
}

class DownButton extends StatelessWidget{
  final List Colorlist;
  final Size;
  DownButton({this.Size, this.Colorlist});

  Widget build (BuildContext context){
    final mathBoxController = Provider.of<MathBoxController>(context, listen: false);
    return SizedBox(
      width: 43.0,
      height: 30.0,
      child: Stack(children: <Widget>[
        Align(
            alignment: Alignment.center,
            child: Container(
              child: FlatButton(
                color: Color.fromRGBO(Colorlist[0], Colorlist[1], Colorlist[2], Colorlist[3]),
                onPressed: () {mathBoxController.addKey("Down");},
              ),
            )

        ),
        Align(
          alignment: Alignment.center,
          child: IgnorePointer(
            ignoring: true,
            child: Text(
              "∨",style: TextStyle(fontSize: this.Size, color: Colors.white,),),
          ),
        ),
      ]),
    );
  }
}

class CalculationMode extends ValueNotifier<Mode> {
  CalculationMode(Mode value) : super(value);

  void changeMode(Mode newMode) {
    if (newMode != value) {
      value = newMode;
    }
  }
}

enum Mode {
  Basic,
  Matrix,
  Complex,
}



