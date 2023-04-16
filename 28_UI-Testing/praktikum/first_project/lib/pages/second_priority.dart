import 'package:first_project/core/widgets/form_button.dart';
import 'package:first_project/core/widgets/form_input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const routeName = 'login_page';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 200.0,
                ),
                const FlutterLogo(
                  key: Key("logo-app"),
                  size: 100.0,
                ),
                const SizedBox(
                  height: 50.0,
                ),
                FozFormInput(
                  key: const Key("form-input-username"),
                  label: 'Username',
                  hint: 'Insert Your Username',
                  controller: usernameController,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                FozFormInput(
                  key: const Key("form-input-password"),
                  label: 'Password',
                  hint: 'Insert Your Password',
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FozFormButton(
                    key: const Key("form-do-login"),
                    label: 'Submit',
                    onPressed: () async {
                      final FormState form = formKey.currentState!;
                      if (form.validate()) {
                        usernameController.clear();
                        passwordController.clear();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
