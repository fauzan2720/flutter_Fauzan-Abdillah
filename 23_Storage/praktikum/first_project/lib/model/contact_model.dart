import 'dart:convert';

class ContactModel {
  final String id;
  final String name;
  final String phoneNumber;
  final String? pickedDate;
  final String? pickedTime;
  final String? pickedColor;
  final String? filePath;

  ContactModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    this.pickedDate,
    this.pickedTime,
    this.pickedColor,
    this.filePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'pickedDate': pickedDate,
      'pickedTime': pickedTime,
      'pickedColor': pickedColor,
      'filePath': filePath,
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      pickedDate: map['pickedDate'],
      pickedTime: map['pickedTime'],
      pickedColor: map['pickedColor'],
      filePath: map['filePath'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactModel.fromJson(String source) =>
      ContactModel.fromMap(json.decode(source));
}
