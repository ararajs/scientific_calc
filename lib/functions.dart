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


  Widget build(BuildContext context){
    final mathBoxController = Provider.of<MathBoxController>(context, listen: false);

    void LoopInput(List input){
      if (input == null){
        mathBoxController.addExpression(Input);
      }
      else{
        for (var i=0; i < input.length; i++){
          mathBoxController.addExpression(input[i]);
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
              onPressed: () {LoopInput(InputList);},
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
  String _result = '';
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

  void calcNumber() {
    print('exp: ' + _expression.toString());
    me.Parser solver = me.Parser();
    if (_expression.isEmpty) {
      _result = '';
    } else {
      try {
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
      catch(e){
        print("Error: Not sure what bro.");
      }
    }
    notifyListeners();
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

