import 'package:get/get.dart';
import 'package:markaz_snappy/modules/Branch/Branch.dart';
import 'package:markaz_snappy/modules/EditProfileScreen/EditProfileScreen.dart';
import 'package:markaz_snappy/modules/ForgetPassword/ForgetPassword.dart';
import 'package:markaz_snappy/modules/HomeScreen/HomeScreen.dart';
import 'package:markaz_snappy/modules/LoginScreen/LoginScreen.dart';
import 'package:markaz_snappy/modules/MainScreen/MainScreen.dart';
import 'package:markaz_snappy/modules/OtpScreen/OtpScreen.dart';
import 'package:markaz_snappy/modules/Product/Product.dart';
import 'package:markaz_snappy/modules/RegisterScreen/RegisterScreen.dart';
import 'package:markaz_snappy/screens/Branch.dart';
import 'package:markaz_snappy/screens/EditProfileScreen.dart';
import 'package:markaz_snappy/screens/ForgetPassword.dart';
import 'package:markaz_snappy/screens/HomeScreen.dart';
import 'package:markaz_snappy/screens/LoginScreen.dart';
import 'package:markaz_snappy/screens/MainScreen.dart';
import 'package:markaz_snappy/screens/OtpScreen.dart';
import 'package:markaz_snappy/screens/ProductCategory.dart';
import 'package:markaz_snappy/screens/RegisterScreen.dart';

import '../modules/ProductCategory/ProductCategory_bindings.dart';
import '../modules/splash_screen/splash_screen_bindings.dart';
import '../screens/Product.dart';
import '../screens/splash.dart';

class Routes {
  static const String root = '/';
  static const String loginScreen = "/login_screen";
  static const String registerScreen = "/register_screen";
  static const String forgetPasswordScreen = "/forget_password_screen";
  static const String mainScreen = "/main_screen";
  static const String editProfileScreen = "/edit_profile_screen";
  static const String productCategory = "/product_category";
  static const String product = "/product";
  static const String branch = "/branch";
  static const String otpScreen = "/otp_screen";
}

final List<GetPage> routes = [
  GetPage(name: Routes.root, page: () => Splash(Get.find()), binding: Splash_screenBindings()),
  GetPage(name: Routes.loginScreen, page: () => LoginScreen(Get.find()), binding: LoginScreenBindings()),
  GetPage(name: Routes.registerScreen, page: () => RegisterScreen(Get.find()), binding: RegisterScreenBindings()),
  GetPage(name: Routes.forgetPasswordScreen, page: () => ForgetPassword(Get.find()), binding: ForgetPasswordBindings()),
  GetPage(name: Routes.mainScreen, page: () => MainScreen(Get.find()), binding: MainScreenBindings()),
  GetPage(name: Routes.editProfileScreen, page: () => EditProfileScreen(Get.find()), binding: EditProfileScreenBindings()),
  GetPage(name: Routes.productCategory, page: () => ProductCategory(Get.find()), binding: ProductCategoryBindings()),
  GetPage(name: Routes.product, page: () => Product(Get.find()), binding: ProductBindings()),
  GetPage(name: Routes.branch, page: () => Branch(Get.find()), binding: BranchBindings()),
  GetPage(name: Routes.otpScreen, page: () => OtpScreen(Get.find()), binding: OtpScreenBindings()),
];