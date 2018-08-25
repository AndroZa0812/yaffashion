import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                AppBar(
                  automaticallyImplyLeading: false,
                  title: Text('תפריט'),
                ),
                ListTile(
                  title: Text('קולקצית 2018'),
                  onTap: () {
//                Navigator.pushReplacementNamed(context, '/admin');
                  },
                )
              ],
            ),
          ),
          appBar: AppBar(
            title: Text("יפה בלבן"),
          ),
          body: new Container(
            color: Colors.white30,
            child: new GridView.count(
                crossAxisCount: 4,
                childAspectRatio: 1.0,
                padding: const EdgeInsets.all(4.0),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                children: <String>[
                  'http://www.for-example.org/img/main/forexamplelogo.png',
                  'http://www.for-example.org/img/main/forexamplelogo.png',
                  'http://www.for-example.org/img/main/forexamplelogo.png',
                  'http://www.for-example.org/img/main/forexamplelogo.png',
                  'http://www.for-example.org/img/main/forexamplelogo.png',
                  'http://www.for-example.org/img/main/forexamplelogo.png',
                  'http://www.for-example.org/img/main/forexamplelogo.png',
                  'http://www.for-example.org/img/main/forexamplelogo.png',
                ].map((String url) {
                  return new GridTile(
                      child: new Image.network(url, fit: BoxFit.cover));
                }).toList()),
          )),
    );
  }
}

//
//          Column(
//            children: <Widget>[
//              Image.asset("images/image1.jpeg"),
////                      Text(products[index]['title']),
//            ],
//          ),
