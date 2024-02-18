import 'package:event_now/pages/homePage.dart';
import 'package:event_now/pages/loginPage.dart';
import 'package:event_now/services/appUserModel.dart';
import 'package:event_now/services/authServices.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final _authService = Provider.of<AuthService>(context);
    return StreamBuilder<AppUser?>(
        stream: _authService.user,
        builder: (context, AsyncSnapshot<AppUser?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final AppUser? appUser = snapshot.data;
            return appUser == null ? const LoginPage() : const HomePage();
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
