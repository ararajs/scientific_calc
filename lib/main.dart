import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'dart:math' as math;
import 'package:petitparser/petitparser.dart';
import 'package:math_expressions/math_expressions.dart';
import 'functions.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';
import './converter_page.dart';
import './Utilities/ui_colors.dart';
import 'sizes_helpers.dart';
import 'mathtest.dart';
import "package:provider/provider.dart";
import "math_server.dart";


void main() {
  final Server _server = Server();
  _server.start();
  runApp(MyApp());
}

//insert latex parser


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => MathBoxController()),
        ChangeNotifierProvider<MathModel>(
          create: (context) => MathModel()
        )],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    )
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

  void initState() {
    super.initState();
  }
  void disposeState() {
    super.dispose();
  }


  bool toggleValue = false;
  toggleButton() {
    setState(() {
      toggleValue = !toggleValue;
    });
    //if(toggleValue = false)
      {

      }
    //else
      {

      }
            }

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
    List<String> dd1 = ["Graph", "Others"];
    return dd1.map(
            (value) =>
            DropdownMenuItem(
              value: value,
              child: Text(value),
            )
    ).toList();
  }

  Widget build(BuildContext context) {
    final mathBoxController =
    Provider.of<MathBoxController>(context, listen: false);
    final mathModel = Provider.of<MathModel>(context, listen: false);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(1.5),
        child: AppBar(
          backgroundColor: Color.fromRGBO(129, 90, 160, 1),
        ),
      ),
      body: Column(
        children: <Widget> [
          Expanded(
            flex: 4,
            child: Container(
              child: LatexScreen(),
              height: 500,
            )
          ),
          Container(
              alignment: Alignment.bottomRight,
                child: Consumer<MathModel>(
                    builder: (__, model, ___) {
                      output = model.result;
                      return(Text("$output", overflow: TextOverflow.ellipsis, textScaleFactor: 3, style: TextStyle(color: Colors.black.withOpacity(1)),));
                    }
            )
          ),
          Expanded(
            flex: 2,
              child: Container(
                width: displayWidth(context),
                color: Color.fromRGBO(129, 90, 160, 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget> [

                        DropdownButton(
                      value: _selectedText,
                      items: _dropDownItem(),
                      onChanged: (value){
                        switch(value){
                          case "Graph" :
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
                          MaterialPageRoute(builder: (context) => ConversionPage() ),
                        );
                      },
                    ),
                        Row(
                          children: [
                            LeftButton(Colorlist: SideColor, Size: 25.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: LeftButton(Colorlist: SideColor, Size: 25.0),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: LeftButton(Colorlist: SideColor, Size: 25.0),
                                ),
                              ],
                            ),
                            RightButton(Colorlist: SideColor, Size: 25.0),
                          ],
                        ),



                  ],
                ),
              ],
            ),
              ),),

          Expanded(
            flex: 5,
            child: Container(
                width: displayWidth(context),
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
                              Button(symb:"x²", InputList: ["^", "2"], Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"xⁿ", Input:"^", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"√", Input:"√", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"e", Input:r"\e", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"ℼ", Input:r"\pi", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget> [
                              Button(symb:"sin", InputList:[r"\sin", "("], Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"cos", InputList:[r"\sin", "("], Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"tan", InputList:[r"\sin", "("], Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"log", InputList: [r"\log","_","10","","("], Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"ln", InputList:[r"\log","_","2.71828","","("], Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),

                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget> [
                              Button(symb:"sin⁻¹", InputList:[r"\arcsin", "("], Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"cos⁻¹", InputList:[r"\arccos", "("], Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"tan⁻¹", InputList:[r"\arcsin", "("], Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"(", Input:"(", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:")", Input:")", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),



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
                              Button(symb:"x/y", Input:"/", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"eⁿ", Input:["e", "^"], Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"ⁿ√", InputList:["√", "^"], Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"d/dx", Input:"", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"∫x", Input: "", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget> [
                              Button(symb:"cot", Input:r"\cot", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"csc", Input:r"\csc", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"sec", Input:r"\sec", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"logₓ", InputList:[r"\log","_",], Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"", Input:"", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget> [
                              Button(symb:"", Input:"∞", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"", Input:"≥", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"", Input:"≤", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"", Input:"x⁰", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"", Input:"(☐)", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),


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
                              Button(symb:"", Input:"", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"", Input:"", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"", Input:"", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"", Input:"", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"", Input:"", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget> [
                              Button(symb:"", Input:"", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"", Input:"", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"", Input:"", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"", Input:"", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget> [
                              Button(symb:"", Input:"", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"", Input:"", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"", Input:"", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"", Input:"", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"", Input:"", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
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
            flex: 5,
            child: Container(
              width: displayWidth(context),
              color: Color.fromRGBO(37, 39, 50, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Button(symb:"7", Input:"7", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.08,),
                      Button(symb:"8", Input: "8", Update_Input: update_input, Colorlist: MainColor,Size: displayWidth(context) * 0.08,),
                      Button(symb:"9", Input: "9", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.08,),
                      delButton(Colorlist: SideColor, Size: displayWidth(context) * 0.04,),
                      delAllButton(Colorlist: SideColor, Size: displayWidth(context) * 0.04,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Button(symb:"4", Input:"4", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.08,),
                      Button(symb:"5", Input: "5", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.08,),
                      Button(symb:"6", Input: "6", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.08,),
                      Button(symb:"×", Input: "\\\\times", Update_Input: update_input, Colorlist: SideColor, Size: displayWidth(context) * 0.08,),
                      Button(symb:"÷", Input: r"\div", Update_Input: update_input, Colorlist: SideColor, Size: displayWidth(context) * 0.08,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Button(symb:"1", Input:"1", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.08,),
                      Button(symb:"2", Input: "2", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.08,),
                      Button(symb:"3", Input: "3", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.08,),
                      Button(symb:"+", Input: "+", Update_Input: update_input, Colorlist: SideColor, Size: displayWidth(context) * 0.08,),
                      Button(symb:"-", Input: "-",Update_Input: update_input, Colorlist: SideColor, Size: displayWidth(context) * 0.08,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Button(symb:".", Input:".", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.08,),
                      Button(symb:"0", Input: "0", Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.08,),
                      Button(symb:"10^x", InputList: ["\\\\times","10", "^"], Update_Input: update_input, Colorlist: MainColor, Size: displayWidth(context) * 0.04,),
                      Button(symb:"ANS", Input: "\\\\text{ANS}",PreviousAnswer: ans ,Update_Input: update_input, Colorlist: SideColor, Size: displayWidth(context) * 0.04,),
                      eqButton(Colorlist: SideColor, Size: displayWidth(context) * 0.08,),
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

      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Unit'),
        ),
      ),
    );
  }
}
