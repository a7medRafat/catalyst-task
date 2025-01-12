class UsersModel {
  UsersModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.role,
    this.profileImage,
    this.introVideo,
    this.createdAt,
    this.updatedAt,
  });

  UsersModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    profileImage = json['profile_image'];
    introVideo = json['intro_video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  int? id;
  String? name;
  String? email;
  String? phone;
  String? role;
  String? profileImage;
  String? introVideo;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson({
    required String name,
    required String email,
    required String phone,
    required String role,
    String? profileImage,
    String? introVideo,
  }) {
    final map = <String, dynamic>{};

    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['role'] = role;

    if (profileImage != null) {
      map['profile_image'] = profileImage;
    }
    if (introVideo != null) {
      map['intro_video'] = introVideo;
    }

    return map;
  }
}
