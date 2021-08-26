import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indexPage = 0;
  @override
  Widget build(BuildContext context) {
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
                Container(color: Colors.red),
                Container(color: Colors.blue),
                Container(color: Colors.orange),
                Container(color: Colors.green),
                Container(color: Colors.grey),
                Container(color: Colors.indigo),
                Container(color: Colors.pink),
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
}
