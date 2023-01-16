import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import '../models/shop_item/shop_item.dart';

import '../util/magic_strings.dart';

class ShopItemCard extends StatefulWidget {
  final ShopItem item;
  final void Function() onDelete;
  final int Function(ItemCountChangeType changeType) changeItemCount;
  const ShopItemCard(
      {super.key,
      required this.item,
      required this.onDelete,
      required this.changeItemCount});

  @override
  State<ShopItemCard> createState() => _ShopItemCardState();
}

class _ShopItemCardState extends State<ShopItemCard>
    with TickerProviderStateMixin {
  late AnimationController _controller, _deleteController;
  late Animation<double> moveAnimation, paddingAnimation, deleteAnimation;
  late Animation<Offset> buttonMoveAnimation;

  double swipeOffset = 80, moveOffset = 0, paddingAmount = 12;
  ShapeBorder shape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(16));
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );
    _deleteController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );
    moveAnimation = Tween<double>(begin: 0, end: -1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    buttonMoveAnimation = Tween<Offset>(
            begin: Offset(swipeOffset, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    paddingAnimation = Tween<double>(begin: 1, end: 0.5)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    deleteAnimation = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: _deleteController, curve: Curves.easeInOut));
  }

  void deleteItem() async {
    await _deleteController.fling(velocity: 2);
    widget.onDelete();
  }

  @override
  void dispose() {
    _controller.dispose();
    _deleteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: deleteAnimation,
        builder: (context, child) {
          return ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(16),
            child: Align(
              heightFactor: deleteAnimation.value,
              child: Opacity(
                opacity: deleteAnimation.value,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: AnimatedBuilder(
                      animation: _controller.view,
                      builder: (context, child) {
                        return LayoutBuilder(builder: (context, constraints) {
                          double height =
                              MediaQuery.of(context).size.height * 0.22;
                          return GestureDetector(
                            onHorizontalDragStart: (details) {
                              if (_controller.isAnimating) {
                                moveOffset = _controller.value *
                                    constraints.maxWidth *
                                    moveOffset.sign;
                              } else {
                                // moveOffset = 0;
                              }
                            },
                            onHorizontalDragUpdate: (details) {
                              moveOffset += details.primaryDelta! * 5;
                              if (!_controller.isAnimating) {
                                _controller.value =
                                    -moveOffset / constraints.maxWidth;
                              }
                            },
                            onHorizontalDragEnd: (details) {
                              _controller
                                  .fling(
                                velocity: -clampDouble(
                                    details.primaryVelocity!, 0, 10),
                              )
                                  .then((value) {
                                if (!_controller.isAnimating) {
                                  // moveOffset = 0;
                                }
                              });

                              // if (_controller.value == 0) {
                              //   moveOffset = 0;
                              // }
                            },
                            onTap: () {
                              if (_controller.value >= 1) {
                                _controller.reverse();
                              }
                            },
                            child: SizedBox(
                              height: height,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    right: 0,
                                    child: Transform.translate(
                                      offset: buttonMoveAnimation.value,
                                      child: SizedBox(
                                        height: height,
                                        width: swipeOffset,
                                        child: DeleteButton(
                                          shape: shape,
                                          onTap: deleteItem,
                                          padding: EdgeInsets.only(
                                            top: paddingAmount,
                                            left: paddingAmount * 0.5,
                                            right: paddingAmount,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Transform.translate(
                                    offset: Offset(
                                        swipeOffset * moveAnimation.value, 0),
                                    child: ShopItemCardDetails(
                                      shape: shape,
                                      item: widget.item,
                                      padding: EdgeInsets.only(
                                        top: paddingAmount,
                                        right: paddingAmount *
                                            paddingAnimation.value,
                                        left: paddingAmount,
                                      ),
                                      delete: deleteItem,
                                      changeItemCount: widget.changeItemCount,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                      }),
                ),
              ),
            ),
          );
        });
  }
}

class DeleteButton extends StatelessWidget {
  final void Function() onTap;
  final ShapeBorder shape;
  final EdgeInsets padding;
  const DeleteButton(
      {super.key,
      required this.onTap,
      required this.shape,
      required this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Material(
        shape: shape,
        elevation: 1,
        color: Theme.of(context)
            .elevatedButtonTheme
            .style!
            .backgroundColor!
            .resolve({MaterialState.focused}),
        child: InkWell(
          onTap: onTap,
          child: const Center(child: Icon(FontAwesomeIcons.trashCan)),
        ),
      ),
    );
  }
}

class ShopItemCardDetails extends StatelessWidget {
  final ShopItem item;
  final ShapeBorder shape;
  final EdgeInsets padding;
  final int Function(ItemCountChangeType changeType) changeItemCount;
  final void Function() delete;
  const ShopItemCardDetails(
      {super.key,
      required this.item,
      required this.shape,
      required this.padding,
      required this.changeItemCount,
      required this.delete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Material(
        elevation: 1,
        shape: shape,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                item.name!,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 10,
              ),
              Text('\$${item.price}'),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      ItemCountButton(
                        changeType: ItemCountChangeType.remove,
                        changeItemCount: changeItemCount,
                        delete: delete,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(item.amount.toString()),
                      ),
                      ItemCountButton(
                        changeType: ItemCountChangeType.add,
                        changeItemCount: changeItemCount,
                        delete: delete,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(NumberFormat.simpleCurrency()
                            .format(item.totalCost)),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemCountButton extends StatelessWidget {
  const ItemCountButton(
      {super.key,
      required this.changeType,
      required this.changeItemCount,
      required this.delete});
  final ItemCountChangeType changeType;
  final int Function(ItemCountChangeType) changeItemCount;
  final void Function() delete;
  IconData get icon {
    switch (changeType) {
      case ItemCountChangeType.add:
        return FontAwesomeIcons.plus;
      case ItemCountChangeType.remove:
        return FontAwesomeIcons.minus;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(0),
          minimumSize: const Size(24, 24),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: () {
          int amount = changeItemCount(changeType);
          if (amount == 0) {
            delete.call();
          }
        },
        child: Icon(
          icon,
          size: 16,
        ),
      ),
    );
  }
}
