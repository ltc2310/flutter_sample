import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChildProfile extends StatelessWidget {
  const ChildProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ChildProfile")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Dashboard"),
          onPressed: () {
            context.go("/");
          },
        ),
      ),
    );
  }
}
