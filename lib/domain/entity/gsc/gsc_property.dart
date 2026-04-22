import 'package:json_annotation/json_annotation.dart';

part 'gsc_property.g.dart';

@JsonSerializable()
class GscProperty {
  final String id;
  final String projectId;
  final String userId;
  final String siteUrl;
  final String? permissionLevel;
  final String createdAt;
  final String updatedAt;

  GscProperty({
    required this.id,
    required this.projectId,
    required this.userId,
    required this.siteUrl,
    this.permissionLevel,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GscProperty.fromJson(Map<String, dynamic> json) =>
      _$GscPropertyFromJson(json);
  Map<String, dynamic> toJson() => _$GscPropertyToJson(this);
}
