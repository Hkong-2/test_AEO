// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_site_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkSiteRequest _$LinkSiteRequestFromJson(Map<String, dynamic> json) =>
    LinkSiteRequest(
      projectId: json['projectId'] as String,
      siteUrl: json['siteUrl'] as String,
    );

Map<String, dynamic> _$LinkSiteRequestToJson(LinkSiteRequest instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'siteUrl': instance.siteUrl,
    };
