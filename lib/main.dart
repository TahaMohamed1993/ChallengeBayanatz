import 'package:challenge_bayanatz/screens/Login/login.dart';
import 'package:challenge_bayanatz/screens/home/home_screen.dart';
import 'package:challenge_bayanatz/screens/registery/register.dart';
import 'package:challenge_bayanatz/styles/themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

bool? isLogin;
bool isDark = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    isLogin = false;
  } else {
    isLogin = true;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CHALLENGE',
      // ignore: dead_code
      themeMode: isDark ? ThemeMode.light : ThemeMode.dark,
      darkTheme: TAppTheme.darkTheme,
      theme: TAppTheme.lightTheme,
      home: isLogin == false ? const MyLogin() : const MyHomePage(),
      routes: {
        'MyLogin': (context) => const MyLogin(),
        'register': (context) => const MyRegister(),
        'MyHomePage': (context) => const MyHomePage(),
      },
    );
  }
}
