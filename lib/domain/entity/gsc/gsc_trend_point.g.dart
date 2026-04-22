// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gsc_trend_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GscTrendPoint _$GscTrendPointFromJson(Map<String, dynamic> json) =>
    GscTrendPoint(
      date: json['date'] as String,
      clicks: (json['clicks'] as num).toInt(),
      impressions: (json['impressions'] as num).toInt(),
      ctr: (json['ctr'] as num).toDouble(),
      position: (json['position'] as num).toDouble(),
    );

Map<String, dynamic> _$GscTrendPointToJson(GscTrendPoint instance) =>
    <String, dynamic>{
      'date': instance.date,
      'clicks': instance.clicks,
      'impressions': instance.impressions,
      'ctr': instance.ctr,
      'position': instance.position,
    };
