import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../../../domain/anime_api/anime_api.dart';
import '../../anime_details/anime_details.dart';

class ProfileModel extends ChangeNotifier {
  final _animeApi = AnimeApi();

  final _auth = FirebaseAuth.instance;
  String? _uid;
  String? name;
  List<String> animeList = [];
  Future<void> setup() async {
    await getData();
    await favoriteAnimeList();
  }

  Future animeDetails(String animeId) async {
    return await _animeApi.getAnimeDetails(animeId); // Змінено параметр на ID
  }

  Future<void> favoriteAnimeList() async {
    CollectionReference collection =
        FirebaseFirestore.instance.collection('users');

    QuerySnapshot querySnapshot = await collection.get();
    animeList.clear();
    for (QueryDocumentSnapshot docSnapshot in querySnapshot.docs) {
      List<dynamic> dataArray = docSnapshot['favoriteAnime'];
      for (var item in dataArray) {
        animeList.add(item);
      }
    }
  }

  Future<void> getData() async {
    User? user = _auth.currentUser;
    _uid = user!.uid;
    final DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(_uid).get();
    name = userDoc.get('username');
  }
}
