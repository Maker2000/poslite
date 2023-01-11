import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poslite/models/shop_item/shop_item.dart';
import 'package:poslite/repositories/item_repo.dart';
import 'package:poslite/shared_widgets/barcode_scanner.dart';
import 'package:poslite/widgets/item_card.dart';

import '../../providers/providers.dart';
import '../widgets/widgets.dart';

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
              itemBuilder: (context, index) => ShopItemCard(
                item: ref.watch(checkoutProvider)[index],
                onDelete: () {},
              ),
            ),
          ),
          Row(
            children: [
              const Text('Total: '),
              Text('${ref.watch(checkoutProvider.notifier).totalPrice}'),
            ],
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
