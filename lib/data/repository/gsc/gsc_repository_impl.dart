import 'package:boilerplate/data/network/apis/gsc/gsc_api.dart';
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
import 'package:boilerplate/domain/repository/gsc/gsc_repository.dart';

class GscRepositoryImpl extends GscRepository {
  final GscApi _gscApi;

  GscRepositoryImpl(this._gscApi);

  @override
  Future<GscSuccess> connect(ConnectGscRequest request) async {
    return await _gscApi.connect(request);
  }

  @override
  Future<List<GscSite>> getSites(String projectId) async {
    return await _gscApi.getSites(projectId);
  }

  @override
  Future<GscProperty> linkSite(LinkSiteRequest request) async {
    return await _gscApi.linkSite(request);
  }

  @override
  Future<GscAnalyticsSummary> getAnalyticsSummary(String projectId, {String? startDate, String? endDate}) async {
    return await _gscApi.getAnalyticsSummary(projectId, startDate: startDate, endDate: endDate);
  }

  @override
  Future<GscConnectionStatus> getStatus(String projectId) async {
    return await _gscApi.getStatus(projectId);
  }

  @override
  Future<GscSuccess> disconnect(String projectId) async {
    return await _gscApi.disconnect(projectId);
  }

  @override
  Future<GscProperty?> getLinkedProperty(String projectId) async {
    return await _gscApi.getLinkedProperty(projectId);
  }

  @override
  Future<GscSuccess> unlinkSite(String projectId) async {
    return await _gscApi.unlinkSite(projectId);
  }

  @override
  Future<List<GscQueryRow>> getTopQueries(String projectId, {String? startDate, String? endDate, int? rowLimit}) async {
    return await _gscApi.getTopQueries(projectId, startDate: startDate, endDate: endDate, rowLimit: rowLimit);
  }

  @override
  Future<List<GscPageRow>> getTopPages(String projectId, {String? startDate, String? endDate, int? rowLimit}) async {
    return await _gscApi.getTopPages(projectId, startDate: startDate, endDate: endDate, rowLimit: rowLimit);
  }

  @override
  Future<List<GscTrendPoint>> getDateTrend(String projectId, {String? startDate, String? endDate}) async {
    return await _gscApi.getDateTrend(projectId, startDate: startDate, endDate: endDate);
  }
}
