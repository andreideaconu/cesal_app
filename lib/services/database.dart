import 'package:cesal_app/model/promotion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference promotions = Firestore.instance.collection('promotii');

  List<Promotion> promotionListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Promotion(
          title: doc.data['titlu'],
          imageUrl: doc.data['imagine'],
          link: doc.data['link'],
          active: doc.data['activ']);
    }).toList();
  }

  Stream<List<Promotion>> get promotionList {
    return promotions
        .where('activ', isEqualTo: true)
        .orderBy('order')
        .snapshots()
        .map(promotionListFromSnapshot);
  }
}