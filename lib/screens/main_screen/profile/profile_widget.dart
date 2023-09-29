import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_anime/domain/entity/anime_details/anime_details_entity.dart';

import '../../../router/router.dart';
import '../../../theme/constants.dart';
import '../../../widget/text_widget.dart';
import 'model/profile_model.dart';

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
      body: UserInfoWidget(),
    );
  }
}

class UserInfoWidget extends StatelessWidget {
  UserInfoWidget({Key? key}) : super(key: key);

  final model = ProfileModel();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => model,
          child: const UserNameWidget(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileModel(),
          child: const YourFavoriteWidget(),
        ),
      ],
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageProfileWidget(),
          SizedBox(
            height: 20,
          ),
          UserNameWidget(),

          // StatsWidget(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextWidget(
              label: 'Your favorite',
              fontSize: 22,
            ),
          ),
          Expanded(
            child: YourFavoriteWidget(),
          ),
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
  @override
  void didChangeDependencies() {
    context.watch<ProfileModel>().setup();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final _username = model.name;
    final model = context.watch<ProfileModel>();
    return FutureBuilder(
        future: model.getData(),
        builder: (context, snapshot) {
          final username = context.watch<ProfileModel>().name;
          return username != null
              ? Center(
                  child: TextWidget(
                  label: username,
                  fontSize: 22,
                ))
              : const Text('Loading...');
        });
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

class YourFavoriteWidget extends StatefulWidget {
  const YourFavoriteWidget({Key? key}) : super(key: key);

  @override
  State<YourFavoriteWidget> createState() => _YourFavoriteWidgetState();
}

class _YourFavoriteWidgetState extends State<YourFavoriteWidget> {
  @override
  void initState() {
    context.read<ProfileModel>().setup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProfileModel>();

    return FutureBuilder(
      future: model.setup(), // Используйте setup() вместо animeList
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (model.animeList.isEmpty) {
            return const Text('No favorite anime found');
          } else {
            return SizedBox(
                height: 3000,
                width: double.infinity,
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(10),
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  crossAxisCount: 2,
                  children: model.animeList.asMap().entries.map((entry) {
                    final index = entry.key;
                    final animeId = entry.value;
                    return FutureBuilder(
                      future: model.animeDetails(animeId),
                      builder: (context, animeSnapshot) {
                        if (animeSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.red,
                            ),
                          );
                        } else if (animeSnapshot.hasError) {
                          return const Text('Error downloading anime');
                        } else {
                          final animeDetails =
                              animeSnapshot.data as AnimeDetailsEntity;
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () => model.onAnimeTap(context, index),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    '${animeDetails.data.attributes.posterImage.tiny}',
                                  ),
                                ),
                              ),
                              TextWidget(
                                label:
                                    '${animeDetails.data.attributes.titles.en ?? animeDetails.data.attributes.titles.enJp ?? animeDetails.data.attributes.titles.jaJp}',
                              ),
                            ],
                          );
                        }
                      },
                    );
                  }).toList(),
                ));
          }
        }
      },
    );
  }
}
