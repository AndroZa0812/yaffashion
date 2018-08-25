import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // debugShowMaterialGrid: true,
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Color.fromARGB(0xFF, 230, 57, 70),
            accentColor: Color.fromARGB(0xFF, 69, 123, 157),
            fontFamily: 'Arimo'),
        // home: AuthPage(),
        routes: {
          '/': (BuildContext context) => new Example01()
//            ProductsPage(_products, _addProduct, _deleteProduct),
//        '/admin': (BuildContext context) => ProductsAdminPage(),
        },
        onGenerateRoute: (RouteSettings settings) {});
  }
}

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(4, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
];

List<Widget> _tiles = <Widget>[
  _ImageTile(Colors.white, "images/image1.jpeg"),
  _ImageTile(Color.fromARGB(0xFF, 68, 103, 177), "images/facebook.png"),
  _GradientTile(
      "images/instagram.png",
      Alignment.topRight,
      Alignment.bottomLeft,
      Color.fromARGB(0xFF, 240, 148, 51),
      Color.fromARGB(0xFF,188, 24, 136),
      TileMode.repeated),
  const _IconTile(Colors.brown, Icons.map),
  const _IconTile(Colors.deepOrange, Icons.send),
  const _IconTile(Colors.indigo, Icons.airline_seat_flat),
  const _IconTile(Colors.red, Icons.bluetooth),
  const _IconTile(Colors.pink, Icons.battery_alert),
  const _IconTile(Colors.purple, Icons.desktop_windows),
];

class Example01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Example 01'),
        ),
        body: new Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: new StaggeredGridView.count(
              crossAxisCount: 4,
              staggeredTiles: _staggeredTiles,
              children: _tiles,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              padding: const EdgeInsets.all(4.0),
            )));
  }
}

class _IconTile extends StatelessWidget {
  const _IconTile(this.backgroundColor, this.iconData);

  final Color backgroundColor;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return new Card(  
      color: backgroundColor,
      child: new InkWell(
        onTap: () {},
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class _ImageTile extends StatelessWidget {
  _ImageTile(this.backgroundColor, this.imageUrl);

  Color backgroundColor;
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: backgroundColor,
      child: new InkWell(
        onTap: () {},
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(imageUrl),
          ),
        ),
      ),
    );
  }
}

class _GradientTile extends StatelessWidget {
  _GradientTile(this.image, this.startAlignment, this.endAlignment,
      this.startColor, this.endColor, this.tileMode);

  Alignment startAlignment;
  Alignment endAlignment;
  Color startColor;
  Color endColor;
  TileMode tileMode;
  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: startAlignment,
            end: endAlignment,
            colors: [startColor, endColor], // whitish to gray
            tileMode: tileMode, // repeats the gradient over the canvas
          ),
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(5.0),
              topRight: const Radius.circular(5.0),
              bottomRight: const Radius.circular(5.0),
              bottomLeft: const Radius.circular(5.0)),
          boxShadow: [
            new BoxShadow(
              color: Colors.black12,
              blurRadius: 1.0,
            ),
          ]),
      child: new InkWell(
        onTap: () {},
        child: Center(
          child: new Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(image),
          ),
        ),
      ),
      margin: EdgeInsets.all(3.0),
    );
  }
}
