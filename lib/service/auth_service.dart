import 'package:airplane_ticket/model/user_model.dart';
import 'package:airplane_ticket/service/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> createUser({
    required String name,
    required String email,
    required String password,
    String hobby = '',
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel user = UserModel(
        id: userCredential.user!.uid,
        name: name,
        email: email,
        hobby: hobby,
        balance: 280000000,
      );

      await UserService().setUser(user);

      return user;
    } catch (e) {
      throw e;
    }
  }
}
