class UserModel {
  bool? success;
  Data? data;
  String? message;

  UserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
    token = json['token'];
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  int? online;
  String? local;
  int? role;
  int? approvedByAdmin;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;
  String? nationalIdUrl;
  String? roleName;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    online = json['online'];
    local = json['local'];
    role = json['role'];
    approvedByAdmin = json['approved_by_admin'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
    nationalIdUrl = json['national_id_url'];
    roleName = json['role_name'];
  }
}
