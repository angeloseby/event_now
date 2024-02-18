import 'package:event_now/services/authServices.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            await _authService.signOutUser();
          },
          child: const Text("Sign Out"),
        ),
      ),
    );
  }
}
