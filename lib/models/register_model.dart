class UserModel {
  bool? success;
  Data? data;
  String? message;

  UserModel({this.success, this.data, this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;

    return data;
  }
}

class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
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

  User({this.id, this.name, this.email, this.phone, this.online, this.local, this.role, this.approvedByAdmin, this.createdAt, this.updatedAt, this.imageUrl, this.nationalIdUrl, this.roleName});

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['online'] = this.online;
    data['local'] = this.local;
    data['role'] = this.role;
    data['approved_by_admin'] = this.approvedByAdmin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_url'] = this.imageUrl;
    data['national_id_url'] = this.nationalIdUrl;
    data['role_name'] = this.roleName;
    return data;
  }
}

// class Validator {
//
//
//   Validator({});
//
// Validator.fromJson(Map<String, dynamic> json) {
// }
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   return data;
// }
// }


// {
// "success": true,
// "data": {
// "user": {
// "id": 60,
// "name": "mariana",
// "email": "marinaaaa3@gmail.com",
// "phone": "01211141451",
// "address": null,
// "image": null,
// "online": 0,
// "national_id": null,
// "national_id_image": null,
// "provider": null,
// "provider_id": null,
// "local": "en",
// "role": 3,
// "email_verified_at": null,
// "phone_verified_at": null,
// "approved_by_admin": 0,
// "approved_by": null,
// "deleted_at": null,
// "created_at": "2022-02-24T00:14:22.000000Z",
// "updated_at": "2022-02-24T00:14:22.000000Z",
// "image_url": "http://162.240.24.203/~tohome/system/images/anonymous/anonymous-user.png",
// "national_id_url": "http://162.240.24.203/~tohome/system/images/anonymous/id.jpeg",
// "role_name": "Delegate"
// },
// "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiMTk3M2Q4MzE4MWU0ZGZjNjQxYjcxOTFkOWVhNDdjODQwY2RiY2M3MWZkOTM4NDcxNzk4OTcxZDc0MzA5M2JjZDgxNThj I/flutter ( 6488): YjFiM2RkMzM5NDMiLCJpYXQiOjE2NDU2NjE2NjIuNDE4OTU2MDQxMzM2MDU5NTcwMzEyNSwibmJmIjoxNjQ1NjYxNjYyLjQxODk2MTA0ODEyNjIyMDcwMzEyNSwiZXhwIjoxNjc3MTk3NjYyLjQxNTk3MDA4NzA1MTM5MTYwMTU2MjUsInN1YiI6IjYwIiwic2NvcGVzIjpbXX0.EEVtFvcH5wSBi75YxjgT51zNgLssY88vgnTjPXEq4E6ThmG_t8QxPRl_CZ5C7uMAC9v4wsbw0IEX8yALULNdA_blqZuc4d30FAgXOtL2RbqMNyksGP6rtthVj2O_oTJOOpYH9pZfGlb97eDxyrFl67Mn7TaQYq_hvt3L7aV1e-Zp58q0XM3lzkaxnkm5Uj1rQfrJYhOcvreiieaFSrY_LlTpXMV4mbHn5U9L72cjxK671hhBm3juSfz0pYGTIY5XZEuO9OF_e41N5w3c6odw5wpPDNcmybACSoqtWKQMWf_D8GtuVCZKXtX7hSG17PRf37pAXGbPlUBfLxHDRHr3ZjSoyfpAy1Z68gD3DiDoXYWbWkYWH9q_CVtluDYeyHpeChUXH4d3QcXJvXgckoiS0PvKB-jYZFBDhvB2LZj4YxJx1WanNH-NQ05pFcg1Z3dB4arQ-8ko29nmKGVZcIX6sl-tE2_W2ZTj4HzgW-RAC6y9NX6xGEA7jO-CaqF7qcdlRTj48PTOH-hoIBf-8rsrH44zRygHyBudL3HdwFfJN6Qwg1OhbSJWYZO1LBeSK6OJMeo97s-GzbaQXmAb I/flutter ( 6488): 9ow2pYYj2gNR4jEurifh0YGIZAyf8f8DQGWSevOD8FjPQXdGNG0YaazaRTuhuFuLKjH-sFyGEmcCgXralRAUvVNRToo"
// },
// "message": "Operation done successfully!",
// "validator": {
//
// }
// }