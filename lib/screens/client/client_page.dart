import 'package:flutter/material.dart';

class ClientPage extends StatefulWidget {
  int value;
  ClientPage(this.value, {super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  void increment() {
    widget.value++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Client Page"),
      ),
      body: Center(
        child: Text("HERE IS YOUR COUNT ${widget.value}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          increment();
        },
      ),
    );
  }
}
