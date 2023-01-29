import 'package:airplane_ticket/model/transaction_model.dart';
import 'package:airplane_ticket/service/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  void createTransaction(TransactionModel transactionModel) async {
    try {
      emit(TransactionLoading());
      await TransactionService().createTransaction(transactionModel);
      emit(TransactionSuccess());
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }
}
