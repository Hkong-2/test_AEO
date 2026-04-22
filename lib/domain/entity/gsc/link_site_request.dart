import 'package:json_annotation/json_annotation.dart';

part 'link_site_request.g.dart';

@JsonSerializable()
class LinkSiteRequest {
  final String projectId;
  final String siteUrl;

  LinkSiteRequest({
    required this.projectId,
    required this.siteUrl,
  });

  factory LinkSiteRequest.fromJson(Map<String, dynamic> json) =>
      _$LinkSiteRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LinkSiteRequestToJson(this);
}
