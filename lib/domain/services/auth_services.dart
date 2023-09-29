import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthServices {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<String?> registration(
      {required String email,
      required String password,
      required String username}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      addUserDetails(email, username);
      // user = email;
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> addUserDetails(String email, String username) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    if (uid.isNotEmpty) {
      final userDoc = FirebaseFirestore.instance.collection('users').doc(uid);

      await userDoc.set({
        'uid': uid,
        'username': username,
        'email': email,
        'favoriteAnime': [],
      });
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // user = email;
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future passwordReset(BuildContext context, {required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email.trim());
  }

  Future<void> singOut() async {
    await _firebaseAuth.signOut();
  }
}
