import 'package:cesal_app/model/promotion.dart';
import 'package:cesal_app/services/database.dart';
import 'package:cesal_app/shared/colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'active_promotions2.dart';
import 'file:///D:/CESAL/App_Oct2020/cesal_app/lib/screens/active_promotions.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _selectedItemColor = gray;
  final _unselectedItemColor = Colors.black54;
  final _selectedBgColor = yellow;
  final _unselectedBgColor = Colors.white70;

  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//  static List<Widget> _widgetOptions = <Widget>[ActivePromotions(), News()];
//
//  Future<void> _onItemTapped(int index) async {
//    setState(() {
//      _selectedIndex = index;
//    });
//  }
//
//  Widget _buildIcon(IconData iconData, String text, int index) => Container(
//        width: double.infinity,
//        height: kBottomNavigationBarHeight,
//        child: Material(
//          color: _getBgColor(index),
//          child: InkWell(
//            enableFeedback: false,
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Icon(iconData),
//                Text(text,
//                    style:
//                        TextStyle(fontSize: 12, color: _getItemColor(index))),
//              ],
//            ),
//            onTap: () => _onItemTapped(index),
//          ),
//        ),
//      );

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Promotion>>.value(
      value: DatabaseService().promotionList,
      child: Scaffold(
        /*appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          //title: Image.asset('assets/CesalLogoPng.png', height: 70),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    showExitWindow(context);
                  },
                  child: Icon(
                    EvaIcons.settings2Outline,
                    color: gray,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    showExitWindow(context);
                  },
                  child: Icon(
                    Icons.exit_to_app,
                    color: gray,
                  ),
                )),
          ],
        ),*/
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ActivePromotions2()
              )]
            ),
          ),
        ),
//        body: _widgetOptions.elementAt(_selectedIndex),
//        bottomNavigationBar: BottomNavigationBar(
//          selectedFontSize: 0,
//          items: <BottomNavigationBarItem>[
//            BottomNavigationBarItem(
//              icon: _buildIcon(Icons.new_releases, 'Promoții', 0),
//              title: SizedBox.shrink(),
//            ),
//            BottomNavigationBarItem(
//              icon: _buildIcon(Icons.toc, 'Noutăți', 1),
//              title: SizedBox.shrink(),
//            ),
//          ],
//          currentIndex: _selectedIndex,
//          selectedItemColor: _selectedItemColor,
//          unselectedItemColor: _unselectedItemColor,
//        ),
    );
  }

  Future<bool> showExitWindow(context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Container(
                    height: 150.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Column(children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            height: 70.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              color: yellow,
                            ),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Dorești să închizi aplicația?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: gray, fontSize: 19.0),
                                )),
                          ),
                        ],
                      ),
                      Container(
                        height: 80,
                        child: Align(
                          alignment: Alignment.center,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 30,
                                  child: FlatButton(
                                    child: Center(
                                        child: Text(
                                      'Da',
                                    )),
                                    shape: new RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                            style: BorderStyle.solid),
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    onPressed: () {
                                      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                                    },
                                  ),
                                ),
                                SizedBox(width: 10),
                                SizedBox(
                                  height: 30,
                                  child: FlatButton(
                                    child: Center(
                                        child: Text(
                                      'Nu',
                                    )),
                                    shape: new RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                            style: BorderStyle.solid),
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                )
                              ]),
                        ),
                      )
                    ])));
          });
        });
  }
}
