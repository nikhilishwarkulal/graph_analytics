library analytics;

import 'package:flutter/foundation.dart';
import 'package:graph_analytics/app_application.dart';
import 'package:http/http.dart';

class GraphAnalytics {
  static Future<void> init({
    required String appCollectionId,
    required String id,
    required String accessToken,
    required String appAccessToken,
  }) async {
    Map<String, String> body = {
      'id': id,
      'acessToken': accessToken,
      'appCollectionId': appCollectionId,
      'appAccessToken': appAccessToken,
    };

    Response r = await post(
      Uri.parse("http://192.168.0.146:3000/api/graph/authPorcess"),
      body: body,
    );
    _cachedAppApplication = AppApplication.fromRawJson(r.body);
  }

  static AppApplication? _cachedAppApplication;
  static bool isInitialized() {
    return (_cachedAppApplication != null);
  }

  static void logNavigation({required String from, required String to}) {
    if (!isInitialized() && _cachedAppApplication?.id == null) {
      if (kDebugMode) {
        print("[GraphAnalytics] Error : Not Initialized");
      }
      return;
    }
    Map<String, String> body = {
      'appCollectionId': _cachedAppApplication!.id!,
      'type': "nav",
      'from': from,
      'to': to,
    };

    post(
      Uri.parse("http://192.168.0.146:3000/api/graph/log"),
      body: body,
    );
  }

  static void logScreenInfo(
      {required String screenName, required String methodName}) {
    if (!isInitialized() && _cachedAppApplication?.id == null) {
      if (kDebugMode) {
        print("[GraphAnalytics] Error : Not Initialized");
      }
      return;
    }
    Map<String, String> body = {
      'appCollectionId': _cachedAppApplication!.id!,
      'type': "child",
      'from': screenName,
      'to': methodName,
    };

    post(
      Uri.parse("http://192.168.0.146:3000/api/graph/log"),
      body: body,
    );
  }
}
