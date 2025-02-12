import 'package:get/get.dart';

class Global {
  static String? token;
  static String? userId;
  static String? firstName;
  static String? lastName;
  static String? email;
  static String? role;
  static String? competitionStatus;
  static String? profileUrl;
  static String? business;
  static String? businessID;
  static String? location;
  static String? locationID;
  static RxBool isInternetConnected = true.obs;

  static void clearData() {
    token = null;
    userId = null;
    firstName = null;
    lastName = null;
    email = null;
    role = null;
    competitionStatus = null;
    profileUrl = null;
    business = null;
    businessID = null;
    location = null;
    locationID = null;
  }
}
