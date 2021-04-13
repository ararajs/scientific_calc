import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'dart:math';
import './Utilities/FirstScreen.dart';
import './Utilities/SecondScreen.dart';
import './Utilities/ThirdScreen.dart';
import './Utilities/FifthScreen.dart';

void main() => runApp(TabsPage());


class TabsPage extends StatelessWidget {

  List<Widget> containers = [
    Container(
      color: Colors.pink,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.deepPurple,
    ),
    Container(
      color: Colors.deepPurple,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(129, 90, 160, 1),
          title: Text('Quadratic Equation'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: '1',
              ),
              Tab(
                text: '2',
              ),
              Tab(
                text: '3',
              ),
              Tab(
                text: '4',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            FirstScreen(),
            SecondScreen(),
            FourthScreen(),
            FifthScreen(),
          ],
        ),
      ),
    );
  }
}


// class QuadraticPage extends StatefulWidget {
//   @override
//   _QuadraticPageState createState() => _QuadraticPageState();
// }
//
// class _QuadraticPageState extends State<QuadraticPage> {
//   String _selectedText=null;
//   final formKey = GlobalKey<FormState>();
//   String val;
//   double a = 0, b = 0, c = 0, discr = 0, root1 = 0, root2 = 0, res = 0, real = 0, imag = 0; //res = Result...................
//   TextEditingController t1 = TextEditingController(text: '');
//   TextEditingController t2 = TextEditingController(text: '');
//   TextEditingController t3 = TextEditingController(text: '');
//
//
//
//   doGeneralQuadraticFormula() {
//
//     setState(() {
//       a = double.parse(t1.text);
//       b = double.parse(t2.text);
//       c = double.parse(t3.text);
//       discr = b * b - 4 * a * c;
//       real = -b / (2 * a);
//       imag = sqrt(-discr) / (2 * a);
//
//
//       if (discr > 0) {
//         root1 = ((-1 * b) + sqrt(discr)) / (2 * a);
//         root2 = ((-1 * b) - sqrt(discr)) / (2 * a);
//       }
//       else{
//         root1 = real;
//         root2 = imag;
//       }
//     });
//   }
//   List<DropdownMenuItem<String>> _dropDownItem() {
//     List<String> dd1 = ["ax+by=c", "ax+by+cz=d","ax² + bx + c = 0", "bx² + cx + d = 0"];
//     return dd1.map(
//             (value) =>
//             DropdownMenuItem(
//               value: value,
//               child: Text(value),
//             )
//     ).toList();
//   }
//
//   @override
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Basic Quadratic Solver',
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
//         ),
//       ),
//       body: Container(
//         child: SingleChildScrollView(
//           key: formKey,
//           padding: EdgeInsets.all(30.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Text('Quadratic equations appear in the format',
//                         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red),
//                         textAlign: TextAlign.center),
//                   ],
//                 ),
//
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       DropdownButton(
//                             value: _selectedText,
//                             items: _dropDownItem(),
//                             onChanged: (value) {
//                                  val = value;
//                               },
//                         hint: Text('Quadratic Equations',style: TextStyle(color: Colors.red,),textAlign: TextAlign.end,),
//                         dropdownColor: Colors.white,
//                         icon: Icon(Icons.arrow_drop_down,color: Colors.black,),
//                         iconSize: 36,
//                       ),
//                       ],
//                 ),
//
//               //
//               // switch(val){
//               //   case "ax+by=c" :
//               Card(
//                 color: Colors.red[600],
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(20.0, 35, 15.0, 40.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween ,
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: <Widget>[
//                       Text(
//                         'The Roots are:',
//                         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
//                         textAlign: TextAlign.center,
//                       ),
//                       Text(
//                         '$root1 and $root2',
//                         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, fontFamily: 'Yass.ttf', color: Colors.white),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Divider(height: 20, color: Colors.red),
//
//
//
//               Row( crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Text('a:  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
//                   ),
//                   SizedBox(
//                     width: 250,
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                           labelText: 'coefficent of x²'
//                       ),
//                       controller: t1,
//                       keyboardType: TextInputType.number,
//                     ),
//                   ),
//                 ],
//               ),
//
//
//               Row( crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Text('b:  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
//                   ),
//                   SizedBox(
//                     width: 270,
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                           labelText: 'coefficent of x'
//                       ),
//                       controller: t2,
//                       keyboardType: TextInputType.number,
//                     ),
//                   ),
//                 ],
//               ),
//
//
//
//               Row( crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Text('c:  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
//                   ),
//                   SizedBox(
//                     width: 299,
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                           labelText: 'the constant'
//                       ),
//                       controller: t3,
//                       keyboardType: TextInputType.number,
//                     ),
//                   ),
//                 ],
//               ),
//
//
//               SizedBox(height: 10),
//
//
//
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: <Widget>[
//                   RaisedButton(
//                     elevation: 8,
//                     onPressed: () {
//                       //TODO:
//                       doGeneralQuadraticFormula();
//                       print('$root1 and $root2');
//                     },
//                     child: Text('SUBMIT',
//                       style: TextStyle(
//                         fontSize: 15.0,
//                         fontFamily: 'Yass.ttf',
//                       ),
//                     ),
//                     textColor: Colors.white,
//                     color: Colors.red,
//                   ),
// //                  SizedBox(height: 90),
//                 ],
//               ),
//
//               Divider(height: 30, color: Colors.red),
//
//
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.end ,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }