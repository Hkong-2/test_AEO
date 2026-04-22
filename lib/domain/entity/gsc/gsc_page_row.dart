import 'package:json_annotation/json_annotation.dart';

part 'gsc_page_row.g.dart';

@JsonSerializable()
class GscPageRow {
  final String page;
  final int clicks;
  final int impressions;
  final double ctr;
  final double position;

  GscPageRow({
    required this.page,
    required this.clicks,
    required this.impressions,
    required this.ctr,
    required this.position,
  });

  factory GscPageRow.fromJson(Map<String, dynamic> json) =>
      _$GscPageRowFromJson(json);
  Map<String, dynamic> toJson() => _$GscPageRowToJson(this);
}
