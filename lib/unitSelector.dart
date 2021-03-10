import 'package:flutter/material.dart';

class UnitSelector extends StatelessWidget {
  final List<String> unit;
  UnitSelector(this.unit);

  @override
  Widget build(BuildContext context) {
    return new SimpleDialog(
      backgroundColor: Colors.white,
      title: Text("Unit", style: TextStyle(color: Colors.black, fontSize: 20.0)),
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      children: <Widget>[
        new Container(
          width: 250,
          height: 360,
          child: ListView.builder(
            itemCount: unit.length,
            itemBuilder: (BuildContext context, int i){
              return ListTile(
                  title: Text(unit[i], style: TextStyle(color: Colors.black),),
                  onTap: () => Navigator.pop(context, unit[i])
              );
            },
          ),
        )
      ],
    );
  }
}
