import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/functions.dart';



class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mathModel = Provider.of<MathModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Setting',),
      ),
      body: ListView(
        itemExtent: 60.0,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        children: <Widget>[
          ListTile(
            leading: Text(
              'Calc Setting',
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Consumer<SettingModel>(
            builder: (context, setmodel, _) => ListTile(
              title: ToggleButtons(
                children: <Widget>[
                  Text('RAD'),
                  Text('DEG'),
                ],
                constraints: BoxConstraints(
                  minWidth: 100,
                  minHeight: 40,
                ),
                isSelected: [setmodel.isRadMode, !setmodel.isRadMode],
                onPressed: (index) {
                  setmodel.changeRadMode((index==0)?true:false);
                },
              ),
            ),
          ),
          Consumer<SettingModel>(
            builder: (context, setmodel, _) => ListTile(
              title: Text('Calc Precision'),
              subtitle: Slider(
                value: setmodel.precision.toDouble(),
                min: 0.0,
                max: 10.0,
                label: "${setmodel.precision.toInt()}",
                divisions: 10,
                onChanged: (val) {
                  setmodel.changeSlider(val);
                },
              ),
              trailing: Text('${setmodel.precision.toInt()}'),
            ),
          ),
        ],
      ),
    );
  }


}

class SettingModel with ChangeNotifier {
  num precision = 10;
  bool isRadMode = true;
  int initPage = 0;
  SettingModel() {
    initVal();
  }

  Future changeSlider(double val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    precision = val;
    prefs.setDouble('precision', precision);
    notifyListeners();
  }

  Future changeRadMode(bool mode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isRadMode = mode;
    prefs.setBool('isRadMode', isRadMode);
    notifyListeners();
  }

  Future initVal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    precision = prefs.getDouble('precision') ?? 10;
    isRadMode = prefs.getBool('isRadMode') ?? true;
    initPage = prefs.getInt('initPage') ?? 0;
    notifyListeners();
  }

  Future changeInitpage(int val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    initPage = val;
    prefs.setInt('initPage', initPage);
  }

}