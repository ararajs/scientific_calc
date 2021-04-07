import 'package:flutter/material.dart';
import 'dart:math';



class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String _selectedText=null;
  final formKey = GlobalKey<FormState>();
  String val;
  double a1 = 0, b1 = 0, c1 = 0, d1 = 0, a2 = 0, b2 = 0, c2 = 0, d2 = 0, a3 = 0, b3 = 0, c3 = 0, d3 = 0,
      det = 0, detA = 0, detB = 0, detC = 0, root1 = 0, root2 = 0, root3=0, res = 0, real1 = 0, real2 = 0, real3 = 0; //res = Result...................
  TextEditingController t1 = TextEditingController(text: '');
  TextEditingController t2 = TextEditingController(text: '');
  TextEditingController t3 = TextEditingController(text: '');
  TextEditingController t4 = TextEditingController(text: '');
  TextEditingController t5 = TextEditingController(text: '');
  TextEditingController t6 = TextEditingController(text: '');
  TextEditingController t7 = TextEditingController(text: '');
  TextEditingController t8 = TextEditingController(text: '');
  TextEditingController t9 = TextEditingController(text: '');
  TextEditingController t10 = TextEditingController(text: '');
  TextEditingController t11 = TextEditingController(text: '');
  TextEditingController t12 = TextEditingController(text: '');



  doGeneralQuadraticFormula() {

    setState(() {
      a1 = double.parse(t1.text);
      b1 = double.parse(t2.text);
      c1 = double.parse(t3.text);
      d1 = double.parse(t4.text);
      a2 = double.parse(t5.text);
      b2 = double.parse(t6.text);
      c2 = double.parse(t7.text);
      d2 = double.parse(t8.text);
      a3 = double.parse(t9.text);
      b3 = double.parse(t10.text);
      c3 = double.parse(t11.text);
      d3 = double.parse(t12.text);
      det = a1 * (b2 * c3 - c2 * b3) - b1 * (a2 * c3 - c2 * a3) + c1 * (a2 * b3 - b2 * a3);
      detA = d1 * (b2 * c3 - c2 * b3) - b1 * (d2 * c3 - c2 * d3) + c1 * (d2 * b3 - b2 * d3);
      detB = a1 * (d2 * c3 - c2 * d3) - d1 * (a2 * c3 - c2 * a3) + c1 * (a2 * d3 - d2 * a3);
      detC = a1 * (b2 * d3 - d2 * b3) - b1 * (a2 * d3 - d2 * a3) + d1 * (a2 * b3 - b2 * a3);



      if (det != 0) {
        root1 = detA / det;
        root2 = detB / det;
        root3 = detC / det;
      }
      else{
        root1 = real1;
        root2 = real2;
        root3 = real3;
      }
    });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Quadratic Solver',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          key: formKey,
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Quadratic equations appear in the format',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red),
                      textAlign: TextAlign.center),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('ax + by + cz = d',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.red),
                      textAlign: TextAlign.center),
                ],
              ),

              //
              // switch(val){
              //   case "ax+by=c" :
              Card(
                color: Colors.red[600],
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 35, 15.0, 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'The Roots are:',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '$root1, $root2 and $root3',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Yass.ttf', color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(height: 20, color: Colors.red),



              Row( crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('a1:  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      decoration: InputDecoration(

                      ),
                      controller: t1,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),


              Row( crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('b1:  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      decoration: InputDecoration(

                      ),
                      controller: t2,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),



              Row( crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('c1:  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      decoration: InputDecoration(

                      ),
                      controller: t3,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),

              Row( crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('d1:  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      decoration: InputDecoration(

                      ),
                      controller: t4,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),

              Row( crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('a2:  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      decoration: InputDecoration(

                      ),
                      controller: t5,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),

              Row( crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('b2:  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      decoration: InputDecoration(

                      ),
                      controller: t6,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),

              Row( crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('c2:  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      decoration: InputDecoration(

                      ),
                      controller: t7,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),

              Row( crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('d2:  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      decoration: InputDecoration(

                      ),
                      controller: t8,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),

              Row( crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('a3:  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      decoration: InputDecoration(

                      ),
                      controller: t9,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),

              Row( crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('b3:  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      decoration: InputDecoration(

                      ),
                      controller: t10,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),

              Row( crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('c3:  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      decoration: InputDecoration(

                      ),
                      controller: t11,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),

              Row( crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('d3:  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      decoration: InputDecoration(

                      ),
                      controller: t12,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),



              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    elevation: 8,
                    onPressed: () {
                      //TODO:
                      doGeneralQuadraticFormula();
                      print('$root1, $root2 and $root3');
                    },
                    child: Text('SUBMIT',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Yass.ttf',
                      ),
                    ),
                    textColor: Colors.white,
                    color: Colors.red,
                  ),
//                  SizedBox(height: 90),
                ],
              ),

              Divider(height: 30, color: Colors.red),


              Column(
                mainAxisAlignment: MainAxisAlignment.end ,
                crossAxisAlignment: CrossAxisAlignment.end,

              ),
            ],
          ),
        ),
      ),
    );
  }
}