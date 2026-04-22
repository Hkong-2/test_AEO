import 'package:json_annotation/json_annotation.dart';

part 'project_response.g.dart';

@JsonSerializable()
class ProjectResponse {
  final String id;
  final String status;
  final String createdBy;
  final String monitoringFrequency;
  final String location;
  final String language;
  final List<String> models;
  final String createdAt;
  final String updatedAt;
  final double? brandVisibilityScore;
  final bool? isPro;

  ProjectResponse({
    required this.id,
    required this.status,
    required this.createdBy,
    required this.monitoringFrequency,
    required this.location,
    required this.language,
    required this.models,
    required this.createdAt,
    required this.updatedAt,
    this.brandVisibilityScore,
    this.isPro,
  });

  factory ProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectResponseToJson(this);
}
