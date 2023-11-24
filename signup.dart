// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:my_firebase_app/widgets/custom_button.dart';
import 'package:my_firebase_app/widgets/custom_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formState,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //  mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60.0, top: 40),
                  child:
                      Image.asset('images/login.png', width: 250, height: 250),
                ),
                Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'Sign up To Continue Using The App',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextForm(
                    hinttext: 'Enter your email',
                    mycontroller: email,
                    validator: (val) {
                      if (val?.length == 0) {
                        return "Can't Be Empty";
                      }
                    },
                    myIcon: Icon(Icons.email)),
                SizedBox(
                  height: 20,
                ),
                CustomTextForm(
                    hinttext: 'Enter your password',
                    mycontroller: password,
                    validator: (val) {
                      if (val?.length == 0) {
                        return "Can't Be Empty";
                      }
                    },
                    myIcon: Icon(Icons.lock)),

                // CustomTextForm(
                //     hinttext: 'Confirm your password',
                //     mycontroller: confirmPassword,
                //     validator: null,
                //     myIcon: Icon(Icons.lock)),
                SizedBox(
                  height: 20,
                ),
                CustomButtonAuth(
                  title: "Sign Up",
                  onPressed: () async {
                    if (formState.currentState!.validate()) {
                      try {
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: email.text,
                          password: password.text,
                        );
                        Navigator.pushReplacementNamed(context, 'homepage');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }
                    } else {
                      print('error');
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'You already have account ? ',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'login');
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff432870),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'OR',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 15,
                              color: Colors.grey,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'images/google.svg',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 15,
                              color: Colors.grey,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'images/facebook.svg',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 15,
                              color: Colors.grey,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'images/apple.svg',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
