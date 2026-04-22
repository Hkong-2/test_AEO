import 'package:json_annotation/json_annotation.dart';

part 'gsc_site.g.dart';

@JsonSerializable()
class GscSite {
  final String siteUrl;
  final String permissionLevel;

  GscSite({
    required this.siteUrl,
    required this.permissionLevel,
  });

  factory GscSite.fromJson(Map<String, dynamic> json) =>
      _$GscSiteFromJson(json);
  Map<String, dynamic> toJson() => _$GscSiteToJson(this);
}
