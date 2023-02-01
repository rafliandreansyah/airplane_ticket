import 'package:airplane_ticket/model/destination_model.dart';
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

  Future<List<TransactionModel>> fetchTransactions() async {
    try {
      List<TransactionModel> resultTransactions = [];
      await _db
          .collection('transactions')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((transaction) {
          final dynamic transactionData = transaction.data();
          print('\n\n Data: ${transactionData.toString()}');
          TransactionModel transactionModel =
              TransactionModel.fromJson(transaction.id, {
            'destination': transactionData['destination'],
            'selectedSeats': transactionData['selectedSeats'],
            'insurance': transactionData['insurance'],
            'refundable': transactionData['refundable'],
            'vat': transactionData['vat'],
            'price': transactionData['price'],
            'grandTotal': transactionData['grandTotal'],
          });

          resultTransactions.add(transactionModel);
        });
      });

      return resultTransactions;
    } catch (e, s) {
      print(s);
      rethrow;
    }
  }
}
