import 'package:event_now/services/appUserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

final Logger logger = Logger();

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create custom user model based on firebase user
  AppUser? _userFromFirebaseUser(User? user) {
    return user != null
        ? AppUser(uid: user.uid, isEmailVerified: user.emailVerified)
        : null;
  }

  //auth change user stream
  Stream<AppUser?>? get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //Register the user
  Future<AppUser?> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      final _firebaseUserCred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      logger.d("User Created Successfully");
      final _firebaseUser = _firebaseUserCred.user;
      return _userFromFirebaseUser(_firebaseUser);
    } on FirebaseAuthException catch (e) {
      logger.d("An error occurred during firebase registration.");
      return null;
    } catch (e) {
      logger.d("Unknown error occurred !");
      return null;
    }
  }

  //Login the user
  Future<AppUser?> logInUser({
    required String email,
    required String password,
  }) async {
    try {
      final _firebaseUserCred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      logger.d("Login Successful");
      final _firebaseUser = _firebaseUserCred.user;
      return _userFromFirebaseUser(_firebaseUser);
    } on FirebaseAuthException catch (e) {
      logger.e("An error occurred during firebase login.");
      return null;
    } catch (err) {
      logger.e("Some other error occurred !");
      return null;
    }
  }

  Future signOutUser() async {
    try {
      await _auth.signOut();
      logger.d("Sign Out Succesfull");
    } catch (e) {
      logger.e("Can't perform signout !");
    }
  }
}
