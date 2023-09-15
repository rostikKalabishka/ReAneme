import 'package:flutter/material.dart';

import '../../../router/router.dart';
import '../../../theme/constants.dart';
import '../../../widget/text_widget.dart';

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
    return ListView(
      children: const [
        Column(
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
          ],
        ),
      ],
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

class UserNameWidget extends StatelessWidget {
  const UserNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: TextWidget(
        label: 'Username',
        fontSize: 22,
      ),
    );
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
