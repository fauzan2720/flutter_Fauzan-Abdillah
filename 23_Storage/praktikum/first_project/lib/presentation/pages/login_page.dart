import 'package:first_project/core/extensions/double_ext.dart';
import 'package:first_project/core/extensions/string_ext.dart';
import 'package:first_project/core/widgets/form_button.dart';
import 'package:first_project/core/widgets/form_input.dart';
import 'package:first_project/core/widgets/form_input_password.dart';
import 'package:first_project/model/auth_model.dart';
import 'package:first_project/presentation/cubit/auth/auth_cubit.dart';
import 'package:first_project/presentation/pages/contacts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                200.0.height,
                const FlutterLogo(
                  size: 100.0,
                ),
                50.0.height,
                FozFormInput(
                  label: 'Username',
                  hint: 'Insert Your Username',
                  controller: usernameController,
                  validator: (value) => context
                      .read<AuthCubit>()
                      .inputValidation(value: value!, label: "Username"),
                ),
                16.0.height,
                FozFormInputPassword(
                  label: 'Password',
                  hint: 'Insert Your Password',
                  controller: passwordController,
                  validator: (value) => context
                      .read<AuthCubit>()
                      .inputValidation(value: value!, label: "Password"),
                ),
                16.0.height,
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccess) {
                      Navigator.pushReplacementNamed(
                          context, ContactsPage.routeName);
                      "Berhasil login".succeedBar(context);
                    }
                    if (state is AuthSError) {
                      state.error.errorDialog(context);
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Align(
                        alignment: Alignment.centerRight,
                        child: FozFormButton(
                          label: 'Submit',
                          onPressed: () async {
                            final FormState form = formKey.currentState!;
                            final AuthModel query = AuthModel(
                              username: usernameController.text,
                              password: passwordController.text,
                            );

                            if (form.validate()) {
                              usernameController.clear();
                              passwordController.clear();
                              await context.read<AuthCubit>().login(query);
                            }
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
