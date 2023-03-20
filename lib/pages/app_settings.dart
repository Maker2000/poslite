import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poslite/providers/providers.dart';
import 'package:poslite/providers/theme_handler.dart';
import 'package:poslite/widgets/theme_switcher.dart';
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
                if (mounted) {
                  context.goNamed(
                    RouteName.login.name,
                  );
                }
              },
              child: const Text('Sign Out'),
            ),
            ListTile(
              title: const Text('Change Theme'),
              trailing: Icon(ref
                  .watch(themeHandlerProvider.notifier)
                  .currentThemeModeIcon),
              onTap: () {
                showThemeSwitcher(context: context);
              },
            )
          ],
        ),
      ),
    );
  }
}
