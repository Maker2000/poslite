import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:poslite/pages/scan_page.dart';
import 'package:poslite/repositories/item_repo.dart';
import '../models/shop_item/shop_item.dart';
import '../shared_widgets/loading_screen.dart';
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
      body: StreamBuilder<QuerySnapshot<ShopItem>>(
          stream: ProductRepository.instance
              .queryItems(ref.watch(checkoutProvider)),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const LoadingScreen();
            var items = ref
                .watch(checkoutProvider.notifier)
                .buildItems(snapshot.data!.docs);
            return Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      floating: true,
                      title: Row(
                        children: [
                          const Text('Total: '),
                          Text(
                            NumberFormat.simpleCurrency().format(ref
                                .watch(checkoutProvider.notifier)
                                .totalPrice),
                          ),
                        ],
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          var item = items[index];
                          return ShopItemCard(
                            item: item,
                            onDelete: () {
                              ref
                                  .read(checkoutProvider.notifier)
                                  .removeCheckoutItem(item);
                            },
                            changeItemCount: (changeType) => ref
                                .read(checkoutProvider.notifier)
                                .changeCheckoutItemCount(item, changeType),
                          );
                        },
                        childCount: items.length,
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 160,
                      ),
                    )
                  ],
                ),
                Positioned(
                  left: 15,
                  right: 15,
                  bottom: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton.extended(
                        onPressed: () {
                          showScanItemsPage(
                            context: context,
                            onScan: () async {},
                          );
                        },
                        elevation: 2,
                        label: const Text('Add More'),
                        icon: const Icon(FontAwesomeIcons.plus),
                      ),
                      FloatingActionButton.extended(
                        onPressed: () {
                          //TODO: add items scan
                        },
                        elevation: 2,
                        label: const Text('Checkout'),
                        icon: const Icon(FontAwesomeIcons.creditCard),
                      )
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
