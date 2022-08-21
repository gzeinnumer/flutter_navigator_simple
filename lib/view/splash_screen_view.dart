import 'package:flutter/material.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SplashScreen"),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}