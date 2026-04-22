// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gsc_page_row.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GscPageRow _$GscPageRowFromJson(Map<String, dynamic> json) => GscPageRow(
      page: json['page'] as String,
      clicks: (json['clicks'] as num).toInt(),
      impressions: (json['impressions'] as num).toInt(),
      ctr: (json['ctr'] as num).toDouble(),
      position: (json['position'] as num).toDouble(),
    );

Map<String, dynamic> _$GscPageRowToJson(GscPageRow instance) =>
    <String, dynamic>{
      'page': instance.page,
      'clicks': instance.clicks,
      'impressions': instance.impressions,
      'ctr': instance.ctr,
      'position': instance.position,
    };
