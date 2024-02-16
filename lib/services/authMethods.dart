import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();
final FirebaseAuth _auth = FirebaseAuth.instance;

class AuthMethods {
  static Future<bool> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      logger.d("User Created Successfully");
      return true;
    } on FirebaseAuthException catch (e) {
      logger.d("An error occurred during firebase registration.");
      return false;
    } catch (e) {
      logger.d("Unknown error occurred !");
      return false;
    }
  }

  static Future<bool> logInUser({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      logger.d("Login Successful");
      return true;
    } on FirebaseAuthException catch (e) {
      logger.d("An error occurred during firebase login.");
      return false;
    } catch (err) {
      logger.d("Some other error occurred !");
      return false;
    }
  }
}
