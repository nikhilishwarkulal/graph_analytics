import 'package:flutter_test/flutter_test.dart';
import 'package:graph_analytics/analytics.dart';

void main() async {
  test('adds one to input values', () async {
    print("-----Start-----");
    await GraphAnalytics.init(
      appCollectionId: "",
      id: "",
      accessToken: "",
      appAccessToken: "",
      timeOut: 3,
    );
    print("-----Stop-----");
    GraphAnalytics.logNavigation(from: "splash", to: "login");
    GraphAnalytics.logNavigation(from: "login", to: "home");
    GraphAnalytics.logNavigation(from: "login", to: "otp");
    GraphAnalytics.logNavigation(from: "otp", to: "home");
    GraphAnalytics.logScreenInfo(
        screenName: "splash", methodName: "splashAddClicked");
    GraphAnalytics.logScreenInfo(
        screenName: "login", methodName: "termsAndConditionClicked");
    GraphAnalytics.logScreenInfo(
        screenName: "otp", methodName: "resendButtonClicked");
    GraphAnalytics.logScreenInfo(
        screenName: "otp", methodName: "otpTimeOutHappened");
    GraphAnalytics.logScreenInfo(
        screenName: "home", methodName: "userLogoutTapped");
    GraphAnalytics.logScreenInfo(
        screenName: "home", methodName: "userKilledApp");
    await Future.delayed(Duration(seconds: 10));
  });
}
