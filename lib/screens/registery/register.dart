import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/component.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  final FirebaseAuth credential = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
            padding: const EdgeInsets.only(left: 35, top: 100),
            child: const Text(
              "Create\nAccount",
              style: TextStyle(color: Colors.white, fontSize: 33),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  right: 35,
                  left: 35,
                  top: MediaQuery.of(context).size.height * 0.27),
              child: Form(
                key: formKey,
                child: Column(children: [
                  dufaltFormField(
                    hintText: 'name',
                    icon: const Icon(
                      Icons.account_circle_outlined,
                      color: Colors.black,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    label: const Text(
                      'name',
                      style: TextStyle(color: Colors.black),
                    ),
                    validat: (value) {
                      if (value!.isEmpty) {
                        return 'pleas enter Your name  ';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  dufaltFormField(
                      controller: _emailController,
                      label: const Text('E-Mail',
                          style: TextStyle(color: Colors.black)),
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
                      hintText: 'E-Mail',
                      icon: const Icon(
                        Icons.email,
                        color: Colors.black,
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  dufaltFormField(
                    keyboardType: TextInputType.visiblePassword,
                    validat: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return 'Enter Coract password or pass dont macth ';
                      }
                      return null;
                    },
                    hintText: 'Password',
                    icon: const Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    controller: _passwordController,
                    label: const Text(
                      'Password',
                      style: TextStyle(color: Colors.black),
                    ),
                    obscureText: isPassword,
                    prefixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      icon: isPassword
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: const Color(0xff4c505b),
                          child: IconButton(
                            color: Colors.white,
                            onPressed: _registerUser,
                            icon: const Icon(Icons.arrow_forward),
                          ),
                        ),
                      ]),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            // navigat to login Screen
                            Navigator.pushNamed(context, 'MyLogin');
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              color: Colors.white,
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

//Function for register new user use fire base FirebaseAuth
  void _registerUser() async {
    if (formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        if (userCredential.user != null) {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacementNamed(context, 'MyHomePage');
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('The email address is already in use.'),
            ),
          );
        } else {
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
