import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pageview/UI/Pages/SplashScreen.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

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
  }

  int _indexPage = 1;
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
                // _webView('https://tacsi.orstores.com/'),
                _webView('https://itemshop.orstores.com/'),
                // _webView('http://orstores.com/tv'),
                _webView('https://bancorhg.com/'),
                // _webView('https://habitad.orstores.com/'),
                _webView('https://chator.orstores.com/'),
                // _webView('http://mapas.orstores.com/login'),
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
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // _iconButon('assets/icons/tarjeta.png', 0),
          _iconButon('assets/icons/compras.png', 0),
          // _iconButon('assets/icons/tv.png', 2),
          _iconButon('assets/icons/home.png', 1),
          // _iconButon('assets/icons/personas.png', 4),
          _iconButon('assets/icons/chat.png', 2),
          // _iconButon('assets/icons/satelite.png', 6),
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
    return InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(uri)),
      initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            javaScriptEnabled: true,
            useShouldOverrideUrlLoading: true,
            mediaPlaybackRequiresUserGesture: false,
          ),
          android: AndroidInAppWebViewOptions(
            useHybridComposition: true,
          ),
          ios: IOSInAppWebViewOptions(
            allowsInlineMediaPlayback: true,
          )),
      androidOnPermissionRequest: (controller, origin, resources) async {
        return PermissionRequestResponse(
            resources: resources,
            action: PermissionRequestResponseAction.GRANT);
      },
      onConsoleMessage: (t, c) {
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(c.message)),
        );
      },
    );
  }
}
