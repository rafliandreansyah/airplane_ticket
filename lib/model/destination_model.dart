import 'package:equatable/equatable.dart';

class Destination extends Equatable {
  final String id;
  final String? name;
  final String? address;
  final String? imageUrl;
  final double? rating;
  final String? description;
  final int? price;

  Destination({
    required this.id,
    this.name,
    this.address,
    this.imageUrl,
    this.rating,
    this.price,
    this.description,
  });

  factory Destination.formJson(String id, Map<String, dynamic> json) {
    return Destination(
      id: id,
      name: json['name'],
      address: json['address'],
      imageUrl: json['imageUrl'],
      rating: double.parse(json['rating']),
      price: int.parse(json['price']),
      description: json['description'],
    );
  }

  @override
  List<Object?> get props => [id, name, address, imageUrl, rating];
}
