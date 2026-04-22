import 'package:json_annotation/json_annotation.dart';

part 'gsc_success.g.dart';

@JsonSerializable()
class GscSuccess {
  final bool success;

  GscSuccess({required this.success});

  factory GscSuccess.fromJson(Map<String, dynamic> json) =>
      _$GscSuccessFromJson(json);
  Map<String, dynamic> toJson() => _$GscSuccessToJson(this);
}
