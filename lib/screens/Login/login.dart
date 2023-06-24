// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/component.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  bool isPassword = true;
  TextEditingController passcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
            padding: const EdgeInsets.only(left: 35, top: 80),
            child: const Text(
              "Welcome\nBack",
              style: TextStyle(color: Colors.white, fontSize: 33),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  right: 35,
                  left: 35,
                  top: MediaQuery.of(context).size.height * 0.5),
              child: Form(
                key: formkey,
                child: Column(children: [
                  dufaltFormField(
                    controller: emailcontroller,
                    hintText: 'Email',
                    icon: const Icon(Icons.email),
                    keyboardType: TextInputType.emailAddress,
                    validat: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      // Use a regular expression to check for a valid email format
                      // Here's a simple example, but you can use a more comprehensive regex pattern
                      // to validate the email format according to your requirements
                      const emailRegex =
                          r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
                      if (!RegExp(emailRegex).hasMatch(value)) {
                        return 'Invalid Email. Please check your email format.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  dufaltFormField(
                      controller: passcontroller,
                      obscureText: isPassword,
                      prefixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                        // here change Password visibility if isPassword = true  obscureText visibility : isPassword = false  obscureText visibility_off
                        icon: isPassword
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      ),
                      hintText: 'Password',
                      icon: const Icon(Icons.lock),
                      keyboardType: TextInputType.visiblePassword,
                      validat: (String? value) {
                        //a validet For password
                        if (value!.isEmpty || value.length < 6) {
                          return 'Invalid Password. Password must be at least 6 characters long. ';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Color(0xff4c505b),
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xff4c505b),
                        child: IconButton(
                          color: Colors.white,
                          onPressed: signInUser,
                          icon: const Icon(Icons.arrow_forward),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'register');
                          },
                          child: const Text(
                            'register',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              color: Color(0xff4c505b),
                            ),
                          ),
                        ),
                      ]),
                ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void signInUser() async {
    if (formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text,
          password: passcontroller.text,
        );
        if (userCredential.user != null) {
          // تم تسجيل الدخول بنجاح، يمكنك التنقل إلى الصفحة الرئيسية
          Navigator.pushReplacementNamed(context, 'MyHomePage',
              arguments: userCredential);
          print(userCredential.user!.email);
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 3),
              content: Text('No user found for that email.'),
            ),
          );
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Wrong password provided for that user.'),
            ),
          );
        } else {
          // حدث خطأ غير متوقع
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('An unexpected error occurred. Please try again.'),
            ),
          );
        }
      }
    }
  }
}
