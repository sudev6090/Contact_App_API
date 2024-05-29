class ContactModel {
  String? name;
  int? phone;
  String? email;
  String? address;
  String? createdAt;
  String? updatedAt;
  String? id;

  ContactModel({
    this.name,
    this.phone,
    this.email,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  ContactModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'phone': phone, 'email': email, 'address': address};
  }
}
