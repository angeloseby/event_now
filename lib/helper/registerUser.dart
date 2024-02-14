import 'package:firebase_auth/firebase_auth.dart';

Future<bool> registerUser(String username, String password, String email) async {
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.message!.contains("weak-password")) {
      print('The password provided is too weak.');
    } else if (e.message!.contains("email-already-in-use")) {
      print('The account already exists for that email.');
    }else{
      print("Some other exception");
      print("Exception Code : ${e.code}");
      print("Exception Message : ${e.message}");
    }
    return false;
  } catch (e) {
    print("Unknown Exception");
    return false;
  }
}