import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:ourpass_assessment/core/domain/entities/user_profile.dart';

part 'serializers.g.dart';

@SerializersFor(const [UserProfile])
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin()))
  .build();