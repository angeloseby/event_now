import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

FirebaseAuth _auth = FirebaseAuth.instance;
Future<bool> register(String email, String password) async {
  try {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
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
