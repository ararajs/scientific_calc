import 'package:flutter/material.dart';
import 'dart:math';



class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String _selectedText=null;
  final formKey = GlobalKey<FormState>();
  String val;
  double a1 = 0, b1 = 0, c1 = 0, a2 = 0, b2 = 0, c2 = 0, n = 0, root1 = 0, root2 = 0, res = 0, real = 0, imag = 0; //res = Result...................
  TextEditingController t1 = TextEditingController(text: '');
  TextEditingController t2 = TextEditingController(text: '');
  TextEditingController t3 = TextEditingController(text: '');
  TextEditingController t4 = TextEditingController(text: '');
  TextEditingController t5 = TextEditingController(text: '');
  TextEditingController t6 = TextEditingController(text: '');


  doGeneralQuadraticFormula() {

    setState(() {
      a1 = double.parse(t1.text);
      b1 = double.parse(t2.text);
      c1 = double.parse(t3.text);
      a2 = double.parse(t4.text);
      b2 = double.parse(t5.text);
      c2 = double.parse(t6.text);
      n = a1 * b2 - b1 * a2;

      if (n != 0) {
        root1 = (c1 * b2 - b1 * c2) / n;
        root2 = (a1 * c2 - c1 * a2) / n;
      }

    });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(

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
                    Text('ax + by = c',
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
                        '$root1 and $root2',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, fontFamily: 'Yass.ttf', color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(height: 20, color: Colors.red),


            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
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
                  Text('a2:  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
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
                  Text('b2:  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
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
                  Text('c2:  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
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
                      print('$root1 and $root2');
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