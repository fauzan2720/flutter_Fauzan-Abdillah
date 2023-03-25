import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:first_project/core/widgets/form_button.dart';

class FormPickerPage extends StatefulWidget {
  static const routeName = 'form_picker_page';

  final void Function(DateTime?, TimeOfDay?, Color?, File?)? onTap;

  const FormPickerPage({
    super.key,
    this.onTap,
  });

  @override
  State<FormPickerPage> createState() => _FormPickerPageState();
}

class _FormPickerPageState extends State<FormPickerPage> {
  DateTime pickedDate = DateTime.now();
  TimeOfDay pickedTime = TimeOfDay.now();
  Color pickedColor = Colors.green;
  File? selectedFile;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as FormPickerPage;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Widgets'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // DATE PICKER
            Card(
              child: ListTile(
                title: const Text("Date"),
                subtitle: Text(DateFormat.yMMMMEEEEd().format(pickedDate)),
                trailing: TextButton(
                  child: const Text("Select"),
                  onPressed: () async {
                    final result = await showDatePicker(
                      context: context,
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      initialDate: pickedDate,
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 1)),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    pickedDate = result!;
                    print("pickedDate: $pickedDate");
                  },
                ),
              ),
            ),

            // TIME PICKER
            Card(
              child: ListTile(
                title: const Text("Time"),
                subtitle: Text(pickedTime.format(context)),
                trailing: TextButton(
                  child: const Text("Select"),
                  onPressed: () async {
                    final result = await showTimePicker(
                      initialTime: pickedTime,
                      context: context,
                    );
                    pickedTime = result!;
                    print("pickedTime: $pickedTime");
                  },
                ),
              ),
            ),

            // COLOR PICKER
            Card(
              child: ListTile(
                title: const Text("Color"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      height: 100.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: pickedColor,
                      ),
                    ),
                    Center(
                      child: FozFormButton(
                        label: "Pick Color",
                        backgroundColor: pickedColor,
                        onPressed: () async {
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
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                          print("pickedColor: $pickedColor");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // FILE PICKER
            Card(
              child: ListTile(
                title: selectedFile == null
                    ? const Text("File")
                    : GestureDetector(
                        onTap: () async {
                          if (selectedFile != null) {
                            await OpenFile.open(selectedFile!.path);
                          }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.file(
                            selectedFile!,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      ),
                subtitle: FozFormButton(
                  label: "Pick and Open File",
                  backgroundColor: pickedColor,
                  onPressed: () async {
                    final result = await FilePicker.platform.pickFiles(
                      type: FileType.image,
                    );
                    if (result != null) {
                      setState(() {
                        selectedFile = File(result.files.single.path!);
                      });
                    }
                    if (selectedFile != null) {
                      await OpenFile.open(selectedFile!.path);
                    }
                    print("selectedFile: $selectedFile");
                  },
                ),
              ),
            ),

            // BUTTON
            Align(
              alignment: Alignment.centerRight,
              child: FozFormButton(
                label: "Done",
                onPressed: () => args.onTap!(
                    pickedDate, pickedTime, pickedColor, selectedFile),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
