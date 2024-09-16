import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/routes/name_routes.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/auth_controller.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[200],
        elevation: 0,
        title: Text(
          'Dashboard',
          style: GoogleFonts.istokWeb(
            fontSize: 16 * ffem,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Get.toNamed(RouteName.notification);
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Get.toNamed(RouteName.profile);
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightGreen[200]!, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/dashboard-setelah-berhasil-login/images/logo-el-fert.png',
                width: 270 * fem,
                height: 200 * fem,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20 * fem),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteName.monitoring);
                },
                child: Column(
                  children: [
                    Icon(Icons.monitor,
                        size: 50 * fem,
                        color: Colors.white), // Change icon color to white
                    SizedBox(height: 10 * fem),
                    Text(
                      'Monitoring Penggunaan',
                      style: GoogleFonts.istokWeb(
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w700,
                        color: Colors.white, // Change text color to white
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff63ac73),
                  padding: EdgeInsets.symmetric(
                    vertical: 15 * fem,
                    horizontal: 30 * fem,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20 * fem),
                  ),
                ),
              ),
              SizedBox(height: 20 * fem),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteName.aboutDevice);
                },
                child: Column(
                  children: [
                    Icon(Icons.info,
                        size: 50 * fem,
                        color: Colors.white), // Change icon color to white
                    SizedBox(height: 10 * fem),
                    Text(
                      'Informasi Alat',
                      style: GoogleFonts.istokWeb(
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w700,
                        color: Colors.white, // Change text color to white
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff63ac73),
                  padding: EdgeInsets.symmetric(
                    vertical: 15 * fem,
                    horizontal: 70 * fem,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20 * fem),
                  ),
                ),
              ),
              SizedBox(height: 20 * fem),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteName.kendali); // Add this line
                },
                child: Column(
                  children: [
                    Icon(Icons.settings,
                        size: 50 * fem,
                        color: Colors.white), // Change icon color to white
                    SizedBox(height: 10 * fem),
                    Text(
                      'Kendali Alat',
                      style: GoogleFonts.istokWeb(
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w700,
                        color: Colors.white, // Change text color to white
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff63ac73),
                  padding: EdgeInsets.symmetric(
                    vertical: 12 * fem,
                    horizontal: 80 * fem,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20 * fem),
                  ),
                ),
              ),
              SizedBox(height: 3 * 16 * ffem), // Jarak sekitar 5cm
              ElevatedButton.icon(
                onPressed: () {
                  _signOut();
                },
                icon: Icon(Icons.logout,
                    color: Colors.white), // Change icon color to white
                label: Text('Sign Out',
                    style: TextStyle(
                        color: Colors.white)), // Change text color to white
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff63ac73),
                  padding: EdgeInsets.symmetric(
                    vertical: 15 * fem,
                    horizontal: 70 * fem,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20 * fem),
                  ),
                ),
              ),
              SizedBox(height: 3 * 16 * ffem), // Jarak sekitar 5cm
            ],
          ),
        ),
      ),
    );
  }

  void _signOut() {
    AuthController authController = Get.find<AuthController>();
    authController.logout();
    // You can add additional sign-out logic here if needed
    // For example, navigating to the login page
    Get.offAllNamed(RouteName.login);
  }
}
