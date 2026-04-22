// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectResponse _$ProjectResponseFromJson(Map<String, dynamic> json) =>
    ProjectResponse(
      id: json['id'] as String,
      status: json['status'] as String,
      createdBy: json['createdBy'] as String,
      monitoringFrequency: json['monitoringFrequency'] as String,
      location: json['location'] as String,
      language: json['language'] as String,
      models:
          (json['models'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      brandVisibilityScore: (json['brandVisibilityScore'] as num?)?.toDouble(),
      isPro: json['isPro'] as bool?,
    );

Map<String, dynamic> _$ProjectResponseToJson(ProjectResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'createdBy': instance.createdBy,
      'monitoringFrequency': instance.monitoringFrequency,
      'location': instance.location,
      'language': instance.language,
      'models': instance.models,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'brandVisibilityScore': instance.brandVisibilityScore,
      'isPro': instance.isPro,
    };
