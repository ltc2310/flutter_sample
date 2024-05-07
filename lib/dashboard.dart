import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Profile"),
          onPressed: () {
            String name = "Peter";
            GoRouter.of(context).go("/profile/$name");
          },
        ),
      ),
    );
  }
}
