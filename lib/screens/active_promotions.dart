import 'package:cesal_app/model/promotion.dart';
import 'package:cesal_app/services/database.dart';
import 'package:cesal_app/widgets/promotion_list.dart';
import 'package:cesal_app/widgets/promotion_list2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActivePromotions extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Promotion>>.value(
      value: DatabaseService().promotionList,
      child: PromotionList()
    );
  }
}
