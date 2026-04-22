// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'integrations_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IntegrationsStore on _IntegrationsStore, Store {
  late final _$isConnectingAtom =
      Atom(name: '_IntegrationsStore.isConnecting', context: context);

  @override
  bool get isConnecting {
    _$isConnectingAtom.reportRead();
    return super.isConnecting;
  }

  @override
  set isConnecting(bool value) {
    _$isConnectingAtom.reportWrite(value, super.isConnecting, () {
      super.isConnecting = value;
    });
  }

  late final _$isLoadingSitesAtom =
      Atom(name: '_IntegrationsStore.isLoadingSites', context: context);

  @override
  bool get isLoadingSites {
    _$isLoadingSitesAtom.reportRead();
    return super.isLoadingSites;
  }

  @override
  set isLoadingSites(bool value) {
    _$isLoadingSitesAtom.reportWrite(value, super.isLoadingSites, () {
      super.isLoadingSites = value;
    });
  }

  late final _$isLoadingAnalyticsAtom =
      Atom(name: '_IntegrationsStore.isLoadingAnalytics', context: context);

  @override
  bool get isLoadingAnalytics {
    _$isLoadingAnalyticsAtom.reportRead();
    return super.isLoadingAnalytics;
  }

  @override
  set isLoadingAnalytics(bool value) {
    _$isLoadingAnalyticsAtom.reportWrite(value, super.isLoadingAnalytics, () {
      super.isLoadingAnalytics = value;
    });
  }

  late final _$isConnectedAtom =
      Atom(name: '_IntegrationsStore.isConnected', context: context);

  @override
  bool get isConnected {
    _$isConnectedAtom.reportRead();
    return super.isConnected;
  }

  @override
  set isConnected(bool value) {
    _$isConnectedAtom.reportWrite(value, super.isConnected, () {
      super.isConnected = value;
    });
  }

  late final _$hasErrorAtom =
      Atom(name: '_IntegrationsStore.hasError', context: context);

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_IntegrationsStore.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$currentProjectIdAtom =
      Atom(name: '_IntegrationsStore.currentProjectId', context: context);

  @override
  String? get currentProjectId {
    _$currentProjectIdAtom.reportRead();
    return super.currentProjectId;
  }

  @override
  set currentProjectId(String? value) {
    _$currentProjectIdAtom.reportWrite(value, super.currentProjectId, () {
      super.currentProjectId = value;
    });
  }

  late final _$gscSitesAtom =
      Atom(name: '_IntegrationsStore.gscSites', context: context);

  @override
  ObservableList<GscSite> get gscSites {
    _$gscSitesAtom.reportRead();
    return super.gscSites;
  }

  @override
  set gscSites(ObservableList<GscSite> value) {
    _$gscSitesAtom.reportWrite(value, super.gscSites, () {
      super.gscSites = value;
    });
  }

  late final _$selectedGscPropertyAtom =
      Atom(name: '_IntegrationsStore.selectedGscProperty', context: context);

  @override
  String? get selectedGscProperty {
    _$selectedGscPropertyAtom.reportRead();
    return super.selectedGscProperty;
  }

  @override
  set selectedGscProperty(String? value) {
    _$selectedGscPropertyAtom.reportWrite(value, super.selectedGscProperty, () {
      super.selectedGscProperty = value;
    });
  }

  late final _$gscImpressionsAtom =
      Atom(name: '_IntegrationsStore.gscImpressions', context: context);

  @override
  int get gscImpressions {
    _$gscImpressionsAtom.reportRead();
    return super.gscImpressions;
  }

  @override
  set gscImpressions(int value) {
    _$gscImpressionsAtom.reportWrite(value, super.gscImpressions, () {
      super.gscImpressions = value;
    });
  }

  late final _$gscClicksAtom =
      Atom(name: '_IntegrationsStore.gscClicks', context: context);

  @override
  int get gscClicks {
    _$gscClicksAtom.reportRead();
    return super.gscClicks;
  }

  @override
  set gscClicks(int value) {
    _$gscClicksAtom.reportWrite(value, super.gscClicks, () {
      super.gscClicks = value;
    });
  }

  late final _$gscAveragePositionAtom =
      Atom(name: '_IntegrationsStore.gscAveragePosition', context: context);

  @override
  double get gscAveragePosition {
    _$gscAveragePositionAtom.reportRead();
    return super.gscAveragePosition;
  }

  @override
  set gscAveragePosition(double value) {
    _$gscAveragePositionAtom.reportWrite(value, super.gscAveragePosition, () {
      super.gscAveragePosition = value;
    });
  }

  late final _$gscCtrAtom =
      Atom(name: '_IntegrationsStore.gscCtr', context: context);

  @override
  double get gscCtr {
    _$gscCtrAtom.reportRead();
    return super.gscCtr;
  }

  @override
  set gscCtr(double value) {
    _$gscCtrAtom.reportWrite(value, super.gscCtr, () {
      super.gscCtr = value;
    });
  }

  late final _$initializeAsyncAction =
      AsyncAction('_IntegrationsStore.initialize', context: context);

  @override
  Future<void> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  late final _$connectGoogleAsyncAction =
      AsyncAction('_IntegrationsStore.connectGoogle', context: context);

  @override
  Future<void> connectGoogle() {
    return _$connectGoogleAsyncAction.run(() => super.connectGoogle());
  }

  late final _$fetchGscSitesAsyncAction =
      AsyncAction('_IntegrationsStore.fetchGscSites', context: context);

  @override
  Future<void> fetchGscSites() {
    return _$fetchGscSitesAsyncAction.run(() => super.fetchGscSites());
  }

  late final _$linkSiteAsyncAction =
      AsyncAction('_IntegrationsStore.linkSite', context: context);

  @override
  Future<void> linkSite(String siteUrl) {
    return _$linkSiteAsyncAction.run(() => super.linkSite(siteUrl));
  }

  late final _$fetchAnalyticsAsyncAction =
      AsyncAction('_IntegrationsStore.fetchAnalytics', context: context);

  @override
  Future<void> fetchAnalytics() {
    return _$fetchAnalyticsAsyncAction.run(() => super.fetchAnalytics());
  }

  late final _$_IntegrationsStoreActionController =
      ActionController(name: '_IntegrationsStore', context: context);

  @override
  void disconnect() {
    final _$actionInfo = _$_IntegrationsStoreActionController.startAction(
        name: '_IntegrationsStore.disconnect');
    try {
      return super.disconnect();
    } finally {
      _$_IntegrationsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void simulateError() {
    final _$actionInfo = _$_IntegrationsStoreActionController.startAction(
        name: '_IntegrationsStore.simulateError');
    try {
      return super.simulateError();
    } finally {
      _$_IntegrationsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isConnecting: ${isConnecting},
isLoadingSites: ${isLoadingSites},
isLoadingAnalytics: ${isLoadingAnalytics},
isConnected: ${isConnected},
hasError: ${hasError},
errorMessage: ${errorMessage},
currentProjectId: ${currentProjectId},
gscSites: ${gscSites},
selectedGscProperty: ${selectedGscProperty},
gscImpressions: ${gscImpressions},
gscClicks: ${gscClicks},
gscAveragePosition: ${gscAveragePosition},
gscCtr: ${gscCtr}
    ''';
  }
}
