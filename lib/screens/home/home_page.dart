import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Column(
        children: [
          Center(
            child: TextButton(
              child: const Text("Sign out"),
              onPressed: () async {
                SharedPreferences storage =
                    await SharedPreferences.getInstance();
                storage.remove('token');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(controller: controller),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/client:${controller.text.trim()}');
        },
      ),
    );
  }
}
