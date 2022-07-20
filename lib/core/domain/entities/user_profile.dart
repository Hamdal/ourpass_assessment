import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ourpass_assessment/core/domain/entities/serializers.dart';

part 'user_profile.g.dart';

abstract class UserProfile implements Built<UserProfile, UserProfileBuilder> {
  // Fields
  String get id;
  String get name;
  String get email;
  bool get verified;
  String get created;

  UserProfile._();

  factory UserProfile([void Function(UserProfileBuilder) updates]) = _$UserProfile;

  String toJson() {
    return json.encode(serializers.serializeWith(UserProfile.serializer, this));
  }

  static UserProfile fromJson(String jsonString) {
    return serializers.deserializeWith(UserProfile.serializer, json.decode(jsonString))!;
  }

  static Serializer<UserProfile> get serializer => _$userProfileSerializer;
}