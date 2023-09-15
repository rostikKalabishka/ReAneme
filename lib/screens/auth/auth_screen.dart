import 'package:flutter/material.dart';

import '../../router/router.dart';
import '../../widget/text_form_field_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Color.fromARGB(255, 27, 26, 26),
      body: SafeArea(child: Center(child: AuthWidget())),
    );
  }
}

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RowLogo(),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: SizedBox(
                height: 60,
                child: TextFormFiledWidget(
                  hintText: 'Username',
                  obscureText: false,
                )),
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: SizedBox(
              height: 60,
              child: TextFormFiledWidget(
                hintText: 'Password',
                obscureText: true,
              ),
            ),
          ),
          SizedBox(height: 50),
          RowButtonWidget()
        ],
      ),
    );
  }
}

class RowButtonWidget extends StatelessWidget {
  const RowButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamed(MainNavigationRouteName.registrationScreen);
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          child: const Text('Registration'),
        ),
        SizedBox(
          height: 50,
          width: 150,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  MainNavigationRouteName.mainScreen, (route) => false);
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
            ),
            child: const Text('Sign in'),
          ),
        ),
      ],
    );
  }
}

class RowLogo extends StatelessWidget {
  const RowLogo({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = basicTheme();
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Re:',
          style:
              TextStyle(color: Color.fromARGB(255, 236, 41, 41), fontSize: 50),
        ),
        Text(
          'Anime',
          style: TextStyle(color: Colors.white, fontSize: 50),
        )
      ],
    );
  }
}
