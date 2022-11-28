import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthResponse {
  final int code;
  final String msg;

  AuthResponse({required this.code, required this.msg});
}

class Authenticate {
  static Future<void> login(
      String id, String password, BuildContext context) async {
    try {
      if (id.isNotEmpty & password.isNotEmpty) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: id.trim(),
          password: password.trim(),
        );
      }
    } on FirebaseAuthException {
      ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
        content: const Text("User Not found!!"),
        actions: [
          TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              },
              child: const Text("Ok"))
        ],
        leading: Icon(
          Icons.error,
          color: Colors.red[900],
        ),
      ));
    }
  }
}
