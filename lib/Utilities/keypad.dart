import 'package:flutter/material.dart';
import './ui_colors.dart';

class KeyPad extends StatefulWidget {
  final String currentValue;
  final bool shouldTakeDouble;
  final bool shouldTakeNegative;
  final bool shouldTakeExponent;
  KeyPad(
      {this.currentValue = "0",
        this.shouldTakeDouble = true,
        this.shouldTakeNegative = false,
        this.shouldTakeExponent = true});
  @override
  _KeyPadState createState() => _KeyPadState();
}

class _KeyPadState extends State<KeyPad> {
  String returnVal;
  int dotCount;
  @override
  initState() {
    dotCount = 0;
    returnVal = widget.currentValue;
    super.initState();
  }

  Widget getButton(
      {String text,
        Color btnColor = Colors.white,
        Color fntColor = Colors.black}) {
    return Expanded(
      child: new Material(
        color: btnColor,
        child: new InkWell(
          splashColor: Colors.transparent,
          child: new Center(
              child: new Text(
                text,
                style: TextStyle(fontSize: 20.0, color: fntColor),
              )),
          onTap: () => setState(() => modifyInput(text)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      elevation: 10.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: new Container(
        width: 250.0,
        height: 450.0,
        child: new Column(
          children: <Widget>[
            new Expanded(
              flex: 12,
              child: new Center(child: Text(returnVal)),
            ),
            new Expanded(
              flex: 4,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  getButton(
                      text: "Clear",
                      btnColor: darkBackgroundColor,
                      fntColor: Colors.white),
                  new Expanded(
                    child: new Container(
                        color: darkButtonColor,
                        child: new IconButton(
                            icon: Icon(Icons.check),
                            color: Colors.white,
                            onPressed: () {
                              if (double.parse(returnVal) < 0 &&
                                  !widget.shouldTakeNegative) return;
                              Navigator.pop(context, returnVal);
                            })),
                  )
                ],
              ),
            ),
            (widget.shouldTakeExponent || widget.shouldTakeNegative)
                ? new Expanded(
              flex: 4,
              child: new Row(
                children: <Widget>[
                  (widget.shouldTakeExponent || widget.shouldTakeNegative)
                      ? getButton(text: "-")
                      : Container(
                    width: 0.0,
                    height: 0.0,
                  ),
                  (widget.shouldTakeExponent)
                      ? getButton(text: "e")
                      : Container(
                    width: 0.0,
                    height: 0.0,
                  ),
                ],
              ),
            )
                : new Container(
              height: 0.0,
              width: 0.0,
            ),
            new Expanded(
              flex: 5,
              child: new Row(
                children: <Widget>[
                  getButton(text: "1"),
                  getButton(text: "2"),
                  getButton(text: "3"),
                ],
              ),
            ),
            new Expanded(
              flex: 5,
              child: new Row(
                children: <Widget>[
                  getButton(text: "4"),
                  getButton(text: "5"),
                  getButton(text: "6"),
                ],
              ),
            ),
            new Expanded(
              flex: 5,
              child: new Row(
                children: <Widget>[
                  getButton(text: "7"),
                  getButton(text: "8"),
                  getButton(text: "9"),
                ],
              ),
            ),
            new Expanded(
              flex: 5,
              child: new Row(
                children: <Widget>[
                  (widget.shouldTakeDouble)
                      ? getButton(text: ".")
                      : Container(
                    width: 0.0,
                    height: 0.0,
                  ),
                  getButton(text: "0"),
                  getButton(text: "Del"),
                ],
              ),
            ),
            new Padding(
              padding: EdgeInsets.all(10.0),
            )
          ],
        ),
      ),
    );
  }

  void modifyInput(String text) {
    if (returnVal == "0" && text != "Clear" && text != "Del" && text != "." && text != "-" && text != "e")
      returnVal = "";
    else if (text == "Clear") {
      dotCount = 0;
      returnVal = "0";
      return;
    }
    else if (text == "Del") {
      if (returnVal[returnVal.length - 1] == ".") dotCount = 0;
      if (returnVal.length == 1)
        returnVal = "0";
      else
        returnVal = returnVal.substring(0, returnVal.length - 1);
      return;
    }
    else if (text == ".") {
      if (returnVal[returnVal.length - 1] == "e")
        return;
      else if(returnVal.length > 1 && returnVal[returnVal.length - 2] == "e"
          && returnVal[returnVal.length - 1] == "-")
        return;
      else if (dotCount > 0)
        return;
      dotCount = 1;
    }
    else if (text == "-") {
      if (returnVal.length == 1 && returnVal[0] == "0")
        returnVal = "-";
      else if (returnVal[returnVal.length - 1] == "e")
        returnVal = returnVal + "-";
      return;
    }
    else if (text == "e") {
      if (returnVal.length == 0 ||
          returnVal[returnVal.length - 1] == "." ||
          returnVal[returnVal.length - 1] == "-") return;
      returnVal = returnVal + "e";
      return;
    }
    returnVal = returnVal + text;
  }
}