import 'package:mobx/mobx.dart';
import 'package:boilerplate/domain/repository/project/project_repository.dart';
import 'package:boilerplate/domain/repository/gsc/gsc_repository.dart';
import 'package:boilerplate/domain/entity/gsc/connect_gsc_request.dart';
import 'package:boilerplate/domain/entity/gsc/link_site_request.dart';
import 'package:boilerplate/domain/entity/gsc/gsc_site.dart';
import 'package:boilerplate/domain/entity/gsc/gsc_analytics_summary.dart';

part 'integrations_store.g.dart';

class IntegrationsStore = _IntegrationsStore with _$IntegrationsStore;

abstract class _IntegrationsStore with Store {
  final ProjectRepository _projectRepository;
  final GscRepository _gscRepository;

  _IntegrationsStore(this._projectRepository, this._gscRepository);

  @observable
  bool isConnecting = false;

  @observable
  bool isLoadingSites = false;

  @observable
  bool isLoadingAnalytics = false;

  @observable
  bool isConnected = false;

  @observable
  bool hasError = false;

  @observable
  String? errorMessage;

  @observable
  String? currentProjectId;

  @observable
  ObservableList<GscSite> gscSites = ObservableList<GscSite>();

  @observable
  String? selectedGscProperty;

  // GSC Metrics
  @observable
  int gscImpressions = 0;
  @observable
  int gscClicks = 0;
  @observable
  double gscAveragePosition = 0.0;
  @observable
  double gscCtr = 0.0;

  @action
  Future<void> initialize() async {
    try {
      hasError = false;
      // 1. Get User's Project ID
      final projects = await _projectRepository.getProjects();
      if (projects.isNotEmpty) {
        currentProjectId = projects.first.id;
        // Optionally check if we are already connected using /gsc/status/:projectId
        // For now, we will wait for user to hit Connect
      } else {
        errorMessage = 'No projects found.';
        hasError = true;
      }
    } catch (e) {
      errorMessage = e.toString();
      hasError = true;
    }
  }

  @action
  Future<void> connectGoogle() async {
    if (currentProjectId == null) {
      errorMessage = 'Project ID is not available. Try reloading the screen.';
      hasError = true;
      return;
    }

    isConnecting = true;
    hasError = false;

    try {
      // Flow OAuth2 logic would go here.
      // Example with flutter_web_auth_2:
      // final result = await FlutterWebAuth2.authenticate(
      //   url: 'https://accounts.google.com/o/oauth2/v2/auth?client_id=...&redirect_uri=...',
      //   callbackUrlScheme: 'ai-aeo',
      // );
      // final code = Uri.parse(result).queryParameters['code'];

      // Simulated mock logic since real Google Client ID is pending.
      await Future.delayed(const Duration(seconds: 1));
      const mockCode = 'mock_auth_code_123';
      const mockCodeVerifier = 'mock_code_verifier_123_abc_xyz_qwe_rty_uio_pas';
      const mockRedirectUri = 'ai-aeo://gsc/callback';

      await _gscRepository.connect(ConnectGscRequest(
        projectId: currentProjectId!,
        code: mockCode,
        codeVerifier: mockCodeVerifier,
        redirectUri: mockRedirectUri,
      ));

      isConnected = true;
      await fetchGscSites();
    } catch (e) {
      errorMessage = 'Failed to connect: ${e.toString()}';
      hasError = true;
    } finally {
      isConnecting = false;
    }
  }

  @action
  Future<void> fetchGscSites() async {
    if (currentProjectId == null) return;

    isLoadingSites = true;
    try {
      final sites = await _gscRepository.getSites(currentProjectId!);
      gscSites.clear();
      gscSites.addAll(sites);

      if (gscSites.isNotEmpty) {
        selectedGscProperty = gscSites.first.siteUrl;
        await linkSite(gscSites.first.siteUrl);
      }
    } catch (e) {
      errorMessage = 'Failed to fetch sites: ${e.toString()}';
      hasError = true;
    } finally {
      isLoadingSites = false;
    }
  }

  @action
  Future<void> linkSite(String siteUrl) async {
    if (currentProjectId == null) return;
    try {
      await _gscRepository.linkSite(LinkSiteRequest(
        projectId: currentProjectId!,
        siteUrl: siteUrl,
      ));
      selectedGscProperty = siteUrl;
      await fetchAnalytics();
    } catch (e) {
      errorMessage = 'Failed to link site: ${e.toString()}';
      hasError = true;
    }
  }

  @action
  Future<void> fetchAnalytics() async {
    if (currentProjectId == null) return;
    isLoadingAnalytics = true;
    try {
      final analytics =
          await _gscRepository.getAnalyticsSummary(currentProjectId!);
      gscClicks = analytics.clicks;
      gscImpressions = analytics.impressions;
      gscAveragePosition = analytics.position;
      gscCtr = analytics.ctr;
    } catch (e) {
      errorMessage = 'Failed to fetch analytics: ${e.toString()}';
      hasError = true;
    } finally {
      isLoadingAnalytics = false;
    }
  }

  @action
  void disconnect() {
    isConnected = false;
    selectedGscProperty = null;
    gscSites.clear();
    gscClicks = 0;
    gscImpressions = 0;
    gscAveragePosition = 0;
    gscCtr = 0;
    hasError = false;
    errorMessage = null;
    // In reality, you'd also call the backend to disconnect
  }

  @action
  void simulateError() {
    errorMessage = 'Simulated Token Error. Please reconnect.';
    hasError = true;
  }
}
