import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:first_project/core/extensions/build_context_ext.dart';
import 'package:first_project/model/contact_model.dart';
import 'package:first_project/presentation/bloc/contact_bloc.dart';
import 'package:first_project/presentation/widgets/form_color_picker.dart';
import 'package:first_project/presentation/widgets/form_date_picker.dart';
import 'package:first_project/presentation/widgets/form_file_picker.dart';
import 'package:first_project/presentation/widgets/form_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:first_project/core/widgets/form_button.dart';
import 'package:open_file/open_file.dart';

class FormPickerPage extends StatelessWidget {
  static const routeName = 'form_picker_page';

  final ContactModel contact;

  const FormPickerPage({
    super.key,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    final ContactBloc contactBloc = context.read<ContactBloc>();

    DateTime pickedDate = contact.pickedDate ?? DateTime.now();
    TimeOfDay pickedTime = contact.pickedTime ?? TimeOfDay.now();
    Color pickedColor = contact.pickedColor ?? Colors.green;
    File? selectedFile = contact.selectedFile;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Widgets'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: StatefulBuilder(
          builder: (context, setState) => Column(
            children: [
              FormDatePicker(
                initialDate: pickedDate,
                onTap: () async {
                  final result = await showDatePicker(
                    context: context,
                    initialEntryMode: DatePickerEntryMode.calendarOnly,
                    initialDate: pickedDate,
                    firstDate: DateTime.now().subtract(const Duration(days: 1)),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  pickedDate = result!;
                  setState(() {});
                  print("pickedDate: $pickedDate");
                },
              ),
              FormTimePicker(
                initialTime: pickedTime,
                onTap: () async {
                  final result = await showTimePicker(
                    initialTime: pickedTime,
                    context: context,
                  );
                  pickedTime = result!;
                  setState(() {});
                  print("pickedTime: $pickedTime");
                },
              ),
              FormColorPicker(
                initialColor: pickedColor,
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Pick a color'),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            pickerColor: pickedColor,
                            onColorChanged: (Color color) {
                              setState(() {
                                pickedColor = color;
                              });
                            },
                            pickerAreaHeightPercent: 0.8,
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      );
                    },
                  );
                  print("pickedColor: $pickedColor");
                },
              ),
              FormFilePicker(
                initialFile: selectedFile,
                onTap: () async {
                  final result = await FilePicker.platform.pickFiles(
                    type: FileType.image,
                  );
                  if (result != null) {
                    setState(() {
                      selectedFile = File(result.files.single.path!);
                    });
                  }
                  print("selectedFile: $selectedFile");
                },
                onShowImage: () async {
                  if (selectedFile != null) {
                    await OpenFile.open(selectedFile!.path);
                  }
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FozFormButton(
                  label: "Done",
                  onPressed: () {
                    contactBloc.add(
                      AddContact(ContactModel(
                        id: contact.id,
                        name: contact.name,
                        phoneNumber: contact.phoneNumber,
                        pickedDate: pickedDate,
                        pickedTime: pickedTime,
                        pickedColor: pickedColor,
                        selectedFile: selectedFile,
                      )),
                    );
                    context.successDialog();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
