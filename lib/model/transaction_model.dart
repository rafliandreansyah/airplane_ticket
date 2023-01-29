import 'package:airplane_ticket/model/destination_model.dart';
import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final Destination destination;
  final int amountTraveler;
  final String selectedSeats;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int price;
  final int grandTotal;

  TransactionModel({
    required this.destination,
    this.amountTraveler = 0,
    this.selectedSeats = '',
    this.insurance = false,
    this.refundable = false,
    this.vat = 0,
    this.price = 0,
    this.grandTotal = 0,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
