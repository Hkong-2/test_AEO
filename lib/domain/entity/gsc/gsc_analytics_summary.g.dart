// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gsc_analytics_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GscAnalyticsSummary _$GscAnalyticsSummaryFromJson(Map<String, dynamic> json) =>
    GscAnalyticsSummary(
      clicks: (json['clicks'] as num).toInt(),
      impressions: (json['impressions'] as num).toInt(),
      ctr: (json['ctr'] as num).toDouble(),
      position: (json['position'] as num).toDouble(),
    );

Map<String, dynamic> _$GscAnalyticsSummaryToJson(
        GscAnalyticsSummary instance) =>
    <String, dynamic>{
      'clicks': instance.clicks,
      'impressions': instance.impressions,
      'ctr': instance.ctr,
      'position': instance.position,
    };
