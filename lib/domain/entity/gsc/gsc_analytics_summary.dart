import 'package:json_annotation/json_annotation.dart';

part 'gsc_analytics_summary.g.dart';

@JsonSerializable()
class GscAnalyticsSummary {
  final int clicks;
  final int impressions;
  final double ctr;
  final double position;

  GscAnalyticsSummary({
    required this.clicks,
    required this.impressions,
    required this.ctr,
    required this.position,
  });

  factory GscAnalyticsSummary.fromJson(Map<String, dynamic> json) =>
      _$GscAnalyticsSummaryFromJson(json);
  Map<String, dynamic> toJson() => _$GscAnalyticsSummaryToJson(this);
}
