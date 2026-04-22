import 'package:json_annotation/json_annotation.dart';

part 'gsc_query_row.g.dart';

@JsonSerializable()
class GscQueryRow {
  final String query;
  final int clicks;
  final int impressions;
  final double ctr;
  final double position;

  GscQueryRow({
    required this.query,
    required this.clicks,
    required this.impressions,
    required this.ctr,
    required this.position,
  });

  factory GscQueryRow.fromJson(Map<String, dynamic> json) =>
      _$GscQueryRowFromJson(json);
  Map<String, dynamic> toJson() => _$GscQueryRowToJson(this);
}
