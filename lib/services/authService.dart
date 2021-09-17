import 'package:firebase_auth/firebase_auth.dart';

Future<String> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return "Login Successful";
  } on FirebaseAuthException catch (e) {
    print(e.code);
    if (e.code == 'wrong-password') {
      return 'Invalid Credentials';
    } else if (e.code == 'user-not-found') {
      return 'This account does not exist';
    } else if (e.code == 'invalid-email') {
      return 'Invalid email address';
    }
    return "Error Processing";
  }
}

Future<String> register(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return "Registration Successful";
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      return 'The password provided is too weak.';
    } else if (e.code == 'email-already-in-use') {
      return 'The account already exists for that email.';
    } else if (e.code == 'invalid-email') {
      return 'Invalid email address';
    }
    return "Error Processing";
  } catch (e) {
    print(e.toString());
    return e.toString();
  }
}
