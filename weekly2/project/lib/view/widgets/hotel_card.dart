import 'package:flutter/material.dart';
import 'package:project/core/themes/font_weight.dart';
import 'package:project/model/hotel_model.dart';

class HotelCard extends StatelessWidget {
  final HotelModel item;
  final void Function(HotelModel item)? onSelectedItem;

  const HotelCard({
    required this.item,
    this.onSelectedItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        image: DecorationImage(
          image: NetworkImage(item.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 60.0,
          color: Colors.black38,
          child: Column(
            children: [
              Text(
                item.name,
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FW.medium,
                ),
              ),
              Text.rich(
                TextSpan(
                  text: item.currencyFormat,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FW.medium,
                    fontSize: 16.0,
                  ),
                  children: const [
                    TextSpan(
                      text: " /night",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FW.light,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
