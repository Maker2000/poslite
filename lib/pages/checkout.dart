import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import "../widgets/item_card.dart";

import '../../providers/providers.dart';

class CheckOut extends ConsumerStatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckOutState();
}

class _CheckOutState extends ConsumerState<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Row(
              children: [
                const Text('Total: '),
                Text(
                  NumberFormat.simpleCurrency()
                      .format(ref.watch(checkoutProvider.notifier).totalPrice),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                for (var item in ref.watch(checkoutProvider))
                  ShopItemCard(
                    item: item,
                    onDelete: () {
                      ref
                          .read(checkoutProvider.notifier)
                          .removeCheckoutItem(item);
                    },
                    changeItemCount: (changeType) => ref
                        .read(checkoutProvider.notifier)
                        .changeCheckoutItemCount(item, changeType),
                  ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
