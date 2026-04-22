// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gsc_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GscStore on _GscStore, Store {
  late final _$isConnectedAtom =
      Atom(name: '_GscStore.isConnected', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: '_GscStore.isLoading', context: context);

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

  late final _$accessTokenAtom =
      Atom(name: '_GscStore.accessToken', context: context);

  @override
  String? get accessToken {
    _$accessTokenAtom.reportRead();
    return super.accessToken;
  }

  @override
  set accessToken(String? value) {
    _$accessTokenAtom.reportWrite(value, super.accessToken, () {
      super.accessToken = value;
    });
  }

  late final _$connectGoogleAsyncAction =
      AsyncAction('_GscStore.connectGoogle', context: context);

  @override
  Future<void> connectGoogle(String projectId) {
    return _$connectGoogleAsyncAction.run(() => super.connectGoogle(projectId));
  }

  late final _$checkStatusAsyncAction =
      AsyncAction('_GscStore.checkStatus', context: context);

  @override
  Future<void> checkStatus(String projectId) {
    return _$checkStatusAsyncAction.run(() => super.checkStatus(projectId));
  }

  late final _$disconnectGoogleAsyncAction =
      AsyncAction('_GscStore.disconnectGoogle', context: context);

  @override
  Future<void> disconnectGoogle(String projectId) {
    return _$disconnectGoogleAsyncAction
        .run(() => super.disconnectGoogle(projectId));
  }

  @override
  String toString() {
    return '''
isConnected: ${isConnected},
isLoading: ${isLoading},
accessToken: ${accessToken}
    ''';
  }
}
