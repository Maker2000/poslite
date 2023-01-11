import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScanItemsPage extends ConsumerStatefulWidget {
  const ScanItemsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScanItemsPageState();
}

class _ScanItemsPageState extends ConsumerState<ScanItemsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Align(),
    );
  }
}
