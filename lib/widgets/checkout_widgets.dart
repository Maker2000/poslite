import 'package:flutter/material.dart';
import '../../models/shop_item/shop_item.dart';

class CheckoutItemWidget extends StatelessWidget {
  final ShopItem item;
  const CheckoutItemWidget(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        Row(
          children: [Text('${item.name}'), Text('${item.amount}')],
        ),
        Row(
          children: [Text("${item.amount * item.price}")],
        )
      ],
    ));
  }
}
