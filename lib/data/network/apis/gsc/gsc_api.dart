import 'dart:async';

import 'package:boilerplate/core/data/network/dio/dio_client.dart';
import 'package:boilerplate/data/network/constants/endpoints.dart';

/// API client for Google Search Console endpoints.
class GscApi {
  final DioClient _dioClient;

  // Mock State Variables to maintain state during demo
  static bool _isMockConnected = false;
  static Map<String, dynamic>? _mockLinkedSite;

  GscApi(this._dioClient);

  /// Connect Google Search Console via OAuth.
  /// Post code and PKCE parameters to backend.
  Future<Map<String, dynamic>> connectGsc(Map<String, dynamic> data) async {
    // HARDCODE MOCK DATA
    await Future.delayed(const Duration(seconds: 2));
    _isMockConnected = true;
    return {"success": true};
  }

  /// Get GSC connection status for a project.
  Future<Map<String, dynamic>> getStatus(String projectId) async {
    // HARDCODE MOCK DATA
    await Future.delayed(const Duration(milliseconds: 500));
    return {
      "connected": _isMockConnected,
      "scopes": ["https://www.googleapis.com/auth/webmasters.readonly"],
      "isValid": _isMockConnected
    };
  }

  /// List accessible GSC properties for a connected project.
  Future<List<Map<String, dynamic>>> getSites(String projectId) async {
    // HARDCODE MOCK DATA
    await Future.delayed(const Duration(milliseconds: 800));
    return [
      {"siteUrl": "https://www.example-demo.com/", "permissionLevel": "siteOwner"},
      {"siteUrl": "https://blog.example-demo.com/", "permissionLevel": "siteOwner"},
      {"siteUrl": "sc-domain:example-demo.com", "permissionLevel": "siteFullUser"}
    ];
  }

  /// Get the GSC property linked to a project.
  /// Returns null if no property is linked.
  Future<Map<String, dynamic>?> getLinkedSite(String projectId) async {
    // HARDCODE MOCK DATA
    await Future.delayed(const Duration(milliseconds: 600));
    return _mockLinkedSite;
  }

  /// Link a GSC property to a project.
  Future<Map<String, dynamic>> linkSite(Map<String, dynamic> data) async {
    // HARDCODE MOCK DATA
    await Future.delayed(const Duration(seconds: 1));
    _mockLinkedSite = data;
    return {"success": true};
  }

  /// Disconnect Google Search Console for a project.
  Future<Map<String, dynamic>> disconnect(String projectId) async {
    // HARDCODE MOCK DATA
    await Future.delayed(const Duration(seconds: 1));
    _isMockConnected = false;
    _mockLinkedSite = null;
    return {"success": true};
  }
}
