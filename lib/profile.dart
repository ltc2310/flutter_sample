import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Profile extends StatelessWidget {
  final String name;
  const Profile({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome $name")),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                context.go("/");
              },
              child: const Text("Dashboard")),
          // ElevatedButton(
          //     onPressed: () {
          //       context.go("/profile/child-profile");
          //     },
          //     child: const Text("child profile"))
        ],
      )),
    );
  }
}
