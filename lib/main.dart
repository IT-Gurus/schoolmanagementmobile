import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rolling_nav_bar/rolling_nav_bar.dart';
import 'package:schoolfrontendmobile/Movie.dart';

import 'Album.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Junior School',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Junior High School'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget tabContent = const TabBarView(children: [
    Center(
      child: Icon(Icons.ac_unit_sharp),
    ),
    Icon(Icons.directions_transit),
    Icon(Icons.directions_bike),
  ]);
  int _counter = 0;
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    late Widget child;

    switch (_index) {
      case 0:
        child = tabContent;
        break;
      case 1:
        child = Text("Second Tab");
        break;
      case 2:
        child = Text("Third Tab");
        break;
      default:
        child = tabContent;
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            
          ),
          backgroundColor:Color(0xff392850),
          body: SizedBox.expand(child: child),
          bottomNavigationBar: Container(
            height: 95,
            child: RollingNavBar.iconData(
              iconData: <IconData>[
                Icons.home,
                Icons.people,
                Icons.message,
              ],
              indicatorColors: <Color>[
                Colors.red,
                Colors.yellow,
                Colors.blue,
              ],

              iconText: [
                Text(
                  "Home",
                ),
                Text("People"),
                Text("Messages")
              ],
              onTap: (newIndex) => setState(() => _index = newIndex),
              animationType: AnimationType.shrinkOutIn,
              baseAnimationSpeed: 200,
              animationCurve: Curves.easeInCirc,
              badges: [
                Text("1", style: TextStyle(fontSize: 11)),
                Text("2"),
                Text("6")
              ],
              // nav items
            ),
          )),
    );
  }
}
