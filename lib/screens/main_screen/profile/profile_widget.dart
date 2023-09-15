import 'package:flutter/material.dart';

import '../../../theme/constants.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      body: UserInfoWidget(),
    );
  }
}

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 16 / 12,
        child: Column(
          children: [
            Text('data'),
            Text('data'),
            Text(
              'data',
            )
          ],
        ));
  }
}
