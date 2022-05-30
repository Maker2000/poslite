import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poslite/models/shop_item/shop_item.dart';
import 'package:poslite/pages/checkout/checkout_widgets.dart';
import 'package:poslite/repositories/item_repo.dart';
import 'package:poslite/shared_widgets/barcode_scanner.dart';
import 'package:poslite/util/providers.dart';

class CheckOut extends ConsumerStatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckOutState();
}

class _CheckOutState extends ConsumerState<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: ref.watch(checkoutProvider).length,
              itemBuilder: (context, index) => CheckoutItemWidget(
                ref.watch(checkoutProvider)[index],
              ),
            ),
          ),
          Row(
            children: [
              const Text('Total: '),
              Text('${ref.watch(checkoutProvider.notifier).totalPrice}'),
            ],
          ),
          Expanded(child: BarcodeWidget(
            onTap: (data) async {
              ShopItem? item = await ProductRepository.instance.getItem(data);
              if (item != null) {
                ref.read(checkoutProvider.notifier).addToCheckout(item);
              }
            },
          )),
        ],
      ),
    );
  }
}
