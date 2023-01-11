import 'package:flutter/material.dart';

class POSLiteBottomNavBar extends StatefulWidget {
  final List<POSLiteNavBarItem> items;
  final Function(int) onTap;
  final int currentIndex;
  const POSLiteBottomNavBar(
      {super.key,
      required this.items,
      required this.onTap,
      required this.currentIndex});

  @override
  State<POSLiteBottomNavBar> createState() => _POSLiteBottomNavBarState();
}

class _POSLiteBottomNavBarState extends State<POSLiteBottomNavBar> {
  final GlobalKey barKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
          child: SizedBox(
            child: Material(
              color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              elevation: 2,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  key: barKey,
                  children: [
                    for (int i = 0; i < widget.items.length; i++)
                      POSLiteNavBarItemWidget(
                        item: widget.items[i],
                        isSelected: i == widget.currentIndex,
                        onTap: () => setState(() => widget.onTap(i)),
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class POSLiteNavBarItem {
  final Widget icon;
  final Widget? title;

  POSLiteNavBarItem({required this.icon, this.title});
}

class POSLiteNavBarItemWidget extends StatefulWidget {
  final POSLiteNavBarItem item;
  final bool isSelected;
  final Function() onTap;
  const POSLiteNavBarItemWidget(
      {super.key,
      required this.item,
      required this.isSelected,
      required this.onTap});

  @override
  State<POSLiteNavBarItemWidget> createState() =>
      _POSLiteNavBarItemWidgetState();
}

class _POSLiteNavBarItemWidgetState extends State<POSLiteNavBarItemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> sizeAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150));
    sizeAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller.view,
        builder: (context, child) {
          final IconThemeData iconThemeData = IconThemeData.lerp(
            Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme,
            Theme.of(context).bottomNavigationBarTheme.selectedIconTheme,
            _controller.value,
          );
          widget.isSelected ? _controller.forward() : _controller.reverse();
          return InkResponse(
            radius: 28,
            onTap: widget.onTap,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Transform.scale(
                alignment: Alignment.bottomCenter,
                scale: sizeAnimation.value,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconTheme(data: iconThemeData, child: widget.item.icon),
                    widget.isSelected
                        ? widget.item.title ?? const SizedBox.shrink()
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class POSLiteNavBarIndicator extends CustomPainter {
  final Animation animation;
  final GlobalKey barKey;
  POSLiteNavBarIndicator(this.animation, this.barKey);

  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
