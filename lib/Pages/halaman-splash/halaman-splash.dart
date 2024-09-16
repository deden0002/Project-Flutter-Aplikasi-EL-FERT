import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/routes/name_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key});

  @override
  Widget build(BuildContext context) {
    // Tunggu selama 3 detik
    Future.delayed(Duration(seconds: 3), () {
      // Periksa status login pengguna
      if (FirebaseAuth.instance.currentUser != null) {
        // Jika sudah login, pindah ke halaman dashboard
        Get.offAllNamed(RouteName.dashboard);
      } else {
        // Jika belum login, pindah ke halaman login
        Get.offAllNamed(RouteName.login);
      }
    });

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Image.asset(
            'assets/halaman-splash/images/rectangle-1.png',
            width: 300,
            height: 300,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
