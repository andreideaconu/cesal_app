import 'package:cesal_app/model/promotion.dart';
import 'package:cesal_app/widgets/promotion_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PromotionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final promotions = Provider.of<List<Promotion>>(context);
    if (promotions != null) {
      return MediaQuery.of(context).orientation == Orientation.portrait ? ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 14.0),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: promotions.length,
          itemBuilder: (context, index) {
              return PromotionTile(promotion: promotions[index], count: promotions.length);
          }) :
      Container(
        constraints: BoxConstraints(
          maxHeight: 600,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 14.0),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: promotions.length,
                itemBuilder: (context, index) {
                  return PromotionTile(promotion: promotions[index], count: promotions.length);
                }),],
        ),
      ) ;
    }
    return Container();
  }
}
