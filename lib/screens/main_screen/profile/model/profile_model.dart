import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:re_anime/router/router.dart';

import '../../../../domain/anime_api/anime_api.dart';

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
    return await _animeApi.getAnimeDetails(animeId);
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

  void onAnimeTap(BuildContext context, int index) {
    final animeId = animeList[index];
    Navigator.of(context)
        .pushNamed(MainNavigationRouteName.animeDetails, arguments: animeId);
  }

  Future<void> getData() async {
    User? user = _auth.currentUser;
    _uid = user!.uid;
    final DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(_uid).get();
    name = userDoc.get('username');
  }
}
