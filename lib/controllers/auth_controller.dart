import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/routes/name_routes.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  // Define the RxBool to control password visibility
  var isObscure = true.obs;

  // Method to toggle password visibility
  void togglePasswordVisibility() {
    isObscure.value = !isObscure.value;
  }

  void login(String email, String password) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (myUser.user!.emailVerified) {
        Get.offAllNamed(RouteName.dashboard);
      } else {
        Get.snackbar(
          "PERHATIAN!",
          "Lakukan verifikasi email terlebih dahulu",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.amber,
          colorText: Colors.black,
          duration: Duration(seconds: 3),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.snackbar(
          "TERJADI KESALAHAN!",
          "Tidak ada akun yang terdaftar dengan email tersebut",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.snackbar(
          "PERHATIAN!",
          "Password yang Anda masukan salah",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.amber,
          colorText: Colors.black,
          duration: Duration(seconds: 3),
        );
      } else if (e.code == 'too-many-requests') {
        print('Too many requests. Try again later.');
        Get.snackbar(
          "PERHATIAN!",
          "Terlalu banyak permintaan. Coba lagi nanti.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.amber,
          colorText: Colors.black,
          duration: Duration(seconds: 3),
        );
      } else {
        print('Login error: ${e.message}');
        Get.snackbar(
          "TERJADI KESALAHAN!",
          "Gagal melakukan login: ${e.message}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );
      }
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(RouteName.login);
  }

  void resetPassword(String email) async {
    if (email.isNotEmpty && GetUtils.isEmail(email)) {
      try {
        await auth.sendPasswordResetEmail(email: email);
        Get.snackbar(
          "BERHASIL",
          "Tautan untuk mereset password sudah dikirimkan ke $email",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );
        Get.offAllNamed(RouteName.login);
      } catch (e) {
        Get.snackbar(
          "Terjadi Kesalahan",
          "Tidak dapat mengirimkan reset password",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );
      }
    } else {
      Get.snackbar(
        "Terjadi Kesalahan",
        "Email tidak valid.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
    }
  }

  void signup(String email, String password) async {
    try {
      UserCredential myUser =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await myUser.user!.sendEmailVerification();
      Get.snackbar(
        "NOTIFIKASI",
        "Email verifikasi telah dikirimkan ke $email",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
      Get.offAllNamed(RouteName.login);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.snackbar(
          "PERHATIAN",
          "Keamanan password rendah",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.amber,
          colorText: Colors.black,
          duration: Duration(seconds: 3),
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.snackbar(
          "PERHATIAN",
          "Email sudah pernah didaftarkan",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.amber,
          colorText: Colors.black,
          duration: Duration(seconds: 3),
        );
      }
    } catch (e) {
      print(e);
      Get.snackbar(
        "Terjadi Kesalahan",
        "Tidak dapat mendaftarkan akun",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
    }
  }

  void changePassword(
      String currentPassword, String email, String newPassword) async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        AuthCredential credential = EmailAuthProvider.credential(
            email: user.email!, password: currentPassword);
        await user.reauthenticateWithCredential(credential);
        await user.updatePassword(newPassword);
        Get.snackbar(
          "BERHASIL",
          "Kata sandi berhasil diubah",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );
        Get.offAllNamed(RouteName.login);
      } else {
        Get.snackbar(
          "TERJADI KESALAHAN",
          "Tidak dapat mengambil data pengguna saat ini",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        Get.snackbar(
          "PERHATIAN!",
          "Kata sandi sekarang yang Anda masukan salah",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.amber,
          colorText: Colors.black,
          duration: Duration(seconds: 3),
        );
      } else {
        Get.snackbar(
          "Terjadi Kesalahan",
          "Gagal mengubah kata sandi: ${e.message}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );
      }
    }
  }
}