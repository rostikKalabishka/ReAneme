import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widget/text_form_field_widget.dart';
import 'model/forget_password_model.dart';
// import 'model/auth_screen_model.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // backgroundColor: Color.fromARGB(255, 27, 26, 26),
      body: SafeArea(
          child: Center(
              child: ChangeNotifierProvider(
        child: const AuthWidget(),
        create: (_) => ForgetPasswordModel(),
      ))),
    );
  }
}

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<ForgetPasswordModel>();
    final emailTextEditingController = TextEditingController();

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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 120,
                child: ElevatedButton(
                  onPressed: () async {
                    final email = emailTextEditingController.text;

                    await model.forgetPassword(context, email);

                    // await model.login(context, email, password);
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
