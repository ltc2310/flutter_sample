import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QueryParam extends StatelessWidget {
  final String username;
  const QueryParam({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("QueryParam $username")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Dashboard"),
          onPressed: () {
            context.goNamed("dashboard");
          },
        ),
      ),
    );
  }
}
