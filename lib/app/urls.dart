import 'dart:convert';

class Urls {
  static const String _baseUrl = 'https://ecom-rs8e.onrender.com/api';
  static const String signUpUrl = '$_baseUrl/auth/signup';
  static const String verifyOtpUrl = '$_baseUrl/auth/verify-otp';
  static const String resendOtpUrl = '$_baseUrl/auth/resend-otp';
  static const String sliderUrl = '$_baseUrl/slides';

  static String categoryUrl({required int count, required int page}) =>
      '$_baseUrl/categories?count=$count&page=$page';

  static String productListByCategoryUrl(
      {required int count, required int page, required String categoryId}) =>
      '$_baseUrl/products?count=$count&page=$page&category=$categoryId';
}
