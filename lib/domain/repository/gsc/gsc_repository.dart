import 'package:boilerplate/domain/entity/gsc/connect_gsc_request.dart';
import 'package:boilerplate/domain/entity/gsc/gsc_analytics_summary.dart';
import 'package:boilerplate/domain/entity/gsc/gsc_site.dart';
import 'package:boilerplate/domain/entity/gsc/gsc_success.dart';
import 'package:boilerplate/domain/entity/gsc/link_site_request.dart';
import 'package:boilerplate/domain/entity/gsc/gsc_property.dart';

abstract class GscRepository {
  Future<GscSuccess> connect(ConnectGscRequest request);
  Future<List<GscSite>> getSites(String projectId);
  Future<GscProperty> linkSite(LinkSiteRequest request);
  Future<GscAnalyticsSummary> getAnalyticsSummary(String projectId);
}
