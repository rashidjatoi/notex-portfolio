import 'package:flutter/material.dart';
import 'package:notex/services/auth_services.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/appicon.png", height: 110),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AuthServices.signInWithGoogle();
        },
        child: const Icon(Icons.refresh),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
