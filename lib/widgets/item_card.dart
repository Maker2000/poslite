import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:poslite/models/shop_item/shop_item.dart';

class ShopItemCard extends StatefulWidget {
  final ShopItem item;
  final void Function() onDelete;
  const ShopItemCard({super.key, required this.item, required this.onDelete});

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

  @override
  void dispose() {
    _controller.dispose();
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
                              MediaQuery.of(context).size.height * 0.2;
                          return GestureDetector(
                            onHorizontalDragStart: (details) {
                              if (_controller.isAnimating) {
                                moveOffset = _controller.value *
                                    constraints.maxWidth *
                                    moveOffset.sign;
                              } else {
                                moveOffset = 0;
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
                              // _controller.fling(
                              //     velocity: -details.primaryVelocity!);

                              if (!_controller.isAnimating) {
                                moveOffset = 0;
                              }
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
                                          onTap: () {
                                            _deleteController
                                                .fling(velocity: 2)
                                                .then((value) =>
                                                    widget.onDelete.call());
                                          },
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
  const ShopItemCardDetails(
      {super.key,
      required this.item,
      required this.shape,
      required this.padding});

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
              Row(
                children: [
                  Row(
                    children: [],
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
