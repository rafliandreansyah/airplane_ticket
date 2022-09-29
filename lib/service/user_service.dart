import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_model.dart';

class UserService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> setUser(UserModel user) async {
    try {
      await _db.collection('users').doc(user.id).set({
        'name': user.name,
        'email': user.email,
        'hobby': user.hobby,
        'amount': user.balance,
      });
    } catch (e) {
      throw e;
    }
  }
}
