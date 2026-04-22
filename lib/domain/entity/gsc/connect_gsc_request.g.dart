// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect_gsc_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConnectGscRequest _$ConnectGscRequestFromJson(Map<String, dynamic> json) =>
    ConnectGscRequest(
      projectId: json['projectId'] as String,
      code: json['code'] as String,
      codeVerifier: json['codeVerifier'] as String,
      redirectUri: json['redirectUri'] as String,
    );

Map<String, dynamic> _$ConnectGscRequestToJson(ConnectGscRequest instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'code': instance.code,
      'codeVerifier': instance.codeVerifier,
      'redirectUri': instance.redirectUri,
    };
