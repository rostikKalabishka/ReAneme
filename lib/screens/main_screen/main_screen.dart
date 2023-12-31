import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_anime/screens/main_screen/profile/model/profile_model.dart';

import 'package:re_anime/screens/main_screen/profile/profile_widget.dart';
import 'package:re_anime/screens/main_screen/search_anime/model/search_model.dart';
import 'package:re_anime/screens/main_screen/search_anime/search_anime_widget.dart';

import 'home_page/home_page_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var searchModel = SearchModel();
  var profileModel = ProfileModel();
  int _selectedTab = 0;
  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: searchModel,
          child: const SearchAnimeWidget(),
        ),
        ChangeNotifierProvider.value(
          value: ProfileModel(),
          child: const ProfileWidget(),
        )
      ],
      child: Scaffold(
        body: IndexedStack(
          index: _selectedTab,
          children: const [
            HomePageWidget(),
            SearchAnimeWidget(),
            ProfileWidget(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Profile',
            ),
          ],
          onTap: onSelectTab,
        ),
      ),
    );
  }
}

//ComingSoonAnimeWidget