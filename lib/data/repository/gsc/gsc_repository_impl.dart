import 'package:boilerplate/data/network/apis/gsc/gsc_api.dart';
import 'package:boilerplate/domain/entity/gsc/connect_gsc_request.dart';
import 'package:boilerplate/domain/entity/gsc/gsc_analytics_summary.dart';
import 'package:boilerplate/domain/entity/gsc/gsc_site.dart';
import 'package:boilerplate/domain/entity/gsc/gsc_success.dart';
import 'package:boilerplate/domain/entity/gsc/link_site_request.dart';
import 'package:boilerplate/domain/entity/gsc/gsc_property.dart';
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
  Future<GscAnalyticsSummary> getAnalyticsSummary(String projectId) async {
    return await _gscApi.getAnalyticsSummary(projectId);
  }
}
