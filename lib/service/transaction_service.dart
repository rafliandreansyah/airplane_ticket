import 'package:airplane_ticket/model/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createTransaction(TransactionModel transactionModel) async {
    try {
      await _db.collection('transactions').add({
        'destination': transactionModel.destination.toJson(),
        'selectedSeats': transactionModel.selectedSeats,
        'insurance': transactionModel.insurance,
        'refundable': transactionModel.refundable,
        'vat': transactionModel.vat,
        'price': transactionModel.price,
        'grandTotal': transactionModel.grandTotal,
      });
    } catch (e) {
      throw e;
    }
  }
}
