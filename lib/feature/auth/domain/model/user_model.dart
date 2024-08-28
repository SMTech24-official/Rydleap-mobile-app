class UserModel {
  String? id;
  String? username;
  String? email;
  String? role;

  UserModel({this.id, this.username, this.email, this.role});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    username = json['username'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['role'] = role;
    return data;
  }

  // Optionally, you can create a method to split the username into first and last name if needed
  String get firstName {
    if (username != null && username!.contains(' ')) {
      return username!.split(' ').first;
    }
    return username ?? '';
  }

  String get lastName {
    if (username != null && username!.contains(' ')) {
      return username!.split(' ').last;
    }
    return '';
  }

  String get fullName => '${firstName} ${lastName}';
}
