import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final String label;
  final Function? onTap;
  const ItemCard(
      {Key? key,
      required this.iconData,
      this.color = Colors.blueAccent,
      required this.label,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap!.call(),
      style: ElevatedButton.styleFrom(),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color, width: 3),
          // color: color,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
              size: 56,
            ),
            Text(label)
          ],
        ),
      ),
    );
  }
}
