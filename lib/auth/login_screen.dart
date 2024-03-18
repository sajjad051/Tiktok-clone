import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:tiktok_clone/widgets/input_text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  bool showProgressBar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),

            Image.asset(
              "images/tiktok.png",
              width: 200,
            ),

            Text("Welcome",
                style: GoogleFonts.acme(
                  fontSize: 34,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                )),

            Text("Glad to see you!",
                style: GoogleFonts.acme(
                  fontSize: 34,
                  color: Colors.grey,
                )),

            const SizedBox(height: 30),

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
                              'Login',
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
                            'Don\'t have an account ? ',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          InkWell(
                            onTap: () {
                              // send user to sign up page
                            },
                            child: Text(
                              'sign up',
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
