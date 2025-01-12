import 'dart:convert';

class PropertiesModel {
  PropertiesModel({
    this.id,
    this.userId,
    this.name,
    this.description,
    this.price,
    this.location,
    this.images,
    this.video,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  PropertiesModel.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    location = json['location'];

    if (json['images'] != null) {
      if (json['images'] is String) {
        images = List<String>.from(jsonDecode(json['images']));
      } else if (json['images'] is List) {
        images = List<String>.from(json['images']);
      }
    }

    video = json['video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  int? id;
  int? userId;
  String? name;
  String? description;
  String? price;
  String? location;
  List<String>? images;
  String? video;
  String? createdAt;
  String? updatedAt;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['location'] = location;
    if (images != null) {
      map['images'] = images;
    }
    map['video'] = video;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}

class User {
  User({
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

  User.fromJson(dynamic json) {
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['role'] = role;
    map['profile_image'] = profileImage;
    map['intro_video'] = introVideo;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
