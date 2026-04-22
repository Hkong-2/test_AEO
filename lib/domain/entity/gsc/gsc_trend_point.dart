import 'package:json_annotation/json_annotation.dart';

part 'gsc_trend_point.g.dart';

@JsonSerializable()
class GscTrendPoint {
  final String date;
  final int clicks;
  final int impressions;
  final double ctr;
  final double position;

  GscTrendPoint({
    required this.date,
    required this.clicks,
    required this.impressions,
    required this.ctr,
    required this.position,
  });

  factory GscTrendPoint.fromJson(Map<String, dynamic> json) =>
      _$GscTrendPointFromJson(json);
  Map<String, dynamic> toJson() => _$GscTrendPointToJson(this);
}
