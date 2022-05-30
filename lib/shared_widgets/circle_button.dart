import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final void Function() onTap;
  final IconData iconData;
  const CircleButton({Key? key, required this.onTap, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Theme.of(context).buttonTheme.colorScheme!.background,
      constraints: const BoxConstraints(),
      shape: const CircleBorder(),
      onPressed: onTap,
      child: Icon(iconData),
    );
  }
}
