import 'package:flutter/material.dart';

import '../../../domain/services/auth_services.dart';
import '../../../router/router.dart';
import '../../../widget/text_form_field_widget.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Color.fromARGB(255, 27, 26, 26),
      body: SafeArea(child: Center(child: AuthWidget())),
    );
  }
}

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  controller: _emailController,
                  hintText: 'Email',
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
                  controller: _passwordController,
                  hintText: 'Password',
                  obscureText: true,
                )),
          ),
          SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: SizedBox(
              height: 60,
              child: TextFormFiledWidget(
                hintText: 'Confirm password',
                obscureText: true,
              ),
            ),
          ),
          SizedBox(height: 50),
          // RowButtonWidget(
          //   email: _emailController.text,
          //   password: _passwordController.text,
          // )
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                child: const Text('Sign in'),
              ),
              SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: () async {
                    var email = _emailController.text;
                    var password = _passwordController.text;
                    await AuthServices()
                        .registration(email: email, password: password)
                        .then((value) => {
                              if (email.isNotEmpty &&
                                  email != null &&
                                  password.isNotEmpty &&
                                  password != null)
                                {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      MainNavigationRouteName.mainScreen,
                                      (route) => false)
                                }
                            });
                    print(email);
                    print(password);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('Sign up'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// class RowButtonWidget extends StatelessWidget {
//   const RowButtonWidget({
//     super.key,
//     required this.email,
//     required this.password,
//   });
//   final String email;
//   final String password;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           style: TextButton.styleFrom(
//             foregroundColor: Colors.white,
//           ),
//           child: const Text('Sign in'),
//         ),
//         SizedBox(
//           height: 50,
//           width: 150,
//           child: ElevatedButton(
//             onPressed: () async {
//               await AuthServices()
//                   .registration(email: email, password: password)
//                   .then((value) => {
//                         if (email.isNotEmpty &&
//                             email != null &&
//                             password.isNotEmpty &&
//                             password != null)
//                           {
//                             Navigator.of(context).pushNamedAndRemoveUntil(
//                                 MainNavigationRouteName.mainScreen,
//                                 (route) => false)
//                           }
//                       });
//               print(email);
//               print(password);
//             },
//             style: ElevatedButton.styleFrom(
//               foregroundColor: Colors.white,
//               backgroundColor: Colors.red,
//             ),
//             child: const Text('Sign up'),
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
