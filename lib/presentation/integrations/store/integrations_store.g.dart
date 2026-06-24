// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'integrations_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IntegrationsStore on _IntegrationsStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_IntegrationsStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
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

  late final _$gscPropertiesAtom =
      Atom(name: '_IntegrationsStore.gscProperties', context: context);

  @override
  ObservableList<String> get gscProperties {
    _$gscPropertiesAtom.reportRead();
    return super.gscProperties;
  }

  @override
  set gscProperties(ObservableList<String> value) {
    _$gscPropertiesAtom.reportWrite(value, super.gscProperties, () {
      super.gscProperties = value;
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

  late final _$selectedGa4StreamAtom =
      Atom(name: '_IntegrationsStore.selectedGa4Stream', context: context);

  @override
  String? get selectedGa4Stream {
    _$selectedGa4StreamAtom.reportRead();
    return super.selectedGa4Stream;
  }

  @override
  set selectedGa4Stream(String? value) {
    _$selectedGa4StreamAtom.reportWrite(value, super.selectedGa4Stream, () {
      super.selectedGa4Stream = value;
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

  late final _$ga4SessionsAtom =
      Atom(name: '_IntegrationsStore.ga4Sessions', context: context);

  @override
  int get ga4Sessions {
    _$ga4SessionsAtom.reportRead();
    return super.ga4Sessions;
  }

  @override
  set ga4Sessions(int value) {
    _$ga4SessionsAtom.reportWrite(value, super.ga4Sessions, () {
      super.ga4Sessions = value;
    });
  }

  late final _$ga4BounceRateAtom =
      Atom(name: '_IntegrationsStore.ga4BounceRate', context: context);

  @override
  String get ga4BounceRate {
    _$ga4BounceRateAtom.reportRead();
    return super.ga4BounceRate;
  }

  @override
  set ga4BounceRate(String value) {
    _$ga4BounceRateAtom.reportWrite(value, super.ga4BounceRate, () {
      super.ga4BounceRate = value;
    });
  }

  late final _$ga4KeyConversionsAtom =
      Atom(name: '_IntegrationsStore.ga4KeyConversions', context: context);

  @override
  int get ga4KeyConversions {
    _$ga4KeyConversionsAtom.reportRead();
    return super.ga4KeyConversions;
  }

  @override
  set ga4KeyConversions(int value) {
    _$ga4KeyConversionsAtom.reportWrite(value, super.ga4KeyConversions, () {
      super.ga4KeyConversions = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_IntegrationsStore.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$connectGoogleAsyncAction =
      AsyncAction('_IntegrationsStore.connectGoogle', context: context);

  @override
  Future<void> connectGoogle() {
    return _$connectGoogleAsyncAction.run(() => super.connectGoogle());
  }

  late final _$linkSelectedSiteAsyncAction =
      AsyncAction('_IntegrationsStore.linkSelectedSite', context: context);

  @override
  Future<void> linkSelectedSite() {
    return _$linkSelectedSiteAsyncAction.run(() => super.linkSelectedSite());
  }

  late final _$disconnectAsyncAction =
      AsyncAction('_IntegrationsStore.disconnect', context: context);

  @override
  Future<void> disconnect() {
    return _$disconnectAsyncAction.run(() => super.disconnect());
  }

  late final _$_IntegrationsStoreActionController =
      ActionController(name: '_IntegrationsStore', context: context);

  @override
  void refreshMetrics() {
    final _$actionInfo = _$_IntegrationsStoreActionController.startAction(
        name: '_IntegrationsStore.refreshMetrics');
    try {
      return super.refreshMetrics();
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
isLoading: ${isLoading},
currentProjectId: ${currentProjectId},
isConnecting: ${isConnecting},
isConnected: ${isConnected},
hasError: ${hasError},
errorMessage: ${errorMessage},
gscProperties: ${gscProperties},
selectedGscProperty: ${selectedGscProperty},
selectedGa4Stream: ${selectedGa4Stream},
gscImpressions: ${gscImpressions},
gscClicks: ${gscClicks},
gscAveragePosition: ${gscAveragePosition},
ga4Sessions: ${ga4Sessions},
ga4BounceRate: ${ga4BounceRate},
ga4KeyConversions: ${ga4KeyConversions}
    ''';
  }
}
