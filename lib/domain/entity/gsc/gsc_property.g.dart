// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gsc_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GscProperty _$GscPropertyFromJson(Map<String, dynamic> json) => GscProperty(
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      userId: json['userId'] as String,
      siteUrl: json['siteUrl'] as String,
      permissionLevel: json['permissionLevel'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$GscPropertyToJson(GscProperty instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'userId': instance.userId,
      'siteUrl': instance.siteUrl,
      'permissionLevel': instance.permissionLevel,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
