import 'package:get/get.dart';
import 'package:myapp/Pages/halaman-login/halaman-login.dart';
import 'package:myapp/routes/name_routes.dart';
import 'package:myapp/Pages/halaman-daftar/halaman-daftar.dart';
import 'package:myapp/Pages/dashboard-setelah-berhasil-login/dashboard-setelah-berhasil-login.dart';
import 'package:myapp/Pages/halaman-lupa-kata-sandi/halaman-lupa-kata-sandi.dart';
import 'package:myapp/Pages/halaman-kendali/halaman-kendali.dart';
import 'package:myapp/Pages/halaman-monitoring/halaman-monitoring.dart';
import 'package:myapp/Pages/halaman-ganti-kata-sandi/halaman-ganti-kata-sandi.dart';
import 'package:myapp/Pages/halaman-notifikasi/halaman-notifikasi.dart';
import 'package:myapp/Pages/halaman-profil/halaman-profil.dart';
import 'package:myapp/Pages/grafikhistory/grafik.dart';
import 'package:myapp/Pages/aboutdevice/aboutdevice.dart';
import '../modules/halaman-login/bindings/login_binding.dart';
import '../modules/halaman-daftar/bindings/register_binding.dart';
import '../modules/halaman-ganti-kata-sandi/bindings/changepassword_binding.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/halaman-lupa-kata-sandi/bindings/forgotpassword_binding.dart';
import '../modules/halaman-notifikasi/bindings/notification_binding.dart';
import '../modules/halaman-monitoring/bindings/monitoring_binding.dart';
import '../modules/halaman-profil/bindings/profile_binding.dart';
import '../modules/aboutdevice/bindings/aboutdevice_binding.dart';
import '../modules/halaman-kendali/bindings/kendali_binding.dart';
import '../modules/grafikhistory/bindings/grafik_binding.dart';

class AppPage {
  static final List<GetPage> pages = [
    GetPage(
      name: RouteName.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RouteName.register,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: RouteName.forgotPassword,
      page: () => ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: RouteName.changePassword,
      page: () => ChangePasswordPage(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: RouteName.dashboard,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: RouteName.profile,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: RouteName.monitoring,
      page: () => MonitoringPage(),
      binding: MonitoringBinding(),
    ),
    GetPage(
      name: RouteName.notification,
      page: () => NotificationPage(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: RouteName.aboutDevice,
      page: () => AboutDevicePage(),
      binding: AboutDeviceBinding(),
    ),
    GetPage(
      name: RouteName.kendali,
      page: () => KendaliPage(),
      binding: KendaliBinding(),
    ),
      GetPage(
      name: RouteName.grafik,
      page: () => GrafikPage(),
      binding: GrafikBinding(),
    ),
  ];
}
