import 'package:project/core/extensions/int_ext.dart';

class HotelModel {
  final String name;
  final int price;
  final String imageUrl;

  HotelModel({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  String get currencyFormat => price.currencyFormatIDR;
}
