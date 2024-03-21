import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:tiktok_clone/auth/auth_controller.dart';
import 'package:tiktok_clone/auth/login_screen.dart';

import '../widgets/input_text_widget.dart';

class RegistrationScreen extends StatefulWidget {


  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  bool showProgressBar = false;

  var authController = AuthController.instanceAuth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 100),


                Text("Create Account",
                    style: GoogleFonts.acme(
                      fontSize: 34,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    )),

                Text("to get Started Now!",
                    style: GoogleFonts.acme(
                      fontSize: 34,
                      color: Colors.grey,
                    )),
                const SizedBox(height: 15),

                GestureDetector(
                  onTap: () {
                  // allaw user to choose image
                    authController.chooseImageFromGallery();
                  },
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("images/profile_avatar.jpg"),
                    backgroundColor: Colors.black,
                  ),
                ),

                const SizedBox(height: 30),

                //user name input
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: InputTextWidget(
                      textEditingController: nameTextEditingController,
                      lableString: 'User name',
                      iconData: Icons.account_box,
                      isObscure: false),
                ),
                const SizedBox(height: 25),

                //email input
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: InputTextWidget(
                      textEditingController: emailTextEditingController,
                      lableString: 'Email',
                      iconData: Icons.email_outlined,
                      isObscure: false),
                ),
                const SizedBox(height: 25),
                //password Input
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: InputTextWidget(
                      textEditingController: passwordTextEditingController,
                      lableString: 'Password',
                      iconData: Icons.lock_outlined,
                      isObscure: true),
                ),

                const SizedBox(
                  height: 20,
                ),

                // login button
                // don't have an account button

                showProgressBar == false
                    ? Column(
                  children: [
                    //login
                    Container(
                      width: MediaQuery.of(context).size.width - 38,
                      height: 54,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            showProgressBar = true;
                          });
                        },
                        child: const Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
//               don't have an account sign up now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(LoginScreen());
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
                    : Container(
                  // show animation
                  child: SimpleCircularProgressBar(
                    progressColors: [
                      Colors.green,
                      Colors.white,
                      Colors.blue,
                      Colors.red,
                      Colors.blueAccent,
                    ],
                    animationDuration: 3,
                    backColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
