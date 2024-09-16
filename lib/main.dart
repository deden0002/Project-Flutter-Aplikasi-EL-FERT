import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/auth_controller.dart';
import 'package:myapp/routes/routes_page.dart';
import 'package:myapp/routes/name_routes.dart';
import 'package:myapp/Pages/halaman-splash/halaman-splash.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Inisialisasi FlutterLocalNotificationsPlugin
  var initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettingsIOS = DarwinInitializationSettings();
  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
    print('Notification clicked');
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashPage();
          } else {
            return StreamBuilder<User?>(
              stream: authC.streamAuthStatus,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  print(snapshot.data);

                  return GetMaterialApp(
                    debugShowCheckedModeBanner: false,
                    initialRoute: snapshot.data != null &&
                            snapshot.data!.emailVerified == true
                        ? RouteName.dashboard
                        : RouteName.login,
                    getPages: AppPage.pages,
                  );
                }
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}