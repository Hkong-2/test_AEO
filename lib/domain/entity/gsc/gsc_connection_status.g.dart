// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gsc_connection_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GscConnectionStatus _$GscConnectionStatusFromJson(Map<String, dynamic> json) =>
    GscConnectionStatus(
      connected: json['connected'] as bool,
      scopes:
          (json['scopes'] as List<dynamic>).map((e) => e as String).toList(),
      isValid: json['isValid'] as bool,
    );

Map<String, dynamic> _$GscConnectionStatusToJson(
        GscConnectionStatus instance) =>
    <String, dynamic>{
      'connected': instance.connected,
      'scopes': instance.scopes,
      'isValid': instance.isValid,
    };
