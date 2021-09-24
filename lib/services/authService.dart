import 'dart:convert';

import 'package:cyberCrypto/ui/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:flutter/services.dart' show rootBundle;

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

Future<String> getusers() async {
  final String mainUrl = "assets/userData.json";
  return await rootBundle.loadString(mainUrl);
}

getuserss() async {
  final String mainUrl = "assets/userData.json";

  Response response = await http.get(Uri.parse(mainUrl));
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    List<UserData> _ = [];
    print(data);
    try {
      if (data.length > 0) {
        for (var c in data) {
          print(c);
          UserData l = UserData.fromJson(c);
          _.add(l);
        }
        return _;
      }
    } catch (e) {}
  }
}

// Future<List<UserData>?> getUsers() async {
//   var _ = <UserData>[];
//   Dio _dio = Dio();
//   Response response = await _dio.get("assets/userData.json");
//   if (response.statusCode == 200) {
//     var body = response.data;
//     print(body);
//     try {
//       if (body.length > 0) {
//         for (var c in body) {
//           print(c);
//           UserData l = UserData.fromJson(c);
//           _.add(l);
//         }
//         return _;
//       }
//     } catch (e) {}
//   }
// }

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
