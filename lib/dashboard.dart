import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                String name = "Peter";
                // GoRouter.of(context).go("/profile/$name");
                // context.goNamed("profile", pathParameters: {"name": name});
                context.pushNamed("profile", pathParameters: {"name": name});
              },
              child: const Text("Profile")),
          ElevatedButton(
              onPressed: () {
                context
                    .goNamed("query-param", queryParameters: {"name": "Test"});
              },
              child: const Text("query param")),
          ElevatedButton(
              onPressed: () {
                context.goNamed("animation");
              },
              child: const Text("Animation"))
        ],
      )),
    );
  }
}
