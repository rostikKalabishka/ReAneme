import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../router/router.dart';
import '../../../theme/constants.dart';
import '../../../widget/text_widget.dart';
import '../home_page/popular_anime/model/popular_anime_model.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(MainNavigationRouteName.moreInfo);
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: const UserInfoWidget(),
    );
  }
}

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageProfileWidget(),
          SizedBox(
            height: 20,
          ),
          UserNameWidget(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextWidget(
              label: 'Stats',
              fontSize: 22,
            ),
          ),
          StatsWidget(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextWidget(
              label: 'Your favorite',
              fontSize: 22,
            ),
          ),
          // YourFavoriteWidget(),
        ],
      ),
    );
  }
}

class ImageProfileWidget extends StatelessWidget {
  const ImageProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          image: const DecorationImage(
            image: AssetImage('assets/images/lil_peep.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class UserNameWidget extends StatefulWidget {
  const UserNameWidget({super.key});

  @override
  State<UserNameWidget> createState() => _UserNameWidgetState();
}

class _UserNameWidgetState extends State<UserNameWidget> {
  final _auth = FirebaseAuth.instance;
  String? _name;
  String? _uid;
// String _name;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    User? user = _auth.currentUser;
    _uid = user!.uid;
    final DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(_uid).get();
    _name = userDoc.get('username');
    log('name $_name');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextWidget(
      label: '${_name}',
      fontSize: 22,
    ));
  }
}

class StatsWidget extends StatelessWidget {
  const StatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 120,
            color: Color.fromARGB(221, 41, 41, 41),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: TextWidget(label: 'Favorite: 0')),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(child: TextWidget(label: 'data'))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(child: TextWidget(label: 'data')),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(child: TextWidget(label: 'data'))
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

class YourFavoriteWidget extends StatelessWidget {
  YourFavoriteWidget({Key? key}) : super(key: key);

  final popularAnimeList = [
    PopularAnimeModel(
        id: 1,
        imageSmall: 'assets/images/small.jpg',
        name: 'Beebop1sssssssssssss'),
    PopularAnimeModel(
        id: 2, imageSmall: 'assets/images/small.jpg', name: 'Beebop2'),
    PopularAnimeModel(
        id: 3, imageSmall: 'assets/images/small.jpg', name: 'Beebop3'),
    PopularAnimeModel(
        id: 4, imageSmall: 'assets/images/small.jpg', name: 'Beebop4'),
    PopularAnimeModel(
        id: 5, imageSmall: 'assets/images/small.jpg', name: 'Beebop5'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: popularAnimeList.map((anime) {
          return Column(
            children: [
              Image.asset(
                anime.imageSmall,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
              Text(
                anime.name,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
