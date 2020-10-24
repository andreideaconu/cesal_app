import 'package:cesal_app/model/promotion.dart';
import 'package:cesal_app/widgets/promotion_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PromotionList2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final promotions = Provider.of<List<Promotion>>(context);

    if (promotions != null) {
      return MediaQuery.of(context).orientation == Orientation.portrait
          ? GridView.count(
              crossAxisCount: 1,
              padding: EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 0.0),
              childAspectRatio: 2.3,
              shrinkWrap: true,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              children: promotions
                  .map((item) =>
                      PromotionTile(promotion: item, count: promotions.length))
                  .toList())
          : GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 0.0),
              childAspectRatio: 2.3,
              shrinkWrap: true,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              children: promotions
                  .map((item) =>
                      PromotionTile(promotion: item, count: promotions.length))
                  .toList());
    }
    return Container();
  }
}
