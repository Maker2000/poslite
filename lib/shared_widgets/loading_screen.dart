import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  final String text;
  const LoadingScreen({Key? key, this.text = 'Loading'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [const CircularProgressIndicator(), Text(text)],
    ));
  }
}
