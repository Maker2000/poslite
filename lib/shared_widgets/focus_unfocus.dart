import 'package:flutter/material.dart';

class FocusUnfocus extends StatefulWidget {
  final Widget child;
  const FocusUnfocus({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<FocusUnfocus> createState() => _FocusUnfocusState();
}

class _FocusUnfocusState extends State<FocusUnfocus> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        });
      },
      child: widget.child,
    );
  }
}
