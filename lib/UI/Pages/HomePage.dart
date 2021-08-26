import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pageview/UI/Pages/SplashScreen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _positionPage = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Timer(Duration(seconds: 4), () {
        _positionPage = MediaQuery.of(context).size.height;
        setState(() {});
      });
    });
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  int _indexPage = 3;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _bodyHome(),
        AnimatedPositioned(
          child: SplashScreen(),
          duration: Duration(milliseconds: 400),
          bottom: _positionPage,
        ),
      ],
    );
  }

  Scaffold _bodyHome() {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45,
        title: Column(
          children: [
            Center(child: Text("Comunidad OR")),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: _indexPage,
              children: [
                _webView('https://tacsi.orstores.com/'),
                _webView('https://itemshop.orstores.com/'),
                _webView('http://orstores.com/tv'),
                _webView('https://bancorhg.com/'),
                _webView('http://habitad.orstores.com/'),
                _webView('http://chator.orstores.com/'),
                _webView('http://mapas.orstores.com/login'),
              ],
            ),
          ),
          _bottomNavigatorBar(),
        ],
      ),
    );
  }

  Widget _bottomNavigatorBar() {
    return Container(
      height: 50,
      color: Colors.orange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _iconButon('assets/icons/tarjeta.png', 0),
          _iconButon('assets/icons/compras.png', 1),
          _iconButon('assets/icons/tv.png', 2),
          _iconButon('assets/icons/home.png', 3),
          _iconButon('assets/icons/personas.png', 4),
          _iconButon('assets/icons/chat.png', 5),
          _iconButon('assets/icons/satelite.png', 6),
        ],
      ),
    );
  }

  Widget _iconButon(String image, int index) {
    return InkWell(
      onTap: () {
        _indexPage = index;
        setState(() {});
      },
      child: Image.asset(
        image,
        color: index == _indexPage ? null : Colors.grey,
        width: 40,
        height: 40,
      ),
    );
  }

  Widget _webView(String uri) {
    return WebView(
      initialUrl: uri,
      javascriptMode: JavascriptMode.unrestricted,
      javascriptChannels: <JavascriptChannel>{
        _toasterJavascriptChannel(context),
      },
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }
}
