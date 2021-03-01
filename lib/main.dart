import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'functions.dart';
import 'package:flutter_math/flutter_math.dart';



void main() => runApp(MyApp());

//insert latex parser


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),

    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var input = "";
  var output = "0";
  var ans = '0';
  List MainColor = [37,39,50,1.0];    //For numbers
  List SideColor = [129, 90, 160, 0.8];//For the side columns
  String _selectedText=null;

  void update_input(x){
    setState((){
      input = input + x.toString();
    });
  }

  void set_input(x){
    setState(() {
      input = x;
    });
  }

  void set_output(x){
    setState(() {
      if (x!=  "Error") {
        output = x;
        ans = x;
      }
      else{
        output = x;
      }
    });
  }

  void update(x) {
    setState(() {
      input = "$input$x";
    });
  }

  void all_clear() {
    setState(() {
      input = "";
      output = "0";
    });
  }
  void clear (){
    setState(() {
      if (input != null && input.length > 0){
        input = input.substring(0, input.length-1);
      }
    });
  }

  void result () {
    setState(() {
      output = "$input";
    });
  }

  //insert parser function here


  List<DropdownMenuItem<String>> _dropDownItem() {
    List<String> dd1 = ["Basic", "Others"];
    return dd1.map(
            (value) =>
            DropdownMenuItem(
              value: value,
              child: Text(value),
            )
    ).toList();
  }



  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget> [
          Expanded(
            flex: 4,
            child: Container(
              color: Color.fromRGBO(37, 39, 50, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Math.tex(r'\hat f(\xi) = \int_{-\infty}^\infty {f(x)e^{- 2\pi i \xi x}\mathrm{d}x}', mathStyle: MathStyle.display, textStyle: TextStyle(color: Colors.white.withOpacity(1)),textScaleFactor: 1.5,)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("$output", textScaleFactor: 3, style: TextStyle(color: Colors.white.withOpacity(1)),)
                      ],
                    )
                  ],

              ),
            ),
          ),
          Expanded(
            flex: 1,
              child: Container(
                color: Color.fromRGBO(129, 90, 160, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [

                    DropdownButton(
                      value: _selectedText,
                      items: _dropDownItem(),
                      onChanged: (value){
                        switch(value){
                          case "Basic" :
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SecondScreen()),
                            );
                            break;
                          case "Others" :
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ThirdScreen()),
                            );
                            break;
                        }
                      },
                      hint: Text('Menu',style: TextStyle(color: Colors.white,),textAlign: TextAlign.end,),
                      dropdownColor: Colors.white,
                      icon: Icon(Icons.arrow_drop_down,color: Colors.white,),
                      iconSize: 36,

                      underline: SizedBox(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24
                      ),
                    ),
                    FlatButton(
                      child: Text('Units', textScaleFactor: 1.8, style: TextStyle(color: Colors.white,),),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SecondRoute() ),
                        );
                      },
                    ),

                    // SizedBox(width: 85.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(129, 90, 160, 0.5), textColor: Colors.white, onPressed: () {}, child: Text("Menu", style: GoogleFonts.lato(fontSize: 20,),),)),
                    // SizedBox(width: 80.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(129, 90, 160, 0.5), textColor: Colors.white, onPressed: () {}, child: Text("Units", style: GoogleFonts.lato(fontSize: 20,),),)),
                    SizedBox(width: 70.0, height: 55.0,
                        child: FlatButton(color: Color.fromRGBO(129, 90, 160, 0.5),
                          textColor: Colors.white, onPressed: () {},
                          child: Text("<", style: GoogleFonts.lato(fontSize: 40,),),)),
                    SizedBox(width: 70.0, height: 55.0,child: FlatButton(color: Color.fromRGBO(129, 90, 160, 0.5), textColor: Colors.white, onPressed: () {}, child: Text(">", style: GoogleFonts.lato(fontSize: 40,),),)),
                  ],
                ),
              ],
            ),
              ),),

          Expanded(
            flex: 4,
            child: Container(
              color: Color.fromRGBO(37,39,50,1.0),
              child: PageView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          Button(Input:"x²", Update_Input: update_input, Colorlist: MainColor, Size: 30.0,),
                          Button(Input:"xⁿ", Update_Input: update_input, Colorlist: MainColor, Size: 30.0,),
                          Button(Input:"√", Update_Input: update_input, Colorlist: MainColor, Size: 30.0,),
                          Button(Input:"ⁿ√", Update_Input: update_input, Colorlist: MainColor, Size: 30.0,),
                          Button(Input:"x/y", Update_Input: update_input, Colorlist: MainColor, Size: 20.0,),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          Button(Input:"logₓ", Update_Input: update_input, Colorlist: MainColor, Size: 15.0,),
                          Button(Input:"ℼ", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                          Button(Input:"θ", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                          Button(Input:"d/dx", Update_Input: update_input, Colorlist: MainColor, Size: 15.0,),
                          Button(Input:"∫x", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          Button(Input:"sin", Update_Input: update_input, Colorlist: MainColor, Size: 20.0,),
                          Button(Input:"cos", Update_Input: update_input, Colorlist: MainColor, Size: 20.0,),
                          Button(Input:"tan", Update_Input: update_input, Colorlist: MainColor, Size: 20.0,),
                          Button(Input:"rad", Update_Input: update_input, Colorlist: MainColor, Size: 20.0,),
                          Button(Input:"deg", Update_Input: update_input, Colorlist: MainColor, Size: 15.0,),
                        ],
                      ),
                    ],
                    //Jun Hao - trigo
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          Button(Input:"|☐|", Update_Input: update_input, Colorlist: MainColor, Size: 20.0,),
                          Button(Input:"(f o g)", Update_Input: update_input, Colorlist: MainColor, Size: 10.0,),
                          Button(Input:"f(x)", Update_Input: update_input, Colorlist: MainColor, Size: 20.0,),
                          Button(Input:"ln", Update_Input: update_input, Colorlist: MainColor, Size: 30.0,),
                          Button(Input:"eⁿ", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                        ],
                  ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          Button(Input:"(☐)'", Update_Input: update_input, Colorlist: MainColor, Size: 15.0,),
                          Button(Input:"δ/δx", Update_Input: update_input, Colorlist: MainColor, Size: 10.0,),
                          Button(Input:"lim", Update_Input: update_input, Colorlist: MainColor, Size: 20.0,),
                          Button(Input:"⅀", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                          Button(Input:"e", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          Button(Input:"∞", Update_Input: update_input, Colorlist: MainColor, Size: 30.0,),
                          Button(Input:"≥", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                          Button(Input:"≤", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                          Button(Input:"x⁰", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                          Button(Input:"(☐)", Update_Input: update_input, Colorlist: MainColor, Size: 20.0,),
                        ],
                      ),
                    ],
                    // Su Quin - log functions
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          Button(Input:"cot", Update_Input: update_input, Colorlist: MainColor, Size: 20.0,),
                          Button(Input:"csc", Update_Input: update_input, Colorlist: MainColor, Size: 20.0,),
                          Button(Input:"sec", Update_Input: update_input, Colorlist: MainColor, Size: 20.0,),
                          Button(Input:"arcsin", Update_Input: update_input, Colorlist: MainColor, Size: 10.0,),
                          Button(Input:"arcos", Update_Input: update_input, Colorlist: MainColor, Size: 10.0,),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          Button(Input:"arctan", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                          Button(Input:"∫", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                          Button(Input:"∫∫", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                          Button(Input:"∫∫∫", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                          Button(Input:"⅀", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          Button(Input:"ℿ", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                          Button(Input:"lim", Update_Input: update_input, Colorlist: MainColor, Size: 20.0,),
                          Button(Input:"d/dx", Update_Input: update_input, Colorlist: MainColor, Size: 15.0,),
                          Button(Input:"d²/dx²", Update_Input: update_input, Colorlist: MainColor, Size: 10.0,),
                          Button(Input:"(☐)'", Update_Input: update_input, Colorlist: MainColor, Size: 15.0,),
                        ],
                      ),
                    ],
                    // Aravind - logical operators
                  )
                ]
              )
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Color.fromRGBO(37, 39, 50, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Button(Input:"7", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                      Button(Input: "8", Update_Input: update_input, Colorlist: MainColor,Size: 40.0,),
                      Button(Input: "9", Update_Input: update_input, Colorlist: MainColor, Size: 40.0),
                      Button(Input: "DEL", FullInput: input, Set_Input: set_input, Colorlist: SideColor, Size: 17.0),
                      Button(Input: "AC", Set_Input: set_input, Set_Output: set_output, Colorlist: SideColor, Size: 20.0,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Button(Input:"4", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                      Button(Input: "5", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                      Button(Input: "6", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                      Button(Input: "x", Update_Input: update_input, Colorlist: SideColor, Size: 40.0,),
                      Button(Input: "/", Update_Input: update_input, Colorlist: SideColor, Size: 40.0,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Button(Input:"1", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                      Button(Input: "2", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                      Button(Input: "3", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                      Button(Input: "+", Update_Input: update_input, Colorlist: SideColor, Size: 40.0,),
                      Button(Input: "-",Update_Input: update_input, Colorlist: SideColor, Size: 40.0,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Button(Input:".", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                      Button(Input: "0", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                      Button(Input: "x10^", Update_Input: update_input, Colorlist: MainColor, Size: 13.0,),
                      Button(Input: "ANS",PreviousAnswer: ans ,Update_Input: update_input, Colorlist: SideColor, Size: 16.0,),
                      Button(Input: "=",PreviousAnswer: ans,FullInput: input, Set_Output: set_output, Colorlist: SideColor, Size: 40.0,),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),


    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
