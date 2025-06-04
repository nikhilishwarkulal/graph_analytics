library analytics;

import 'package:flutter/foundation.dart';
import 'package:graph_analytics/app_application.dart';
import 'package:http/http.dart';

class GraphAnalytics {
  /// [id],[appCollectionId],[accessToken],[appAccessToken] you will get it when you download the
  /// also default timeout to initialise is 3 seconds you can set the timeout,
  static Future<void> init({
    required String appCollectionId,
    required String id,
    required String accessToken,
    required String appAccessToken,
    int timeOut = 3,
  }) async {
    Map<String, String> body = {
      'id': id,
      'acessToken': accessToken,
      'appCollectionId': appCollectionId,
      'appAccessToken': appAccessToken,
    };

    try {
      Response r = await post(
        Uri.parse("https://analytics.pulsecode.in/api/graph/authPorcess"),
        body: body,
      ).timeout(Duration(seconds: timeOut));
      print(r.body);
      _cachedAppApplication = AppApplication.fromRawJson(r.body);
    } catch (err) {
      if (kDebugMode) {
        print("[GraphAnalytics] Error : $err");
      }
    }
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
    try {
      Map<String, String> body = {
        'appCollectionId': _cachedAppApplication!.id!,
        'type': "nav",
        'from': from,
        'to': to,
      };

      post(
        Uri.parse("https://analytics.pulsecode.in/api/graph/log"),
        body: body,
      );
    } catch (err) {
      if (kDebugMode) {
        print("[GraphAnalytics] Error : $err");
      }
    }
  }

  static void logScreenInfo(
      {required String screenName, required String methodName}) {
    if (!isInitialized() && _cachedAppApplication?.id == null) {
      if (kDebugMode) {
        print("[GraphAnalytics] Error : Not Initialized");
      }
      return;
    }
    try {
      Map<String, String> body = {
        'appCollectionId': _cachedAppApplication!.id!,
        'type': "child",
        'from': screenName,
        'to': methodName,
      };

      post(
        Uri.parse("https://analytics.pulsecode.in/api/graph/log"),
        body: body,
      );
    } catch (err) {
      if (kDebugMode) {
        print("[GraphAnalytics] Error : $err");
      }
    }
  }
}
