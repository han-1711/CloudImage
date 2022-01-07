import 'package:get/get.dart';

import '../modules/addgambar/bindings/addgambar_binding.dart';
import '../modules/addgambar/views/addgambar_view.dart';
import '../modules/galeri/bindings/galeri_binding.dart';
import '../modules/galeri/views/galeri_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/registrasi/bindings/registrasi_binding.dart';
import '../modules/registrasi/views/registrasi_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRASI,
      page: () => RegistrasiView(),
      binding: RegistrasiBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.GALERI,
      page: () => GaleriView(),
      binding: GaleriBinding(),
    ),
    GetPage(
      name: _Paths.ADDGAMBAR,
      page: () => AddgambarView(),
      binding: AddgambarBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
  ];
}
