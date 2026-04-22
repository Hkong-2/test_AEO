import 'package:boilerplate/core/data/network/dio/dio_client.dart';
import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/domain/entity/gsc/connect_gsc_request.dart';
import 'package:boilerplate/domain/entity/gsc/gsc_analytics_summary.dart';
import 'package:boilerplate/domain/entity/gsc/gsc_site.dart';
import 'package:boilerplate/domain/entity/gsc/gsc_success.dart';
import 'package:boilerplate/domain/entity/gsc/link_site_request.dart';
import 'package:boilerplate/domain/entity/gsc/gsc_property.dart';

class GscApi {
  final DioClient _dioClient;

  GscApi(this._dioClient);

  Future<GscSuccess> connect(ConnectGscRequest request) async {
    try {
      final res = await _dioClient.dio.post(
        Endpoints.gscConnect,
        data: request.toJson(),
      );
      return GscSuccess.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<GscSite>> getSites(String projectId) async {
    try {
      final res = await _dioClient.dio.get(Endpoints.gscSites(projectId));
      final List<dynamic> data = res.data;
      return data.map((e) => GscSite.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<GscProperty> linkSite(LinkSiteRequest request) async {
    try {
      final res = await _dioClient.dio.post(
        Endpoints.gscLink,
        data: request.toJson(),
      );
      return GscProperty.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<GscAnalyticsSummary> getAnalyticsSummary(String projectId) async {
    try {
      final res = await _dioClient.dio.get(Endpoints.gscAnalytics(projectId));
      return GscAnalyticsSummary.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }
}
