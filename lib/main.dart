import 'dart:async';

import 'package:cesal_app/screens/home.dart';
import 'package:cesal_app/screens/splash_screen.dart';
import 'package:cesal_app/services/push_notifications_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  PushNotificationsManager notificationsManager = new PushNotificationsManager();
  notificationsManager.init();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ATLAS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'CorporativeSansRd'
      ),
      home: MyHomePage(title: 'ATLAS'),
        debugShowCheckedModeBanner: false
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 4),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => HomeScreen())));

    return SplashScreen();
  }
}
