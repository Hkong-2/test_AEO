/// API endpoint constants.
/// Base URLs are injected from EnvironmentConfig via DI.
class Endpoints {
  Endpoints._();

  // base url (default fallback, overridden by EnvironmentConfig)
  static const String baseUrl = "http://jsonplaceholder.typicode.com";

  // timeouts
  static const int receiveTimeout = 15000;
  static const int connectionTimeout = 30000;

  // AI service timeout (longer for AI processing)
  static const int aiReceiveTimeout = 60000;

  // post endpoints
  static const String getPosts = "/posts";

  // content enhancement endpoints (AI service)
  static const String contentBase = "/api/v1/content";
  static String contentOperation(String op) => "$contentBase/$op";

  // SEO audit endpoints
  static const String seoAudit = "/api/v1/seo/audit";
  static String seoAuditResult(String id) => "/api/v1/seo/audit/$id";
  static String seoCrawler(String url) =>
      "/api/v1/seo/crawler?url=${Uri.encodeComponent(url)}";

  // Project endpoints
  static const String getProjects = "/projects/me";

  // GSC endpoints
  static const String gscConnect = "/gsc/connect";
  static String gscStatus(String projectId) => "/gsc/status/$projectId";
  static String gscDisconnect(String projectId) => "/gsc/disconnect/$projectId";
  static String gscSites(String projectId) => "/gsc/sites/$projectId";
  static const String gscLink = "/gsc/link";
  static String gscLinkedProperty(String projectId) => "/gsc/link/$projectId";
  static String gscUnlink(String projectId) => "/gsc/link/$projectId";
  static String gscAnalytics(String projectId) => "/gsc/analytics/$projectId";
  static String gscTopQueries(String projectId) => "/gsc/analytics/$projectId/queries";
  static String gscTopPages(String projectId) => "/gsc/analytics/$projectId/pages";
  static String gscDateTrend(String projectId) => "/gsc/analytics/$projectId/trend";
}
