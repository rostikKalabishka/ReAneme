import 'package:flutter/material.dart';

import '../../router/router.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 26, 26),
      body: SafeArea(child: Center(child: AuthWidget())),
    );
  }
}

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const RowLogo(),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: SizedBox(
            height: 60,
            child: TextFormField(
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: 'Username',
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: SizedBox(
            height: 60,
            child: TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: 'Password',
              ),
            ),
          ),
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(MainNavigationRouteName.mainScreen);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
                child: const Text('Sign in'),
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              child: const Text('Registration'),
            )
          ],
        )
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
