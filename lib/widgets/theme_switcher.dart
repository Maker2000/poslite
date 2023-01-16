import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poslite/providers/providers.dart';
import 'package:poslite/providers/theme_handler.dart';
import '../util/general_extensions.dart';

Future<T?> showThemeSwitcher<T>({required BuildContext context}) =>
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      builder: (BuildContext context) => const ThemeSwitcher(),
    );

class ThemeSwitcher extends ConsumerWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'ChangeTheme',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        for (var themeMode in ThemeMode.values)
          ListTile(
            title: Text("${themeMode.titleCase} Mode"),
            onTap: () {
              ref.read(themeHandlerProvider.notifier).setThemeMode(themeMode);
              Navigator.pop(context);
            },
            trailing: Icon(ThemeHandler.themeIcon(themeMode)),
          ),
      ],
    );
  }
}
