import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as radians;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

class ConversionRadialMenu extends StatefulWidget {
  final Function(String) _onTap;
  ConversionRadialMenu(this._onTap);
  @override
  _ConversionRadialMenuState createState() => _ConversionRadialMenuState();
}

class _ConversionRadialMenuState extends State<ConversionRadialMenu>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> circularExpand;
  Animation<double> translation;
  bool isExpanded;
  String selectedConversionType;

  @override
  void initState() {
    isExpanded = false;
    selectedConversionType = "Length";
    controller = new AnimationController(
        duration: new Duration(milliseconds: 400), vsync: this);
    circularExpand = new Tween<double>(begin: 1, end: 2).animate(
        CurvedAnimation(
            parent: controller, curve: Curves.easeInOutCirc));
    translation = new Tween<double>(begin: 0, end: 80).animate(
        CurvedAnimation(
            parent: controller, curve: Curves.easeOutSine));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilder(
        animation: controller, builder: (context, builder) => getMenu());
  }

  Widget getMenu() {
    return Center(
      child: new Stack(
        alignment: Alignment.center,
        children: <Widget>[
          new Container(
              height: circularExpand.value * 110,
              width: circularExpand.value * 110,
              decoration: new BoxDecoration(
                  color: Colors.white70,
                  shape: BoxShape.circle)),
          _buildButton(0, "Time", icon: FontAwesomeIcons.hourglassHalf),
          _buildButton(45, "Mass", icon: FontAwesomeIcons.weightHanging),
          _buildButton(90, "Speed", icon: FontAwesomeIcons.tachometerAlt),
          _buildButton(135, "Volume", icon: FontAwesomeIcons.cube),
          _buildButton(180, "Base", icon: FontAwesomeIcons.sortNumericDown),
          _buildButton(225, "Temperature", icon: FontAwesomeIcons.temperatureLow),
          _buildButton(270, "Area", icon: FontAwesomeIcons.square),
          _buildButton(315, "Length", icon: FontAwesomeIcons.ruler),
          new Container(
            height: circularExpand.value>1.5? (2.5 - circularExpand.value) * 100 : 100,
            width: circularExpand.value>1.5? (2.5 - circularExpand.value) * 100 : 100,
            child: new InkWell(
                onTap: () {
                  isExpanded? controller.reverse() : controller.forward();
                  isExpanded = !isExpanded;
                },
                child: new Center(
                    child: ((2.5 - circularExpand.value) * 100) > 90? Text(selectedConversionType,
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0))
                        : new Icon(Icons.close, color: Colors.white,)
                )
            ),
            decoration: new BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle),
          ),

        ],
      ),
    );
  }

  _buildButton(double angle, String type, {Color color = Colors.black, IconData icon}){
    final double rad = radians.radians(angle);
    return Transform(
      transform: Matrix4.identity()..translate(
        (translation.value) * cos(rad),
        (translation.value) * sin(rad),
      ),
      child: new FloatingActionButton(
        heroTag: type,
        elevation: 0.0,
        onPressed: () {
          controller.reverse();
          isExpanded = !isExpanded;
          selectedConversionType = type;
          widget._onTap(selectedConversionType);},
        child: Icon(icon, color: Colors.black,),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}