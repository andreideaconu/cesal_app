import 'package:cesal_app/model/promotion.dart';
import 'package:cesal_app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

class PromotionTile extends StatelessWidget {
  final Promotion promotion;
  final int count;

  PromotionTile({this.promotion, this.count});

  @override
  Widget build(BuildContext context) {
    double appBarSize = AppBar().preferredSize.height;

    return GestureDetector(
      onTap: () => launchURL(promotion.link),
      child: Card(
        elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
          child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0),
            image: DecorationImage(
                image: NetworkImage(promotion.imageUrl), fit: BoxFit.cover)),
      )),
    );
  }

  launchURL(String link) async {
    await FlutterWebBrowser.openWebPage(url: link, androidToolbarColor: yellow);
  }
}
