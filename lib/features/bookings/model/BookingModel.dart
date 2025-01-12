class BookingModel {
  BookingModel({
      this.id, 
      this.userId, 
      this.propertyId, 
      this.startDate, 
      this.endDate, 
      this.status, 
      this.createdAt, 
      this.updatedAt,
      this.user, 
      this.property,});

  BookingModel.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    propertyId = json['property_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    property = json['property'] != null ? Property.fromJson(json['property']) : null;
  }
  int? id;
  int? userId;
  int? propertyId;
  String? startDate;
  String? endDate;
  String? status;
  String? createdAt;
  String? updatedAt;
  User? user;
  Property? property;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['property_id'] = propertyId;
    map['start_date'] = startDate;
    map['end_date'] = endDate;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (property != null) {
      map['property'] = property?.toJson();
    }
    return map;
  }

}

class Property {
  Property({
      this.id, 
      this.userId, 
      this.name, 
      this.description, 
      this.price, 
      this.location, 
      this.images, 
      this.video, 
      this.createdAt, 
      this.updatedAt,});

  Property.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    location = json['location'];
    images = json['images'];
    video = json['video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? userId;
  String? name;
  String? description;
  String? price;
  String? location;
  String? images;
  String? video;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['location'] = location;
    map['images'] = images;
    map['video'] = video;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
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
      this.updatedAt,});

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