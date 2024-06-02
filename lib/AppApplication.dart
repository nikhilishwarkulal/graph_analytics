import 'dart:convert';

class AppApplication {
  final String? id;
  final String? loginId;
  final String? appAccessToken;
  final int? points;
  final String? appName;
  final String? appApplicationId;
  final String? platform;
  final bool? paymentConfigured;
  final int? v;

  AppApplication({
    this.id,
    this.loginId,
    this.appAccessToken,
    this.points,
    this.appName,
    this.appApplicationId,
    this.platform,
    this.paymentConfigured,
    this.v,
  });

  factory AppApplication.fromRawJson(String str) =>
      AppApplication.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AppApplication.fromJson(Map<String, dynamic> json) => AppApplication(
        id: json["_id"],
        loginId: json["loginId"],
        appAccessToken: json["appAccessToken"],
        points: json["points"],
        appName: json["appName"],
        appApplicationId: json["appApplicationId"],
        platform: json["platform"],
        paymentConfigured: json["paymentConfigured"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "loginId": loginId,
        "appAccessToken": appAccessToken,
        "points": points,
        "appName": appName,
        "appApplicationId": appApplicationId,
        "platform": platform,
        "paymentConfigured": paymentConfigured,
        "__v": v,
      };
}
