import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../router/router.dart';
import '../../widget/text_form_field_widget.dart';
import 'model/auth_screen_model.dart';

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
    final model = context.read<AuthScreenModel>();
    final _emailTextEditingController = TextEditingController();
    final _passwordTextEditingController = TextEditingController();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const RowLogo(),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: SizedBox(
                height: 60,
                child: TextFormFiledWidget(
                  controller: _emailTextEditingController,
                  hintText: 'Username',
                  obscureText: false,
                )),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: SizedBox(
              height: 60,
              child: TextFormFiledWidget(
                controller: _passwordTextEditingController,
                hintText: 'Password',
                obscureText: true,
              ),
            ),
          ),
          const SizedBox(height: 50),
          Row(
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
                  onPressed: () async {
                    final email = _emailTextEditingController.text;
                    final password = _passwordTextEditingController.text;

                    await model.login(context, email, password);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('Sign in'),
                ),
              ),
            ],
          )
          // RowButtonWidget()
        ],
      ),
    );
  }
}

// class RowButtonWidget extends StatelessWidget {
//   const RowButtonWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         TextButton(
//           onPressed: () {
//             Navigator.of(context)
//                 .pushNamed(MainNavigationRouteName.registrationScreen);
//           },
//           style: TextButton.styleFrom(
//             foregroundColor: Colors.white,
//           ),
//           child: const Text('Registration'),
//         ),
//         SizedBox(
//           height: 50,
//           width: 150,
//           child: ElevatedButton(
//             onPressed: () {
//               Navigator.of(context).pushNamedAndRemoveUntil(
//                   MainNavigationRouteName.mainScreen, (route) => false);
//             },
//             style: ElevatedButton.styleFrom(
//               foregroundColor: Colors.white,
//               backgroundColor: Colors.red,
//             ),
//             child: const Text('Sign in'),
//           ),
//         ),
//       ],
//     );
//   }
// }

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
