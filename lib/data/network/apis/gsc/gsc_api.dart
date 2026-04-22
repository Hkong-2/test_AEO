import 'package:boilerplate/core/data/network/dio/dio_client.dart';
import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/domain/entity/gsc/connect_gsc_request.dart';
import 'package:boilerplate/domain/entity/gsc/gsc_analytics_summary.dart';
import 'package:boilerplate/domain/entity/gsc/gsc_site.dart';
import 'package:boilerplate/domain/entity/gsc/gsc_success.dart';
import 'package:boilerplate/domain/entity/gsc/link_site_request.dart';
import 'package:boilerplate/domain/entity/gsc/gsc_property.dart';
import 'package:boilerplate/domain/entity/gsc/gsc_connection_status.dart';
import 'package:boilerplate/domain/entity/gsc/gsc_query_row.dart';
import 'package:boilerplate/domain/entity/gsc/gsc_page_row.dart';
import 'package:boilerplate/domain/entity/gsc/gsc_trend_point.dart';

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

  Future<GscAnalyticsSummary> getAnalyticsSummary(
      String projectId, {
      String? startDate,
      String? endDate,
      }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (startDate != null) queryParams['startDate'] = startDate;
      if (endDate != null) queryParams['endDate'] = endDate;
      final res = await _dioClient.dio.get(
        Endpoints.gscAnalytics(projectId),
        queryParameters: queryParams.isNotEmpty ? queryParams : null,
      );
      return GscAnalyticsSummary.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<GscConnectionStatus> getStatus(String projectId) async {
    try {
      final res = await _dioClient.dio.get(Endpoints.gscStatus(projectId));
      return GscConnectionStatus.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<GscSuccess> disconnect(String projectId) async {
    try {
      final res = await _dioClient.dio.delete(Endpoints.gscDisconnect(projectId));
      return GscSuccess.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<GscProperty?> getLinkedProperty(String projectId) async {
    try {
      final res = await _dioClient.dio.get(Endpoints.gscLinkedProperty(projectId));
      if (res.data == null || res.data.toString().isEmpty) {
        return null;
      }
      return GscProperty.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<GscSuccess> unlinkSite(String projectId) async {
    try {
      final res = await _dioClient.dio.delete(Endpoints.gscUnlink(projectId));
      return GscSuccess.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<GscQueryRow>> getTopQueries(
      String projectId, {
      String? startDate,
      String? endDate,
      int? rowLimit,
      }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (startDate != null) queryParams['startDate'] = startDate;
      if (endDate != null) queryParams['endDate'] = endDate;
      if (rowLimit != null) queryParams['rowLimit'] = rowLimit;

      final res = await _dioClient.dio.get(
        Endpoints.gscTopQueries(projectId),
        queryParameters: queryParams.isNotEmpty ? queryParams : null,
      );
      final List<dynamic> data = res.data;
      return data.map((e) => GscQueryRow.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<GscPageRow>> getTopPages(
      String projectId, {
      String? startDate,
      String? endDate,
      int? rowLimit,
      }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (startDate != null) queryParams['startDate'] = startDate;
      if (endDate != null) queryParams['endDate'] = endDate;
      if (rowLimit != null) queryParams['rowLimit'] = rowLimit;

      final res = await _dioClient.dio.get(
        Endpoints.gscTopPages(projectId),
        queryParameters: queryParams.isNotEmpty ? queryParams : null,
      );
      final List<dynamic> data = res.data;
      return data.map((e) => GscPageRow.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<GscTrendPoint>> getDateTrend(
      String projectId, {
      String? startDate,
      String? endDate,
      }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (startDate != null) queryParams['startDate'] = startDate;
      if (endDate != null) queryParams['endDate'] = endDate;

      final res = await _dioClient.dio.get(
        Endpoints.gscDateTrend(projectId),
        queryParameters: queryParams.isNotEmpty ? queryParams : null,
      );
      final List<dynamic> data = res.data;
      return data.map((e) => GscTrendPoint.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
