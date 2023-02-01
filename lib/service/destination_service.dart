import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/destination_model.dart';

class DestinationService {
  final _db = FirebaseFirestore.instance;

  Future<List<Destination>> getDestination() async {
    try {
      List<Destination> results = [];
      await _db
          .collection('destination')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((data) {
          final dynamic doc = data.data();
          print(doc.toString());
          Destination destination = Destination.formJson(
            data.id,
            {
              'name': doc['name'],
              'address': doc['address'],
              'imageUrl': doc['imageUrl'],
              'rating': doc['rating'].toDouble(),
              'description': doc['description'],
              'price': doc['price'],
            },
          );

          results.add(destination);
        });
      });
      return results;
    } catch (e, s) {
      print("ini error: $s");
      print(e.toString());
      rethrow;
    }
  }
}
