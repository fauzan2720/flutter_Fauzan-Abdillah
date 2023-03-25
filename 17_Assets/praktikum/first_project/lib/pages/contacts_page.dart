import 'package:first_project/core/colors.dart';
import 'package:first_project/core/widgets/form_button.dart';
import 'package:first_project/core/widgets/form_input.dart';
import 'package:first_project/model/contact_model.dart';
import 'package:first_project/pages/contacts_controller.dart';
import 'package:first_project/pages/gallery_page.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class ContactsPage extends StatefulWidget {
  static const routeName = 'contacts_page';

  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  late ContactsController controller;

  @override
  void initState() {
    controller = ContactsController(context, setState);
    super.initState();
  }

  void showFormEditContact(ContactModel contact) async {
    controller.nameEditController.text = contact.name;
    controller.phoneEditController.text = contact.phoneNumber;
    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Form(
          key: controller.formEditKey,
          child: AlertDialog(
            title: const Text('Update Contact'),
            actions: <Widget>[
              FozFormInput(
                label: 'Name',
                hint: 'Insert Your Name',
                controller: controller.nameEditController,
                validator: (value) => controller.nameValidation(value!),
              ),
              const SizedBox(
                height: 16.0,
              ),
              FozFormInput(
                label: 'Nomor',
                hint: '+62 ....',
                controller: controller.phoneEditController,
                keyboardType: TextInputType.phone,
                validator: (value) => controller.phoneValidation(value!),
              ),
              StatefulBuilder(
                builder: (context, setState) => const SizedBox(
                  height: 16.0,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FozFormButton(
                  label: 'Update',
                  onPressed: () {
                    controller.updateContact(contact.id);
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
              onPressed: () {
                Navigator.pop(context);
              },
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
                Navigator.pop(context);
                controller.deleteContact(contact.id);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: const [
                Icon(Icons.mobile_friendly),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Create New Contacts",
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                    "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made."),
                SizedBox(
                  height: 16.0,
                ),
                Divider(),
                SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          ),
          Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  FozFormInput(
                    label: 'Name',
                    hint: 'Insert Your Name',
                    controller: controller.nameController,
                    validator: (value) => controller.nameValidation(value!),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  FozFormInput(
                    label: 'Nomor',
                    hint: '+62 ....',
                    controller: controller.phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) => controller.phoneValidation(value!),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FozFormButton(
                      label: 'Submit',
                      onPressed: () => controller.saveContact(),
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  if (controller.dummy.contacts.isNotEmpty)
                    const Text(
                      "List Contacts",
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.dummy.contacts.length,
                    itemBuilder: (context, index) {
                      ContactModel item = controller.dummy.contacts[index];
                      return Card(
                        color: item.pickedColor ?? AppColors.cardColor,
                        child: ListTile(
                          leading: item.selectedFile == null
                              ? CircleAvatar(
                                  backgroundColor: AppColors.backgroundColor,
                                  child: Text(
                                    item.name[0].toUpperCase(),
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () async {
                                    if (item.selectedFile != null) {
                                      await OpenFile.open(
                                          item.selectedFile!.path);
                                    }
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50.0),
                                    child: Image.file(
                                      item.selectedFile!,
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
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () => showFormEditContact(item),
                                  icon: const Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () =>
                                      showConfirmDeleteContact(item),
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const GalleryPage(),
        //     )),
        onPressed: () =>
            Navigator.pushReplacementNamed(context, GalleryPage.routeName),
        backgroundColor: AppColors.cardColor,
        child: const Icon(Icons.image),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
