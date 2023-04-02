part of 'api.dart';

class ApiUrl {
  static String baseUrl = "https://websnapy.net/snapy/public/api";
  static String registerUrl = '$baseUrl/register';
  static String profileUrl = '$baseUrl/profile';
  static String loginUrl = '$baseUrl/login';
  static String otpVerificationUrl = '$baseUrl/otp';
  static String otpRequestUrl = '$baseUrl/otp-request';
  static String logoutUrl = '$baseUrl/logout';
  static String branchesUrl = '$baseUrl/branches';
  static String productCategoryUrl = '$baseUrl/product-categories';
  static String productUrl = '$baseUrl/products/';
  static String servicesUrl = '$baseUrl/services';
  static String bannersUrl = '$baseUrl/banners';
  static String resetPasswordUrl = '$baseUrl/send-verification';
  static String deleteAccountUrl = '$baseUrl/delete-account';

}