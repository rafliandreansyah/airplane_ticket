import 'package:airplane_ticket/model/user_model.dart';
import 'package:airplane_ticket/service/auth_service.dart';
import 'package:airplane_ticket/service/user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signUp({
    required String email,
    required String password,
    required String name,
    String hobby = '',
  }) async {
    try {
      emit(AuthLoading());

      UserModel user = await AuthService().createUser(
          name: name, email: email, password: password, hobby: hobby);

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void signOut() async {
    try {
      emit(AuthLoading());
      await AuthService().signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void getUserById(String id) async {
    try {
      UserModel? user = await UserService().getUserById(id);
      emit(AuthSuccess(user!));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
