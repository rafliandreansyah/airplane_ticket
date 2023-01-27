import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class SeatCubit extends Cubit<List<String>> {
  SeatCubit() : super([]);

  void addSeat(String id) {
    print('${state}');
    if (!isSelected(id)) {
      state.add(id);
    } else {
      state.remove(id);
    }

    emit(List.from(state));

    print('${state}');
  }

  bool isSelected(String id) {
    int index = state.indexOf(id);
    if (index == -1) {
      return false;
    } else {
      return true;
    }
  }
}
