class ContactModel {
  int? id;
  String? name;
  String? phone;
  String? job;
  String? avatarUrl;

  ContactModel({
    this.id,
    this.name,
    this.phone,
    this.job,
    this.avatarUrl,
  });

  ContactModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    job = json['job'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['job'] = job;
    return data;
  }
}
