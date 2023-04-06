import 'package:first_project/core/colors.dart';
import 'package:first_project/core/extensions/double_ext.dart';
import 'package:first_project/core/extensions/string_ext.dart';
import 'package:first_project/core/widgets/form_button.dart';
import 'package:first_project/core/widgets/form_input.dart';
import 'package:first_project/model/contact_model.dart';
import 'package:first_project/presentation/cubit/auth/auth_cubit.dart';
import 'package:first_project/presentation/cubit/contact/contact_cubit.dart';
import 'package:first_project/presentation/pages/form_picker_page.dart';
import 'package:first_project/presentation/pages/gallery_page.dart';
import 'package:first_project/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';
import 'package:uuid/uuid.dart';

class ContactsPage extends StatelessWidget {
  static const routeName = 'contacts_page';

  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final GlobalKey<FormState> formEditKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController nameEditController = TextEditingController();
    final TextEditingController phoneEditController = TextEditingController();

    void showFormEditContact(ContactModel contact) async {
      nameEditController.text = contact.name;
      phoneEditController.text = contact.phoneNumber;
      await showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Form(
            key: formEditKey,
            child: AlertDialog(
              title: const Text('Update Contact'),
              actions: <Widget>[
                FozFormInput(
                  label: 'Name',
                  hint: 'Insert Your Name',
                  controller: nameEditController,
                  validator: (value) =>
                      context.read<ContactCubit>().nameValidation(value!),
                ),
                16.0.height,
                FozFormInput(
                  label: 'Nomor',
                  hint: '+62 ....',
                  controller: phoneEditController,
                  keyboardType: TextInputType.phone,
                  validator: (value) =>
                      context.read<ContactCubit>().phoneValidation(value!),
                ),
                16.0.height,
                Align(
                  alignment: Alignment.centerRight,
                  child: FozFormButton(
                    label: 'Update',
                    onPressed: () {
                      final FormState form = formEditKey.currentState!;
                      final ContactModel query = ContactModel(
                        id: contact.id,
                        name: nameEditController.text,
                        phoneNumber: phoneEditController.text,
                        pickedDate: contact.pickedDate,
                        pickedTime: contact.pickedTime,
                        pickedColor: contact.pickedColor,
                        filePath: contact.filePath,
                      );

                      if (form.validate()) {
                        context.read<ContactCubit>().updateContact(query);
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    void showConfirmDeleteContact(ContactModel contact) async {
      await showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirm'),
            content: Text('Apakah kamu yakin ingin hapus ${contact.name}?'),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[600],
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "No",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  context.read<ContactCubit>().deleteContact(contact.id);
                },
                child: const Text(
                  "Yes",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        actions: [
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                "Berhasil logout".succeedBar(context);
                Navigator.pushReplacementNamed(context, LoginPage.routeName);
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
                return IconButton(
                  onPressed: () {
                    context.read<AuthCubit>().logout();
                  },
                  icon: Icon(
                    Icons.logout,
                    color: AppColors.error,
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: ListView(
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
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthSuccess) {
                      return Text("Welcome, ${state.data.username} 👋🏻");
                    } else {
                      return Container();
                    }
                  },
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
                      onPressed: () async {
                        final FormState form = formKey.currentState!;
                        final ContactModel query = ContactModel(
                          id: const Uuid().v4(),
                          name: nameController.text,
                          phoneNumber: phoneController.text,
                        );

                        if (form.validate()) {
                          nameController.clear();
                          phoneController.clear();
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      FormPickerPage(contact: query),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                final tween = Tween(begin: 0.0, end: 1.0);
                                return ScaleTransition(
                                  scale: animation.drive(tween),
                                  child: child,
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  50.0.height,
                  BlocConsumer<ContactCubit, ContactState>(
                    listener: (context, state) {
                      if (state is ContactSError) {
                        state.error.errorDialog(context);
                      } else if (state is ContactSuccess) {
                        "Berhasil".successDialog(context);
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
                                  onTap: () => Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 500),
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          FormPickerPage(contact: item),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        final tween =
                                            Tween(begin: 0.0, end: 1.0);
                                        return ScaleTransition(
                                          scale: animation.drive(tween),
                                          child: child,
                                        );
                                      },
                                    ),
                                  ),
                                  child: Card(
                                    color: item.pickedColor?.toColor() ??
                                        AppColors.card,
                                    child: ListTile(
                                      leading: item.filePath == null
                                          ? CircleAvatar(
                                              backgroundColor:
                                                  AppColors.background,
                                              child: Text(
                                                item.name[0].toUpperCase(),
                                                style: TextStyle(
                                                  color: AppColors.primary,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            )
                                          : GestureDetector(
                                              onTap: () async {
                                                if (item.filePath != null) {
                                                  await OpenFile.open(
                                                      item.filePath!);
                                                }
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                                child: Image.file(
                                                  item.filePath!.toFile(),
                                                  fit: BoxFit.cover,
                                                  width: 40.0,
                                                  height: 40.0,
                                                ),
                                              ),
                                            ),
                                      title: Text(item.name),
                                      subtitle: Text(item.phoneNumber),
                                      trailing: SizedBox(
                                        width: 96.0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: () =>
                                                  showFormEditContact(item),
                                              icon: const Icon(Icons.edit),
                                            ),
                                            IconButton(
                                              onPressed: () =>
                                                  showConfirmDeleteContact(
                                                      item),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) =>
                const GalleryPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final tween =
                  Tween(begin: const Offset(0.5, 0), end: Offset.zero);
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        ),
        backgroundColor: AppColors.card,
        child: const Icon(Icons.image),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
