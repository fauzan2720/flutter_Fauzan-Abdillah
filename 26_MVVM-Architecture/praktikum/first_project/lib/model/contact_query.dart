class ContactQuery {
  final int? id;
  final String name;
  final String phone;
  final String? job;

  ContactQuery({
    this.id,
    required this.name,
    required this.phone,
    this.job,
  });
}
