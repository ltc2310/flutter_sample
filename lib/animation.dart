import 'package:flutter/material.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimationPage"),
      ),
      body: const Center(
        child: Text(
          "This is AnimationPage Page",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
