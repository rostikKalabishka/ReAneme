import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:re_anime/re_anime.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const ReAnime());
}
