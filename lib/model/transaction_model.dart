import 'package:airplane_ticket/model/destination_model.dart';
import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final String id;
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
    this.id = '',
    this.amountTraveler = 0,
    this.selectedSeats = '',
    this.insurance = false,
    this.refundable = false,
    this.vat = 0,
    this.price = 0,
    this.grandTotal = 0,
  });

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) {
    print('\n\n Data json: $json');
    return TransactionModel(
      destination:
          Destination.formJson(json['destination']['id'], json['destination']),
      id: id,
      selectedSeats: json['selectedSeats'],
      insurance: json['insurance'],
      refundable: json['refundable'],
      vat: json['vat'],
      price: json['price'],
      grandTotal: json['grandTotal'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
