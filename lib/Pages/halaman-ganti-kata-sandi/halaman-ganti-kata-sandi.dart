import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/auth_controller.dart';

class ChangePasswordPage extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();

  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[200],
        elevation: 0,
        title: Text('Ganti Kata Sandi'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightGreen[200]!, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Image.asset(
                  'assets/halaman-ganti-kata-sandi/images/rectangle-28-1E5.png',
                  width: 200,
                  height: 180,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Text(
                  'Ganti Kata Sandi',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                _buildTextField(
                  controller: _currentPasswordController,
                  label: 'Kata Sandi Sekarang',
                  obscureText: true,
                ),
                SizedBox(height: 10),
                _buildTextField(
                  controller: _emailController,
                  label: 'Email',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                Obx(() => _buildTextField(
                      controller: _newPasswordController,
                      label: 'Kata Sandi Baru',
                      obscureText: _authController.isObscure.value,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _authController.isObscure.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: _authController.togglePasswordVisibility,
                      ),
                    )),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _authController.changePassword(
                      _currentPasswordController.text.trim(),
                      _emailController.text.trim(),
                      _newPasswordController.text.trim(),
                    );
                  },
                  child: Text('Ganti Kata Sandi'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    onPrimary: Colors.white,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
