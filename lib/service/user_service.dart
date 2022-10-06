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

  Future<UserModel?> getUserById(String id) async {
    try {
      var userData = await _db.collection('users').doc(id).get();
      return UserModel(
        id: id,
        name: userData['name'],
        email: userData['email'],
        hobby: userData['hobby'],
        balance: userData['amount'],
      );
    } catch (e) {
      throw e;
    }
  }
}
