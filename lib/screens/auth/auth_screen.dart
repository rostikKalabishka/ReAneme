import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_anime/widget/text_widget.dart';

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
    final emailTextEditingController = TextEditingController();
    final passwordTextEditingController = TextEditingController();
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
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: SizedBox(
                height: 60,
                child: TextFormFiledWidget(
                  controller: emailTextEditingController,
                  hintText: 'Email',
                  obscureText: false,
                )),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: SizedBox(
              height: 60,
              child: TextFormFiledWidget(
                controller: passwordTextEditingController,
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
                  model.navigatorToMainScreen(context);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                child: const Text('Registration'),
              ),
              SizedBox(
                height: 40,
                width: 120,
                child: ElevatedButton(
                  onPressed: () async {
                    final email = emailTextEditingController.text;
                    final password = passwordTextEditingController.text;

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
          ),
          // RowButtonWidget()
          const SizedBox(
            height: 30,
          ),
          const ForgetPasswordText()
        ],
      ),
    );
  }
}

class ForgetPasswordText extends StatelessWidget {
  const ForgetPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthScreenModel>();
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextWidget(
            fontWeight: FontWeight.normal,
            fontSize: 15,
            label: 'Have you forgotten  password?',
          ),
          TextButton(
              onPressed: () {
                model.navigatorToForgetPassword(context);
              },
              child: const TextWidget(
                label: 'Forget password',
                color: Colors.red,
              )),
        ]);
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
