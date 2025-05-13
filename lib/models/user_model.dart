import 'package:flutter/foundation.dart';

@immutable
class UserModel {
  final String id;
  final String name;
  final String contact;
  final String email;
  final List<String> skills;
  final String? profilePictureUrl; // Optional: URL for the profile picture

  const UserModel({
    required this.id,
    required this.name,
    required this.contact,
    required this.email,
    required this.skills,
    this.profilePictureUrl,
  });

  // Optional: A copyWith method to easily create modified instances
  UserModel copyWith({
    String? id,
    String? name,
    String? contact,
    String? email,
    List<String>? skills,
    String? profilePictureUrl,
    bool setProfilePictureUrlToNull = false, // To explicitly set it to null
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      contact: contact ?? this.contact,
      email: email ?? this.email,
      skills: skills ?? this.skills,
      profilePictureUrl: setProfilePictureUrlToNull ? null : profilePictureUrl ?? this.profilePictureUrl,
    );
  }

  // Optional: For JSON serialization/deserialization if needed (e.g., for API or local storage)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      contact: json['contact'] as String,
      email: json['email'] as String,
      skills: List<String>.from(json['skills'] as List<dynamic>),
      profilePictureUrl: json['profilePictureUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'contact': contact,
      'email': email,
      'skills': skills,
      'profilePictureUrl': profilePictureUrl,
    };
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, skills: ${skills.join(", ")}, profilePictureUrl: $profilePictureUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.contact == contact &&
        other.email == email &&
        listEquals(other.skills, skills) &&
        other.profilePictureUrl == profilePictureUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        contact.hashCode ^
        email.hashCode ^
        skills.hashCode ^
        profilePictureUrl.hashCode;
  }
}