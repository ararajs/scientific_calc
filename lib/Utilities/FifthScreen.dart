import 'package:flutter/material.dart';
import 'dart:math';



class FifthScreen extends StatefulWidget {
  @override
  _FifthScreenState createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {
  String _selectedText=null;
  final formKey = GlobalKey<FormState>();
  String val;
  double a = 0, b = 0, c = 0, d =0, findF = 0, findG = 0, findH = 0, i = 0, j = 0, k = 0,
      L = 0, M = 0, N = 0, P = 0, R = 0, S = 0, T = 0, U = 0,
      root1 = 0, root2 = 0, root3 = 0, res = 0;
      String str_root1;
      String str_root2;
      String str_root3;
  TextEditingController t1 = TextEditingController(text: '');
  TextEditingController t2 = TextEditingController(text: '');
  TextEditingController t3 = TextEditingController(text: '');
  TextEditingController t4 = TextEditingController(text: '');


  doGeneralQuadraticFormula() {

    setState(() {
      a = double.parse(t1.text);
      b = double.parse(t2.text);
      c = double.parse(t3.text);
      d = double.parse(t4.text);
      findF = ((3.0 * c / a) - ((pow(b, 2.0) / (pow(a, 2.0))))) / 3.0;
      findG = (((2.0 * (pow(b, 3.0))) / (pow(a, 3.0))) - ((9.0 * b * c ) /  (pow(a, 2.0))) + (27.0 * d / a)) / 27.0;
      findH = ((pow(findG, 2.0)) / 4.0 + (pow(findF, 3.0)) / 27.0);



      if (findF == 0 && findG == 0 && findH ==0) {
        if (d / a >= 0)
          root1 = root2 = root3 = pow((d / (1.0 * a)), (1 / 3.0)) * -1;
        else
          root1 = root2 = root3 = pow((-d / (1.0 * a)), (1 / 3.0));
      }
      else if (findH <= 0) {
        i = sqrt(((pow(findG, 2.0)) / 4.0) - findH);
        j = pow(i, (1 / 3.0));
        k = acos(-(findG / (2 * i)));
        L = j * -1;
        M = cos(k / 3.0);
        N = sqrt(3) * sin(k / 3.0);
        P = (b / (3.0 * a)) * -1;

        root1 = 2 * j * cos(k / 3.0) - (b / (3.0 * a));
        str_root1 = root1.toStringAsFixed(4);
        root2 = L * (M + N) + P;
        str_root2 = root2.toStringAsFixed(4);
        root3 = L * (M - N) + P;
        str_root3 = root3.toStringAsFixed(4);

      }

      else if (findH > 0) {
        R = -(findG / 2.0) + sqrt(findH);
        if (R >= 0)
             S = pow(R, (1 / 3.0));
        else
            S = pow((-R), (1 / 3.0)) * -1;
        T = -(findG / 2.0) - sqrt(findH);
        if (T >= 0)
            U = (pow(T, (1 / 3.0)));
        else
            U = (pow(-T, (1 / 3.0))) * -1;

      root1 = (S + U) - (b / (3.0 * a));
      str_root1 = root1.toStringAsFixed(4);
      root2 = -(S + U) / 2 - (b / (3.0 * a)) + (S - U) * sqrt(3) * 0.5 * j;
      str_root2 = root2.toStringAsFixed(4);
      root3 = -(S + U) / 2 - (b / (3.0 * a)) - (S - U) * sqrt(3) * 0.5 * j;
      str_root3 = root3.toStringAsFixed(4);

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
                  Text('ax + bx² + cx + d = 0',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.red),
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
                        '$str_root1, $str_root2 and $str_root3',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, fontFamily: 'Yass.ttf', color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(height: 20, color: Colors.red),



              Row( crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('a:  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
                  ),
                  SizedBox(
                    width: 150,
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'coefficent of x²'
                      ),
                      controller: t1,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),


              Row( crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('b:  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
                  ),
                  SizedBox(
                    width: 150,
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'coefficent of x²'
                      ),
                      controller: t2,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),



              Row( crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('c:  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'coefficient of x'
                      ),
                      controller: t3,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),

              Row( crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('d:  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'the constant'
                      ),
                      controller: t4,
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