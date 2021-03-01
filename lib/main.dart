import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_math/flutter_math.dart';
import 'dart:math' as math;
import 'package:petitparser/petitparser.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'functions.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';


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
                        Math.tex("$input", textScaleFactor: 3.5, textStyle: TextStyle(color: Colors.white),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(child: Text("$output", overflow: TextOverflow.ellipsis, textScaleFactor: 3, style: TextStyle(color: Colors.white.withOpacity(1)),))
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
                              MaterialPageRoute(builder: (context) => BrowserPage()),
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
                              Button(symb:"x²", Input:"x²", Update_Input: update_input, Colorlist: MainColor, Size: 30.0,),
                              Button(symb:"xⁿ", Input:"xⁿ", Update_Input: update_input, Colorlist: MainColor, Size: 30.0,),
                              Button(symb:"√", Input:"√", Update_Input: update_input, Colorlist: MainColor, Size: 30.0,),
                              Button(symb:"ⁿ√", Input:"ⁿ√", Update_Input: update_input, Colorlist: MainColor, Size: 30.0,),
                              Button(symb:"x/y", Input:"x/y", Update_Input: update_input, Colorlist: MainColor, Size: 20.0,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget> [
                              Button(symb:"sin", Input:r"\sin", Update_Input: update_input, Colorlist: MainColor, Size: 20.0,),
                              Button(symb:"cos", Input:r"\cos", Update_Input: update_input, Colorlist: MainColor, Size: 20.0,),
                              Button(symb:"tan", Input:r"\tan", Update_Input: update_input, Colorlist: MainColor, Size: 20.0,),
                              Button(symb:"rad", Input:r"\rad", Update_Input: update_input, Colorlist: MainColor, Size: 20.0,),
                              Button(symb:"deg", Input:"deg", Update_Input: update_input, Colorlist: MainColor, Size: 15.0,),

                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget> [
                              Button(symb:"logₓ", Input:"logₓ", Update_Input: update_input, Colorlist: MainColor, Size: 15.0,),
                              Button(symb:"ln", Input:"ln", Update_Input: update_input, Colorlist: MainColor, Size: 30.0,),
                              Button(symb:"ℼ", Input:"ℼ", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                              Button(symb:"d/dx", Input:"d/dx", Update_Input: update_input, Colorlist: MainColor, Size: 15.0,),
                              Button(symb:"∫x", Input:"∫x", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),

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
                              Button(symb:"|☐|", Input:"|☐|", Update_Input: update_input, Colorlist: MainColor, Size: 20.0,),
                              Button(symb:"(f o g)", Input:"(f o g)", Update_Input: update_input, Colorlist: MainColor, Size: 10.0,),
                              Button(symb:"f(x)", Input:"f(x)", Update_Input: update_input, Colorlist: MainColor, Size: 20.0,),
                              Button(symb:"θ", Input:"θ", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                              Button(symb:"eⁿ", Input:"eⁿ", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget> [
                              Button(symb:"(☐)", Input:"(☐)", Update_Input: update_input, Colorlist: MainColor, Size: 15.0,),
                              Button(symb:"δ/δx", Input:"δ/δx", Update_Input: update_input, Colorlist: MainColor, Size: 10.0,),
                              Button(symb:"lim", Input:"lim", Update_Input: update_input, Colorlist: MainColor, Size: 20.0,),
                              Button(symb:"⅀", Input:"⅀", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                              Button(symb:"e", Input:"e", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget> [
                              Button(symb:"∞", Input:"∞", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                              Button(symb:"≥", Input:"≥", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                              Button(symb:"≤", Input:"≤", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                              Button(symb:"x⁰", Input:"x⁰", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                              Button(symb:"(☐)", Input:"(☐)", Update_Input: update_input, Colorlist: MainColor, Size: 20.0,),


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
                              Button(symb:"cot", Input:"cot", Update_Input: update_input, Colorlist: MainColor, Size: 20.0,),
                              Button(symb:"csc", Input:"csc", Update_Input: update_input, Colorlist: MainColor, Size: 20.0,),
                              Button(symb:"sec", Input:"sec", Update_Input: update_input, Colorlist: MainColor, Size: 20.0,),
                              Button(symb:"arcsin", Input:"arcsin", Update_Input: update_input, Colorlist: MainColor, Size: 10.0,),
                              Button(symb:"arcos", Input:"arcos", Update_Input: update_input, Colorlist: MainColor, Size: 10.0,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget> [
                              Button(symb:"arctan", Input:"arctan", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                              Button(symb:"logₓ", Input:r"\left(\right)", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                              Button(Input:r"", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                              Button(Input:"7", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                              Button(Input:"7", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget> [
                              Button(Input:"7", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                              Button(Input:"7", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                              Button(Input:"7", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                              Button(Input:"7", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                              Button(Input:"7", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
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
                      Button(symb:"7", Input:"7", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                      Button(symb:"8", Input: "8", Update_Input: update_input, Colorlist: MainColor,Size: 40.0,),
                      Button(symb:"9", Input: "9", Update_Input: update_input, Colorlist: MainColor, Size: 40.0),
                      Button(symb:"DEL", Input: "DEL", FullInput: input, Set_Input: set_input, Colorlist: SideColor, Size: 17.0),
                      Button(symb:"AC", Input: "AC", Set_Input: set_input, Set_Output: set_output, Colorlist: SideColor, Size: 20.0,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Button(symb:"4", Input:"4", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                      Button(symb:"5", Input: "5", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                      Button(symb:"6", Input: "6", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                      Button(symb:"×", Input: r"\times", Update_Input: update_input, Colorlist: SideColor, Size: 40.0,),
                      Button(symb:"÷", Input: r"\div", Update_Input: update_input, Colorlist: SideColor, Size: 40.0,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Button(symb:"1", Input:"1", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                      Button(symb:"2", Input: "2", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                      Button(symb:"3", Input: "3", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                      Button(symb:"+", Input: "+", Update_Input: update_input, Colorlist: SideColor, Size: 40.0,),
                      Button(symb:"-", Input: "-",Update_Input: update_input, Colorlist: SideColor, Size: 40.0,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Button(symb:".", Input:".", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                      Button(symb:"0", Input: "0", Update_Input: update_input, Colorlist: MainColor, Size: 40.0,),
                      Button(symb:"10^x", Input: r"\times 10^x", Update_Input: update_input, Colorlist: MainColor, Size: 13.0,),
                      Button(symb:"ANS", Input: r"\text{ANS}",PreviousAnswer: ans ,Update_Input: update_input, Colorlist: SideColor, Size: 16.0,),
                      Button(symb:"=", Input: "=",PreviousAnswer: ans,FullInput: input, Set_Output: set_output, Colorlist: SideColor, Size: 40.0,),
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

class BrowserPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Graph")),
        body: SafeArea(
          child: WebView(
              initialUrl: "",
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              javascriptMode: JavascriptMode.unrestricted),
        )
    );
  }

  @override
  void initState() {
    super.initState();
    _controller.future.then((controller) {
      _loadHtmlFromAssets(controller);
    });
  }

  Future<void> _loadHtmlFromAssets(WebViewController controller) async {
    String fileText = await rootBundle.loadString('assets/index.html');
    String theURI = Uri.dataFromString(fileText,
        mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString();

    setState(() {
      print(theURI);
      controller.loadUrl(theURI);
    });
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
