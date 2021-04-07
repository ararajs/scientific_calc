import 'package:flutter/material.dart';

import './Utilities/ui_colors.dart';
import './Utilities/convert_menu.dart';
import './unitSelector.dart';
import './Utilities/conversion_data.dart';
import './Utilities/keypad.dart';

class ConversionPage extends StatefulWidget {
  @override
  _ConversionPageState createState() => _ConversionPageState();
}

class _ConversionPageState extends State<ConversionPage> {
  String selectedType, selectedInputUnit, selectedOutputUnit;
  String inputVal; // The Value in the upper green area
  String outputVal; //The Value in the lower grey area
  List<String> unitList;
  @override
  void initState() {
    selectedType = "Length";
    unitList = getList(selectedType);
    selectedInputUnit = unitList[0];
    selectedOutputUnit = unitList[1];
    inputVal = "0";
    outputVal = "0";
    super.initState();
  }

  void changeInputUnit(String newUnit) {
    // The Unit in the upper green area
    setState(() {
      selectedInputUnit = newUnit;
      outputVal = convert(
          selectedType, selectedInputUnit, selectedOutputUnit, inputVal);
    });
  }

  void changeOutputUnit(String newUnit) {
    //The Unit in the lower grey area
    setState(() {
      selectedOutputUnit = newUnit;
      outputVal = convert(
          selectedType, selectedInputUnit, selectedOutputUnit, inputVal);
    });
  }

  void changeInputValue(String newVal) {
    // The Value in the upper green area
    setState(() {
      inputVal = newVal;
      outputVal = convert(
          selectedType, selectedInputUnit, selectedOutputUnit, inputVal);
    });
  }

  void changeOutputValue(String newVal) {
    //The Value in the lower grey area
    setState(() {
      outputVal = newVal;
      inputVal = convert(
          selectedType, selectedOutputUnit, selectedInputUnit, outputVal);
    });
  }

  void changeConvType(String newType) {
    setState(() {
      selectedType = newType;
      unitList = getList(selectedType);
      selectedInputUnit = unitList[0];
      selectedOutputUnit = unitList[1];
      inputVal = "0";
      outputVal = "0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
       title: Text('Unit Converter'),
    ),
       body:  Stack(
        children: <Widget>[
          new Column(
            children: <Widget>[
              new Expanded(
                child: new Material(
                    color: darkButtonColor,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new Expanded(
                          flex: 6,
                          child: new InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: new Center(
                                child: Text(inputVal,
                                    style: TextStyle(
                                        fontSize: 25.0, color: Colors.white))),
                            onTap: () {
                              showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    if (selectedType == "Temperature")
                                      return KeyPad(
                                        currentValue: inputVal,
                                        shouldTakeNegative: true,
                                      );
                                    else if (selectedType == "Base")
                                      return KeyPad(
                                        currentValue: inputVal,
                                        shouldTakeDouble: false,
                                        shouldTakeNegative: false,
                                        shouldTakeExponent: false,
                                      );
                                    else
                                      return KeyPad(currentValue: inputVal);
                                  }).then<String>((returnVal) {
                                if (returnVal != null)
                                  changeInputValue(returnVal);
                              });
                            },
                          ),
                        ),
                        new Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.0),
                        ),
                        new Expanded(
                          flex: 4,
                          child: new InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: new Center(
                                child: Text(selectedInputUnit,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white54))),
                            onTap: () {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) =>
                                    UnitSelector(unitList),
                              ).then<String>((returnVal) {
                                if (returnVal != null)
                                  changeInputUnit(returnVal);
                              });
                            },
                          ),
                        )
                      ],
                    )),
              ),
              new Expanded(
                child: new Material(
                  color: darkBackgroundColor,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      new Expanded(
                        flex: 6,
                        child: new InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) {
                                  if (selectedType == "Temperature")
                                    return KeyPad(
                                      currentValue: outputVal,
                                      shouldTakeNegative: true,
                                    );
                                  else if (selectedType == "Base")
                                    return KeyPad(
                                      currentValue: outputVal,
                                      shouldTakeDouble: false,
                                      shouldTakeNegative: false,
                                      shouldTakeExponent: false,
                                    );
                                  else
                                    return KeyPad(currentValue: outputVal);
                                }).then<String>((returnVal) {
                              if (returnVal != null)
                                changeOutputValue(returnVal);
                            });
                          },
                          child: new Center(
                            child: Text(outputVal,
                                style: TextStyle(
                                    fontSize: 25.0, color: Colors.white)),
                          ),
                        ),
                      ),
                      new Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.0),
                      ),
                      new Expanded(
                        flex: 4,
                        child: new InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: new Center(
                              child: Text(selectedOutputUnit,
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white54))),
                          onTap: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) =>
                                  UnitSelector(unitList),
                            ).then<String>((returnVal) {
                              if (returnVal != null)
                                changeOutputUnit(returnVal);
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          new ConversionRadialMenu(changeConvType),
        ],
      ),
    );
  }
}