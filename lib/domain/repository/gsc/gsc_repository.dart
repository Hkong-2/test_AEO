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

abstract class GscRepository {
  Future<GscSuccess> connect(ConnectGscRequest request);
  Future<List<GscSite>> getSites(String projectId);
  Future<GscProperty> linkSite(LinkSiteRequest request);
  Future<GscAnalyticsSummary> getAnalyticsSummary(String projectId, {String? startDate, String? endDate});
  Future<GscConnectionStatus> getStatus(String projectId);
  Future<GscSuccess> disconnect(String projectId);
  Future<GscProperty?> getLinkedProperty(String projectId);
  Future<GscSuccess> unlinkSite(String projectId);
  Future<List<GscQueryRow>> getTopQueries(String projectId, {String? startDate, String? endDate, int? rowLimit});
  Future<List<GscPageRow>> getTopPages(String projectId, {String? startDate, String? endDate, int? rowLimit});
  Future<List<GscTrendPoint>> getDateTrend(String projectId, {String? startDate, String? endDate});
}
