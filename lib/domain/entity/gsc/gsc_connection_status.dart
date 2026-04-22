import 'package:json_annotation/json_annotation.dart';

part 'gsc_connection_status.g.dart';

@JsonSerializable()
class GscConnectionStatus {
  final bool connected;
  final List<String> scopes;
  final bool isValid;

  GscConnectionStatus({
    required this.connected,
    required this.scopes,
    required this.isValid,
  });

  factory GscConnectionStatus.fromJson(Map<String, dynamic> json) =>
      _$GscConnectionStatusFromJson(json);
  Map<String, dynamic> toJson() => _$GscConnectionStatusToJson(this);
}
