import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class ProfileModel extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  String? _uid;
  String? name;
  Future<void> setup() async {
    await getData();
    log('name $name');
  }

  Future<void> getData() async {
    User? user = _auth.currentUser;
    _uid = user!.uid;
    final DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(_uid).get();
    name = userDoc.get('username');
    log('name $name');
  }
}
