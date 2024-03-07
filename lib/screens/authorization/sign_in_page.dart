import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In page"),
      ),
      body: Center(
        child: TextButton(
          child: Text("Sign in"),
          onPressed: () async {
            SharedPreferences storage = await SharedPreferences.getInstance();
            storage.setString('token', 'nmadir');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/splash');
        },
      ),
    );
  }
}
