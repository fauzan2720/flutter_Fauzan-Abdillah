import 'package:first_project/core/colors.dart';
import 'package:first_project/core/extensions/double_ext.dart';
import 'package:first_project/core/extensions/string_ext.dart';
import 'package:first_project/core/widgets/form_button.dart';
import 'package:first_project/core/widgets/form_input.dart';
import 'package:first_project/model/contact_model.dart';
import 'package:first_project/model/contact_query.dart';
import 'package:first_project/view/pages/image_generator_page.dart';
import 'package:first_project/view/pages/posts_page.dart';
import 'package:first_project/view/widgets/dialog_delete.dart';
import 'package:first_project/view/widgets/dialog_update.dart';
import 'package:first_project/view_model/contact/contact_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactsPage extends StatelessWidget {
  static const routeName = 'contacts_page';

  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: RefreshIndicator(
        onRefresh: () async => context.read<ContactCubit>().initData(),
        child: ListView(
          children: [
            40.0.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: [
                  const Icon(Icons.mobile_friendly),
                  16.0.height,
                  const Text(
                    "Create New Contacts",
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                  16.0.height,
                  const Text(
                      "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made."),
                  16.0.height,
                  const Divider(),
                  16.0.height,
                ],
              ),
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    FozFormInput(
                      label: 'Name',
                      hint: 'Insert Your Name',
                      controller: nameController,
                      validator: (value) =>
                          context.read<ContactCubit>().nameValidation(value!),
                    ),
                    16.0.height,
                    FozFormInput(
                      label: 'Nomor',
                      hint: '+62 ....',
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (value) =>
                          context.read<ContactCubit>().phoneValidation(value!),
                    ),
                    16.0.height,
                    Align(
                      alignment: Alignment.centerRight,
                      child: FozFormButton(
                        label: 'Submit',
                        onPressed: () {
                          final FormState form = formKey.currentState!;
                          if (form.validate()) {
                            context
                                .read<ContactCubit>()
                                .addContact(ContactQuery(
                                  name: nameController.text,
                                  phone: phoneController.text,
                                ));
                            nameController.clear();
                            phoneController.clear();
                          }
                        },
                      ),
                    ),
                    50.0.height,
                    BlocConsumer<ContactCubit, ContactState>(
                      listener: (context, state) {
                        if (state is ContactSError) {
                          state.error.failedBar(context);
                        } else if (state is ContactSuccess) {
                          "Berhasil".succeedBar(context);
                        }
                      },
                      builder: (context, state) {
                        if (state is ContactLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is ContactSError) {
                          return Center(
                            child: Text(state.error),
                          );
                        } else if (state is ContactSuccess) {
                          return Column(
                            children: [
                              if (state.data.isNotEmpty)
                                const Text(
                                  "List Contacts",
                                  style: TextStyle(
                                    fontSize: 24.0,
                                  ),
                                ),
                              16.0.height,
                              ListView.builder(
                                shrinkWrap: true,
                                reverse: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.data.length,
                                itemBuilder: (context, index) {
                                  ContactModel item = state.data[index];
                                  return InkWell(
                                    onTap: () {},
                                    child: Card(
                                      color: AppColors.card,
                                      child: ListTile(
                                        leading: SizedBox(
                                          height: 40.0,
                                          width: 40.0,
                                          child: SvgPicture.string(
                                              item.avatarUrl!),
                                        ),
                                        title: Text(item.name!),
                                        subtitle: Text(item.phone!),
                                        trailing: SizedBox(
                                          width: 96.0,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              IconButton(
                                                onPressed: () async =>
                                                    await showDialog<void>(
                                                  context: context,
                                                  barrierDismissible: true,
                                                  builder:
                                                      (BuildContext context) =>
                                                          DialogUpdate(item),
                                                ),
                                                icon: const Icon(Icons.edit),
                                              ),
                                              IconButton(
                                                onPressed: () async =>
                                                    await showDialog<void>(
                                                  context: context,
                                                  barrierDismissible: true,
                                                  builder:
                                                      (BuildContext context) =>
                                                          DialogDelete(item),
                                                ),
                                                icon: const Icon(Icons.delete),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                    40.0.height,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: AppColors.card,
              child: IconButton(
                onPressed: () =>
                    Navigator.pushNamed(context, PostsPage.routeName),
                icon: const Icon(Icons.pages),
              ),
            ),
            Card(
              color: AppColors.card,
              child: IconButton(
                onPressed: () =>
                    Navigator.pushNamed(context, ImageGeneratorPage.routeName),
                icon: const Icon(Icons.image),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
