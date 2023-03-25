import 'package:flutter/material.dart';
import 'package:project/core/extensions/font_weight_ext.dart';
import 'package:project/core/extensions/form_validator_ext.dart';
import 'package:project/core/themes/images.dart';
import 'package:project/core/widgets/form_button.dart';
import 'package:project/core/widgets/form_input.dart';

class ContactPage extends StatelessWidget {
  static const routeName = 'contact-page';

  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController messageController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50.0,
              ),
              Center(
                child: Image.asset(
                  AppImages.logo,
                  width: 150.0,
                ),
              ),
              const Divider(),
              const Text(
                "Contact Us",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeightExt.medium,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Selamat datang di Hotelifoz, hotel bintang lima yang menyediakan pengalaman menginap yang luar biasa. Tim kami yang berpengalaman dan ramah siap membantu Anda selama masa menginap Anda. Terima kasih atas kepercayaan Anda kepada Hotelifoz!",
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: FozFormInput(
                      controller: firstNameController,
                      label: "First name *",
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Inputan wajib diisi.";
                        }
                        return null;
                      },
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: FozFormInput(
                      controller: lastNameController,
                      label: "Last name",
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ],
              ),
              FozFormInput(
                controller: emailController,
                label: "Email *",
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Inputan wajib diisi.";
                  }
                  if (value.isEmailRegExp()) {
                    return "Email tidak valid.";
                  }
                  return null;
                },
              ),
              FozFormInput(
                controller: messageController,
                label: "What can we help you with?",
                isTextArea: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Inputan wajib diisi.";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              FozFormButton(
                label: "Submit",
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Terimakasih"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Nama : ${firstNameController.text} ${lastNameController.text}"),
                            Text("Email : ${emailController.text}"),
                            Text("Pesan : ${messageController.text}"),
                          ],
                        ),
                        actions: [
                          FozFormButton(
                            label: "Oke",
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    );
                    firstNameController.clear();
                    lastNameController.clear();
                    emailController.clear();
                    messageController.clear();
                  }
                },
              ),
              const SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
