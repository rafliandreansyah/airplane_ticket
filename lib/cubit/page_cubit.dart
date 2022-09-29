import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class PageCubit extends Cubit<int> {
  PageCubit() : super(0);

  void changePage(int newPage) {
    emit(newPage);
  }
}
