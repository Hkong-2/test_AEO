import 'package:json_annotation/json_annotation.dart';

part 'connect_gsc_request.g.dart';

@JsonSerializable()
class ConnectGscRequest {
  final String projectId;
  final String code;
  final String codeVerifier;
  final String redirectUri;

  ConnectGscRequest({
    required this.projectId,
    required this.code,
    required this.codeVerifier,
    required this.redirectUri,
  });

  factory ConnectGscRequest.fromJson(Map<String, dynamic> json) =>
      _$ConnectGscRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ConnectGscRequestToJson(this);
}
