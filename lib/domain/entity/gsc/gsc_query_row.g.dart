// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gsc_query_row.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GscQueryRow _$GscQueryRowFromJson(Map<String, dynamic> json) => GscQueryRow(
      query: json['query'] as String,
      clicks: (json['clicks'] as num).toInt(),
      impressions: (json['impressions'] as num).toInt(),
      ctr: (json['ctr'] as num).toDouble(),
      position: (json['position'] as num).toDouble(),
    );

Map<String, dynamic> _$GscQueryRowToJson(GscQueryRow instance) =>
    <String, dynamic>{
      'query': instance.query,
      'clicks': instance.clicks,
      'impressions': instance.impressions,
      'ctr': instance.ctr,
      'position': instance.position,
    };
