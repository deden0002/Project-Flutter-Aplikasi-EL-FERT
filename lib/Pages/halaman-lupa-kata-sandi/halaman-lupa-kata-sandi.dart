import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/auth_controller.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final AuthController _authController = Get.find<AuthController>();

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double baseWidth = 300;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[200],
        elevation: 0,
        title: Text(
          'Forgot Password',
          style: TextStyle(color: Color(0xff000000)),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
          color: Color(0xff000000),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.lightGreen[200]!,
              Colors.white,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Image.asset(
                'assets/halaman-lupa-kata-sandi/images/logo-el-fert-AmK.png',
                width: 270 * fem,
                height: 200 * fem,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                'RESET PASSWORD',
                style: TextStyle(
                  fontSize: 20 * ffem,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffcd2d37),
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20 * fem),
                padding: EdgeInsets.all(10 * fem),
                decoration: BoxDecoration(
                  color: Color(0xffd9d9d9),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'E-mail:',
                      style: TextStyle(
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _authController.resetPassword(_emailController.text.trim());
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 10),
              Text(
                'atau',
                style: TextStyle(
                  fontSize: 15 * ffem,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
