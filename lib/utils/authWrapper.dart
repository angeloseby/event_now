import 'package:event_now/pages/homePage.dart';
import 'package:event_now/pages/loginPage.dart';
import 'package:event_now/pages/verifyEmailPage.dart';
import 'package:event_now/services/appUserModel.dart';
import 'package:event_now/services/authServices.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final _authService = Provider.of<AuthService>(context);
    return StreamBuilder<AppUser?>(
        stream: _authService.user,
        builder: (context, AsyncSnapshot<AppUser?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final AppUser? appUser = snapshot.data;
            if (appUser == null) {
              return const LoginPage();
            } else {
              if (appUser.isEmailVerified) {
                return const HomePage();
              } else {
                return const VerifyEmailPage();
              }
            }
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
