import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../shared_widgets/focus_unfocus.dart';

import '../../providers/providers.dart';

class Login extends ConsumerStatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  @override
  Widget build(BuildContext context) {
    return FocusUnfocus(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(12),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Login',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 50),
              TextField(
                onChanged: ref.read(loginProvider.notifier).updatePassword,
                obscureText: true,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 50),
              ref.watch(loginProvider).isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        await ref
                            .read(loginProvider.notifier)
                            .signIn(context, mounted);
                      },
                      child: const Text('Login'),
                    ),
              Text(ref.watch(loginProvider).value!.errorMessage!)
            ],
          ),
        ),
      ),
    );
  }
}
