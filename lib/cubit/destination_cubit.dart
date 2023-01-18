import 'package:airplane_ticket/model/destination_model.dart';
import 'package:airplane_ticket/service/destination_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'destination_state.dart';

class DestinationCubit extends Cubit<DestinationState> {
  DestinationCubit() : super(DestinationInitial());

  void getDestination() async {
    try {
      emit(DestinationLoading());

      final destinations = await DestinationService().getDestination();

      emit(DestinationSuccess(destinations));
    } catch (e) {
      emit(DestinationError(e.toString()));
    }
  }
}
