import 'package:mobx/mobx.dart';
import 'package:boilerplate/data/network/apis/gsc/gsc_api.dart';
import 'package:boilerplate/data/network/apis/performance/performance_api.dart';
import 'package:boilerplate/data/service/google_auth_service.dart';
import 'package:boilerplate/di/service_locator.dart';

part 'integrations_store.g.dart';

class IntegrationsStore = _IntegrationsStore with _$IntegrationsStore;

abstract class _IntegrationsStore with Store {
  final GscApi _gscApi = getIt<GscApi>();
  final PerformanceApi _performanceApi = getIt<PerformanceApi>();
  final GoogleAuthService _googleAuthService = getIt<GoogleAuthService>();

  @observable
  bool isLoading = false;

  @observable
  String? currentProjectId;

  @observable
  bool isConnecting = false;

  @observable
  bool isConnected = false;

  @observable
  bool hasError = false;

  @observable
  String? errorMessage;

  @observable
  ObservableList<String> gscProperties = ObservableList<String>();

  @observable
  String? selectedGscProperty;

  // Mock Data GA4
  final List<String> ga4Streams = [
    'GA4 - Main Website (G-ABCDEF1234)',
    'GA4 - Blog (G-XYZ9876543)',
    'GA4 - iOS App (1234567890)',
    'GA4 - Android App (0987654321)'
  ];


  @observable
  String? selectedGa4Stream;

  // GSC Metrics
  @observable
  int gscImpressions = 145200;
  @observable
  int gscClicks = 12400;
  @observable
  double gscAveragePosition = 12.4;

  // GA4 Metrics
  @observable
  int ga4Sessions = 45890;
  @observable
  String ga4BounceRate = '38.5%';
  @observable
  int ga4KeyConversions = 1250;

  @action
  void refreshMetrics() {
    // Generate pseudo-random realistic looking metrics based on current selections
    int seed = (selectedGscProperty?.hashCode ?? 0) + (selectedGa4Stream?.hashCode ?? 0);

    // Use the seed to create variations, but keep them realistic
    gscImpressions = 100000 + (seed % 150000).abs();
    gscClicks = (gscImpressions * (0.05 + ((seed % 100) / 1000.0))).round(); // CTR ~ 5-15%
    gscAveragePosition = 5.0 + ((seed % 200) / 10.0); // Pos ~ 5.0 - 25.0

    ga4Sessions = (gscClicks * (1.2 + ((seed % 50) / 100.0))).round(); // Sessions usually slightly higher than GSC Clicks
    double bounceRateValue = 35.0 + ((seed % 250) / 10.0); // 35% - 60%
    ga4BounceRate = '${bounceRateValue.toStringAsFixed(1)}%';
    ga4KeyConversions = (ga4Sessions * (0.02 + ((seed % 50) / 1000.0))).round(); // Conv rate ~ 2-7%
  }

  @action
  Future<void> init() async {
    isLoading = true;
    hasError = false;
    errorMessage = null;

    try {
      currentProjectId = await _performanceApi.resolveProjectId();
      if (currentProjectId == null) {
        hasError = true;
        errorMessage = "No active project found. Cannot load Google Search Console integrations.";
        return;
      }

      final status = await _gscApi.getStatus(currentProjectId!);
      isConnected = status['connected'] == true;

      if (isConnected) {
        if (status['isValid'] == false) {
            hasError = true;
            errorMessage = "Google token is expired or revoked. Please reconnect.";
        } else {
            await _fetchSites(currentProjectId!);
            final linkedSite = await _gscApi.getLinkedSite(currentProjectId!);
            if (linkedSite != null && linkedSite['siteUrl'] != null) {
              final siteUrl = linkedSite['siteUrl'] as String;
              if (gscProperties.contains(siteUrl)) {
                selectedGscProperty = siteUrl;
              }
            }
        }
      }
    } catch (e) {
       hasError = true;
       errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }

  Future<void> _fetchSites(String projectId) async {
    try {
      final sites = await _gscApi.getSites(projectId);
      gscProperties.clear();
      for (var site in sites) {
         if (site['siteUrl'] != null) {
           gscProperties.add(site['siteUrl'] as String);
         }
      }
      if (gscProperties.isNotEmpty && selectedGscProperty == null) {
        selectedGscProperty = gscProperties.first;
      }
    } catch (e) {
      hasError = true;
      errorMessage = "Failed to load GSC properties: ${e.toString()}";
    }
  }

  @action
  Future<void> connectGoogle() async {
    isConnecting = true;
    hasError = false;
    errorMessage = null;

    try {
      if (currentProjectId == null) {
        throw Exception("Project ID not found. Cannot connect GSC.");
      }

      final authResult = await _googleAuthService.signIn(
        scopes: ['openid', 'email', 'profile', 'https://www.googleapis.com/auth/webmasters.readonly'],
        offlineAccess: true,
      );

      await _gscApi.connectGsc({
        'projectId': currentProjectId,
        'code': authResult.code,
        'codeVerifier': authResult.codeVerifier,
        'redirectUri': authResult.redirectUri,
      });

      isConnected = true;
      await _fetchSites(currentProjectId!);

      selectedGa4Stream = ga4Streams.first; // Mock GA4
    } catch (e) {
      hasError = true;
      errorMessage = "Failed to connect Google: ${e.toString()}";
    } finally {
      isConnecting = false;
    }
  }

  @action
  Future<void> linkSelectedSite() async {
    if (selectedGscProperty == null || currentProjectId == null) return;
    try {
       await _gscApi.linkSite({
          'projectId': currentProjectId,
          'siteUrl': selectedGscProperty
       });
    } catch (e) {
       hasError = true;
       errorMessage = "Failed to link site: ${e.toString()}";
    }
  }

  @action
  Future<void> disconnect() async {
    if (currentProjectId == null) return;
    try {
      await _gscApi.disconnect(currentProjectId!);
      isConnected = false;
      selectedGscProperty = null;
      selectedGa4Stream = null;
      gscProperties.clear();
      hasError = false;
      errorMessage = null;
    } catch (e) {
      hasError = true;
      errorMessage = "Failed to disconnect: ${e.toString()}";
    }
  }

  @action
  void simulateError() {
    hasError = true;
    errorMessage = "Simulated error occurred.";
  }
}
