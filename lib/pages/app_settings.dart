import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../util/magic_strings.dart';

class AppSettings extends ConsumerStatefulWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppSettingsState();
}

class _AppSettingsState extends ConsumerState<AppSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  if (mounted) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RouteName.login.name,
                      (route) => false,
                    );
                  }
                },
                child: const Text('Sign Out'))
          ],
        ),
      ),
    );
  }
}
