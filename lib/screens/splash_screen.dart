import 'package:cesal_app/shared/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.9],
          colors: [
            blue1,
            blue2,
            blue3
          ],
        ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/AtlasLogo.png', height: 120),
              SizedBox(height: MediaQuery.of(context).orientation == Orientation.portrait ? 150 : 70),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: SizedBox(
                  height: 27,
                  width: 27,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 3.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
