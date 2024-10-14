import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:liedle/app/modules/home/views/home_view.dart';

import '../../../routes/app_pages.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isRemembered = false;
  bool _isSecurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.LOGIN);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        'Selamat datang',
                        style: GoogleFonts.redressed(
                            fontSize: 35,
                            color: const Color.fromARGB(255, 0, 0, 255)),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(
                      25, 0, 0, 0), // Set your desired margin here
                  child: Row(
                    children: [
                      const Text('Belum Punya Akun?'),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes
                              .REGISTER); // Add your onPressed functionality here
                        },
                        child: const Text('Daftar'),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Email Address',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    obscureText: _isSecurePassword,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                        suffixIcon: togglePassword()),
                  ),
                ),
                CheckboxListTile(
                  title: const Text("Remember Me"),
                  value: _isRemembered,
                  onChanged: (bool? value) {
                    setState(() {
                      _isRemembered = value ?? false;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Colors.blue, Colors.black]),
                      borderRadius: BorderRadius.circular(25)),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(HomeView());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent),
                    child: const Text(
                      'Masuk',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecurePassword = !_isSecurePassword;
        });
      },
      icon: _isSecurePassword
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
      color: Colors.grey,
    );
  }
}
