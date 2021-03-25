import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'dart:convert';
import "package:mime/mime.dart";
import "package:provider/provider.dart";
import "package:flutter/services.dart";
import "package:flutter_app/functions.dart";


class Server {
  // class from inAppBrowser

  HttpServer _server;

  int _port = 8080;

  Server({int port = 8080}) {
    this._port = port;
  }

  ///Closes the server.
  Future<void> close() async {
    if (this._server != null) {
      await this._server.close(force: true);
      print('Server running on http://localhost:$_port closed');
      this._server = null;
    }
  }

  Future<void> start() async {
    if (this._server != null) {
      throw Exception('Server already started on http://localhost:$_port');
    }

    var completer = new Completer();
    runZoned(() {
      HttpServer.bind('127.0.0.1', _port, shared: true).then((server) {
        print('Server running on http://localhost:' + _port.toString());

        this._server = server;

        server.listen((HttpRequest request) async {
          var body = List<int>();
          var path = request.requestedUri.path;
          path = (path.startsWith('/')) ? path.substring(1) : path;
          path += (path.endsWith('/')) ? 'index.html' : '';

          try {
            body = (await rootBundle.load(path)).buffer.asUint8List();
          } catch (e) {
            print(e.toString());
            request.response.close();
            return;
          }

          var contentType = ['text', 'html'];
          if (!request.requestedUri.path.endsWith('/') &&
              request.requestedUri.pathSegments.isNotEmpty) {
            var mimeType =
            lookupMimeType(request.requestedUri.path, headerBytes: body);
            if (mimeType != null) {
              contentType = mimeType.split('/');
            }
          }

          request.response.headers.contentType =
          new ContentType(contentType[0], contentType[1], charset: 'utf-8');
          request.response.add(body);
          request.response.close();
        });

        completer.complete();
      });
    }, onError: (e, stackTrace) => print('Error: $e $stackTrace'));

    return completer.future;
  }
}

class LatexScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LatexScreenState();

}

class _LatexScreenState extends State<LatexScreen> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  final mathBoxController = MathBoxController();
  final mathModelController = MathModel();

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mathBoxController =
    Provider.of<MathBoxController>(context, listen: false);
    final mathModelController = Provider.of<MathModel>(context, listen: false);
    return Container(
        child: WebView(
            initialUrl: "http://localhost:8080/assets/html/homepage.html",
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
              mathBoxController.webViewController = webViewController;
            },
            javascriptMode: JavascriptMode.unrestricted,
            javascriptChannels: Set.from([
              JavascriptChannel(
                  name: "latexString",
                  onMessageReceived: (JavascriptMessage message){
                    mathModelController.updateExpression(message.message);
                    mathModelController.calcNumber();
                  }
              ),
              JavascriptChannel(
              name: 'clearable',
              onMessageReceived: (JavascriptMessage message) {
                mathModelController.changeClearable(
                    message.message == 'false' ? false : true);
              }
              ),
            ])
        )
    );
  }
}

class MathBoxController {

  WebViewController _webViewController;
  AnimationController clearAnimationController;

  set webViewController(WebViewController controller) {
    this._webViewController = controller;
  }

  void addExpression(String msg, {bool isOperator = false}) {
    assert(_webViewController != null);
    _webViewController.evaluateJavascript("addCmd('$msg', {isOperator: ${isOperator.toString()}})");
  }

  void addString(String msg) {
    assert(_webViewController != null);
    _webViewController.evaluateJavascript("addString('$msg')");
  }

  void equal() {
    assert(_webViewController != null);
    _webViewController.evaluateJavascript("equal()");
  }

  void addKey(String key) {
    assert(_webViewController != null);
    _webViewController.evaluateJavascript("simulateKey('$key')");
  }

  void deleteExpression() {
    assert(_webViewController != null);
    _webViewController.evaluateJavascript("delString()");
  }

  void deleteAllExpression() {
    assert(_webViewController != null);
    _webViewController.evaluateJavascript("delAll()");
  }

}