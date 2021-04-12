import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/quadratic.dart';
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
import "package:flutter_app/settingspage.dart";
import 'package:complex/complex.dart' as complex1;
import 'package:linalg/linalg.dart';



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
        ChangeNotifierProvider(create: (_) => SettingModel()),
        ChangeNotifierProxyProvider<SettingModel, MathModel>(
          create: (context) => MathModel(),
          update: (context, settings, model) => model
            ..changeSetting(
              precision: settings.precision.toInt(),
              isRadMode: settings.isRadMode
            ),
        ),
        ChangeNotifierProxyProvider<SettingModel, MatrixModel>(
          create: (context) => MatrixModel(),
          update: (context, settings, model) => model
            ..changeSetting(
              precision: settings.precision.toInt(),
            ),
        ),
        ListenableProxyProvider<SettingModel, CalculationMode>(
          create: (context) => CalculationMode(Mode.Basic),
          update: (context, settings, model) {
              switch (settings.initPage) {
                case 0:
                  if (model.value == Mode.Matrix) {
                    model.value = Mode.Basic;
                  }
                  break;
                case 1:
                  model.changeMode(Mode.Matrix);
                  break;
              }
            return model;
          },
          dispose: (context, value) => value.dispose(),
        ),],
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


  //insert parser function here


  List<DropdownMenuItem<String>> _dropDownItem() {
    List<String> dd1 = ["Graph", "Matrices","Equations","Settings"];
    return dd1.map(
            (value) =>
            DropdownMenuItem(
              value: value,
              child: Text(value),
            )
    ).toList();
  }

  Widget build(BuildContext context) {
    final mode = Provider.of<CalculationMode>(context, listen: false);
    final mathBoxController =
    Provider.of<MathBoxController>(context, listen: false);
    final mathModel = Provider.of<MathModel>(context, listen: false);
    final matrixModel = Provider.of<MatrixModel>(context, listen: false);
    final setting = Provider.of<SettingModel>(context, listen: false);
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
              height: displayHeight(context),
            )
          ),//InputScreen
          Expanded(
            flex: 1,
            child: Container(
                alignment: Alignment.bottomRight,
                  height: displayHeight(context)*0.08,
                  child:
                      Consumer<MathModel>(
                      builder: (__, model, ___) {
                        output = model.result;
                        return(Text("$output", overflow: TextOverflow.ellipsis, textScaleFactor: 3, style: TextStyle(color: Colors.black.withOpacity(1)),));
                      }
                      )
            ),
          ),//OutputScreen
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
                          case "Equations" :
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TabsPage()),
                            );
                            break;
                          case "Graph" :
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BrowserPage()),
                            );
                            break;
                          case "Matrices" :
                                  if (mode.value == Mode.Matrix) {
                                    mode.value = Mode.Basic;
                                    mathBoxController.deleteAllExpression();
                                  }
                                  else {
                                    mode.value = Mode.Matrix;
                                    mathBoxController.deleteAllExpression();
                                    mathBoxController.addExpression(
                                        '\\\\bmatrix');
                                  }
                                  break;
                          case "Settings" :
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SettingPage()),
                            );
                            break;
                        }
                      },
                        hint: Padding(
                          padding: const EdgeInsets.fromLTRB(30,0,0,0),
                          child: Text('Menu',style: TextStyle(color: Colors.white,fontSize: 30),textAlign: TextAlign.end,),
                        ),
                          dropdownColor: Colors.white,
                        icon: Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,10,0),
                          child: Icon(Icons.arrow_drop_down,color: Colors.white,),
                        ),
                          iconSize: 36,

                        underline: SizedBox(),
                          style: TextStyle(
                          color: Colors.black,
                          fontSize: 24
                      ),
                    ),//Menu(Graph,Matrices,Settings)
                        FlatButton(
                          child: Text('Units', textScaleFactor: 2, style: TextStyle(color: Colors.white,),),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ConversionPage() ),
                                );
                      },
                    ),//Unit Converter
                        Row(
                          children: [
                            LeftButton(Colorlist: SideColor, Size: 30.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: UpButton(Colorlist: SideColor, Size: 25.0),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: DownButton(Colorlist: SideColor, Size: 25.0),
                                ),
                              ],
                            ),
                            RightButton(Colorlist: SideColor, Size: 30.0),
                          ],
                        ),//Cursor Arrows



                  ],
                ),
              ],
            ),
              ),),//Additional Functions
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
                              Button(symb:"x²", InputList: ["^", "2"],  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"xⁿ", Input:"^",  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"√", Input:"\\sqrt",  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"e", Input:r"\e",  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"ℼ", Input:r"\pi",  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget> [
                              Button(symb:"sin", InputList:[r"\sin", "("],  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"cos", InputList:[r"\cos", "("],  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"tan", InputList:[r"\\tan", "("],  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"log", InputList: [r"\log","_","10","","("],  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"ln", InputList:[r"\ln","("],  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),

                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget> [
                              Button(symb:"sin⁻¹", InputList:[r"\arcsin", "("],  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"cos⁻¹", InputList:[r"\arccos", "("],  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"tan⁻¹", InputList:[r"\arctan", "("],  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"(", Input:"(",  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:")", Input:")",  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),



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
                              Button(symb:"x/y", Input:"/",  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"eⁿ", Input:["e", "^"],  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"ⁿ√", InputList:["\\\\nthroot"],  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"d/dx", Input:"",  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"∫x", Input: "\\int",  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget> [
                              Button(symb:"csc", InputList:[r"\csc", "("],  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"sec", InputList:[r"\sec", "("],  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"cot", InputList:[r"\cot", "("],  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"csc⁻¹", InputList:[r"\arccsc", "("],  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"sec⁻¹", InputList:[r"\arcsec", "("],  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget> [
                              Button(symb:"cot⁻¹", InputList:[r"\arccot", "("],  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"x", Input:"x",  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"diff", InputList:["d", "/", "dx","Right" ,"(", ")", r"\\vert", "_", "x", "="],  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"=_t", Input:"=",  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"", Input:"(☐)",  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),


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
                              Button(symb:"logₓ", InputList:[r"\log","_",],  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"matrix_trial", Input:"\\\\bmatrix",  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"AddC", InputList:["Shift-Spacebar"],  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"AddR", InputList:["Shift-Enter"],  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"Del", InputList:["Backspace"],  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget> [
                              Button(symb:"", Input:"",  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"", Input:"",  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"", Input:"",  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"", Input:"",  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget> [
                              Button(symb:"", Input:"",  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"", Input:"",  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"", Input:"",  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"", Input:"",  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                              Button(symb:"", Input:"",  Colorlist: MainColor, Size: displayWidth(context) * 0.065,),
                            ],
                          ),
                        ],
                        // Aravind - logical operators
                      )
                    ]
                )
            ),
          ),//Scientific Functions
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
                      Button(symb:"7", Input:"7",  Colorlist: MainColor, Size: displayWidth(context) * 0.08,),
                      Button(symb:"8", Input: "8",  Colorlist: MainColor,Size: displayWidth(context) * 0.08,),
                      Button(symb:"9", Input: "9",  Colorlist: MainColor, Size: displayWidth(context) * 0.08,),
                      delButton(Colorlist: SideColor, Size: displayWidth(context) * 0.04,),
                      delAllButton(Colorlist: SideColor, Size: displayWidth(context) * 0.04,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Button(symb:"4", Input:"4",  Colorlist: MainColor, Size: displayWidth(context) * 0.08,),
                      Button(symb:"5", Input: "5",  Colorlist: MainColor, Size: displayWidth(context) * 0.08,),
                      Button(symb:"6", Input: "6",  Colorlist: MainColor, Size: displayWidth(context) * 0.08,),
                      Button(symb:"×", Input: "\\\\times",  Colorlist: SideColor, Size: displayWidth(context) * 0.08,),
                      Button(symb:"÷", Input: r"\div",  Colorlist: SideColor, Size: displayWidth(context) * 0.08,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Button(symb:"1", Input:"1",  Colorlist: MainColor, Size: displayWidth(context) * 0.08,),
                      Button(symb:"2", Input: "2",  Colorlist: MainColor, Size: displayWidth(context) * 0.08,),
                      Button(symb:"3", Input: "3",  Colorlist: MainColor, Size: displayWidth(context) * 0.08,),
                      Button(symb:"+", Input: "+",  Colorlist: SideColor, Size: displayWidth(context) * 0.08,),
                      Button(symb:"-", Input: "-", Colorlist: SideColor, Size: displayWidth(context) * 0.08,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Button(symb:".", Input:".",  Colorlist: MainColor, Size: displayWidth(context) * 0.08,),
                      Button(symb:"0", Input: "0",  Colorlist: MainColor, Size: displayWidth(context) * 0.08,),
                      Button(symb:"10^x", InputList: ["\\\\times","10", "^"],  Colorlist: MainColor, Size: displayWidth(context) * 0.04,),
                      Button(symb:"ANS", Input: "\\\\text{ANS}",PreviousAnswer: ans , Colorlist: SideColor, Size: displayWidth(context) * 0.04,),
                      eqButton(Colorlist: SideColor, Size: displayWidth(context) * 0.08,),
                    ],
                  ),
                ],
              ),
            ),
          ),//Basic Functions
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


