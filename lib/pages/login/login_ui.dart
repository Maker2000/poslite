import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poslite/util/providers.dart';
import 'package:poslite/util/useful_extensions.dart';

class Login extends ConsumerStatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final AsyncValue<String> state = ref.watch(loginScreenControllerProvider);
    return GestureDetector(
      onTap: () {
        setState(() {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        });
      },
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
                obscureText: true,
                controller: controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Password'),
              ),
              const SizedBox(height: 50),
              state.isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        await ref
                            .read(loginScreenControllerProvider.notifier)
                            .signIn(controller.text, context);
                      },
                      child: const Text('Login'),
                    ),
              state.when(
                data: (data) => Text(data.toString()),
                error: (error, trace) => Text(error.toString()),
                loading: SizedBox.shrink,
              )
            ],
          ),
        ),
      ),
    );
  }
}
